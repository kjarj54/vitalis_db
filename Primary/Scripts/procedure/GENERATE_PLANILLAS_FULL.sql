CREATE OR REPLACE PROCEDURE generar_planillas_completas (
    p_mes      IN NUMBER,
    p_anio     IN NUMBER,
    p_usuario  IN VARCHAR2 DEFAULT 'SISTEMA'
) AS
    v_pla_id                 NUMBER;

    -- totales a nivel de planilla (acumulados)
    v_tot_ingresos_planilla  NUMBER := 0;
    v_tot_ded_planilla       NUMBER := 0;
    v_tot_neto_planilla      NUMBER := 0;

    -- totales a nivel de persona (por iteracion)
    v_ing_turnos             NUMBER := 0;  -- ingresos por turnos
    v_ing_procs              NUMBER := 0;  -- ingresos por procedimientos medicos
    v_ing_total_persona      NUMBER := 0;  -- bruto persona (turnos + procedimientos)
    v_ded_total_persona      NUMBER := 0;  -- suma de deducciones aplicadas
    v_neto_persona           NUMBER := 0;

    v_tipo_personal          VARCHAR2(50);
    v_nombre_planilla        VARCHAR2(200);
BEGIN
  -- 1) recorrer por tipo de personal normalizado (M/A)
  FOR tipo_rec IN (
      SELECT DISTINCT
             CASE WHEN UPPER(SUBSTR(TRIM(per_tipo_personal),1,1)) = 'M' THEN 'M' ELSE 'A' END AS per_tipo_personal
      FROM VITALIS_SCHEMA.vitalis_personas
      WHERE per_tipo_personal IS NOT NULL
  ) LOOP
    v_tipo_personal := tipo_rec.per_tipo_personal;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(' Generando planilla para: '||CASE v_tipo_personal WHEN 'M' THEN 'MEDICOS' ELSE 'ADMINISTRATIVOS' END);
    DBMS_OUTPUT.PUT_LINE('========================================');

    -- 2) crear encabezado de planilla
    v_nombre_planilla := 'Planilla '||
                         CASE v_tipo_personal WHEN 'M' THEN 'Medicos ' ELSE 'Administrativos ' END||
                         TO_CHAR(p_mes)||'/'||TO_CHAR(p_anio);

    INSERT INTO VITALIS_SCHEMA.vitalis_planillas (
        pla_id, pla_mes, pla_anio, pla_nombre,
        pla_fecha_generacion, pla_fecha_aprobacion, pla_usu_aprobador,
        pla_total_ingresos, pla_total_deducciones, pla_total_neto,
        pla_estado, pla_notificada, pla_version, pla_tpl_id
    )
    VALUES (
        VITALIS_SCHEMA.vitalis_planillas_seq01.NEXTVAL,
        p_mes, p_anio, v_nombre_planilla,
        SYSDATE, SYSDATE, SUBSTR(p_usuario,1,100),
        0, 0, 0,
        'A', 'N', 1,
        CASE v_tipo_personal WHEN 'M' THEN 1 ELSE 2 END
    )
    RETURNING pla_id INTO v_pla_id;

    -- reiniciar acumuladores de la planilla actual
    v_tot_ingresos_planilla := 0;
    v_tot_ded_planilla      := 0;
    v_tot_neto_planilla     := 0;

    -- 3) recorrer personas del tipo actual incluidas en escalas LISTA PARA PAGO
    FOR persona_rec IN (
        SELECT DISTINCT p.per_id, p.per_nombre, p.per_tipo_personal, e.esm_id
        FROM   VITALIS_SCHEMA.vitalis_personas p
        JOIN   VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle d ON d.per_id = p.per_id
        JOIN   VITALIS_SCHEMA.vitalis_escalas_mensuales e         ON e.esm_id = d.esm_id
        WHERE  TO_CHAR(d.emd_fecha,'MM')   = LPAD(p_mes,2,'0')
           AND TO_CHAR(d.emd_fecha,'YYYY') = TO_CHAR(p_anio)
           AND d.emd_trabajado = 'S'
           AND d.emd_procesado = 'N'
           AND e.esm_estado    = 'LISTA PARA PAGO'
           AND (CASE WHEN UPPER(SUBSTR(TRIM(p.per_tipo_personal),1,1))='M' THEN 'M' ELSE 'A' END) = v_tipo_personal
    ) LOOP
        ------------------------------------------------------------
        -- 4) INGRESOS POR TURNOS (puestos/turnos)
        ------------------------------------------------------------
        SELECT NVL(SUM(put.put_monto_pagar),0)
        INTO   v_ing_turnos
        FROM   VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle d
        JOIN   VITALIS_SCHEMA.vitalis_puestos_turnos put ON put.put_id = d.put_id
        WHERE  d.per_id = persona_rec.per_id
           AND d.emd_trabajado = 'S'
           AND d.emd_procesado = 'N'
           AND TO_CHAR(d.emd_fecha,'MM')   = LPAD(p_mes,2,'0')
           AND TO_CHAR(d.emd_fecha,'YYYY') = TO_CHAR(p_anio);

        ------------------------------------------------------------
        -- 5) INGRESOS POR PROCEDIMIENTOS MEDICOS (PRM)
        --    Se suma PRM_MONTO_PAGAR del mes/anio y se marcan como procesados
        ------------------------------------------------------------
        SELECT NVL(SUM(prm_monto_pagar),0)
        INTO   v_ing_procs
        FROM   VITALIS_SCHEMA.vitalis_procedimientos_medicos prm
        WHERE  prm.prm_per_id = persona_rec.per_id
           AND prm.prm_estado  = 'A'
           AND NVL(prm.prm_procesado,'N') = 'N'
           AND TO_CHAR(prm.prm_fecha_procedimiento,'MM')   = LPAD(p_mes,2,'0')
           AND TO_CHAR(prm.prm_fecha_procedimiento,'YYYY') = TO_CHAR(p_anio);

        -- marcar PRM como procesados (solo los del periodo)
        UPDATE VITALIS_SCHEMA.vitalis_procedimientos_medicos
        SET    prm_procesado = 'S'
        WHERE  prm_per_id = persona_rec.per_id
           AND prm_estado  = 'A'
           AND NVL(prm_procesado,'N') = 'N'
           AND TO_CHAR(prm_fecha_procedimiento,'MM')   = LPAD(p_mes,2,'0')
           AND TO_CHAR(prm_fecha_procedimiento,'YYYY') = TO_CHAR(p_anio);

        ------------------------------------------------------------
        -- 6) TOTAL BRUTO PERSONA
        ------------------------------------------------------------
        v_ing_total_persona := NVL(v_ing_turnos,0) + NVL(v_ing_procs,0);

        ------------------------------------------------------------
        -- 7) DEDUCCIONES desde VITALIS_TIPOS_MOVIMIENTOS
        --    Solo TMO_TIPO='DEDUCCION', TMO_ESTADO='A', TMO_AUTOMATICO='S'
        --    y que apliquen al tipo (medicos/administrativos).
        --    PORCENTUAL: v_ing_total_persona * (TMO_VALOR/100)
        --    ABSOLUTO:   TMO_VALOR
        --    Si hay rango salarial, se respeta.
        ------------------------------------------------------------
        v_ded_total_persona := 0;

        FOR mov IN (
            SELECT tmo_tipo, tmo_calculo, tmo_valor,
                   NVL(tmo_aplica_medicos,'N')       AS apl_med,
                   NVL(tmo_aplica_administrativos,'N') AS apl_adm,
                   NVL(tmo_rango_salarial_min,0)     AS rmin,
                   NVL(tmo_rango_salarial_max,999999999) AS rmax
            FROM   VITALIS_SCHEMA.vitalis_tipos_movimientos
            WHERE  tmo_estado     = 'A'
               AND tmo_tipo       = 'DEDUCCION'
               AND NVL(tmo_automatico,'S') = 'S'
        ) LOOP
            -- filtrar por tipo de personal
            IF (v_tipo_personal = 'M' AND mov.apl_med = 'S')
               OR (v_tipo_personal = 'A' AND mov.apl_adm = 'S') THEN

               -- filtrar por rango salarial si corresponde
               IF v_ing_total_persona BETWEEN mov.rmin AND mov.rmax THEN
                   IF UPPER(mov.tmo_calculo) = 'PORCENTUAL' THEN
                       v_ded_total_persona := v_ded_total_persona + ROUND(v_ing_total_persona * (NVL(mov.tmo_valor,0)/100), 2);
                   ELSE -- ABSOLUTO (o cualquier otro valor se trata como monto fijo)
                       v_ded_total_persona := v_ded_total_persona + NVL(mov.tmo_valor,0);
                   END IF;
               END IF;

            END IF;
        END LOOP;

        ------------------------------------------------------------
        -- 8) NETO PERSONA
        ------------------------------------------------------------
        v_neto_persona := v_ing_total_persona - v_ded_total_persona;

        ------------------------------------------------------------
        -- 9) INSERTAR DETALLE
        ------------------------------------------------------------
        INSERT INTO VITALIS_SCHEMA.vitalis_planillas_detalle (
            pld_id,
            pld_salario_base,          -- puedes usar v_ing_turnos si deseas solo turnos aqui
            pld_total_ingresos,        -- bruto total persona
            pld_total_deducciones,
            pld_total_neto,
            pld_notificado,
            pld_fecha_notificacion,
            pld_version,
            pld_per_id,
            pld_pla_id
        )
        VALUES (
            VITALIS_SCHEMA.vitalis_planillas_detalle_seq01.NEXTVAL,
            v_ing_turnos,
            v_ing_total_persona,
            v_ded_total_persona,
            v_neto_persona,
            'N',
            SYSDATE,
            1,
            persona_rec.per_id,
            v_pla_id
        );

        ------------------------------------------------------------
        -- 10) MARCAR ESCALAS DETALLE COMO PROCESADAS
        ------------------------------------------------------------
        UPDATE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle
        SET    emd_procesado = 'S'
        WHERE  per_id = persona_rec.per_id
           AND emd_trabajado = 'S'
           AND emd_procesado = 'N'
           AND TO_CHAR(emd_fecha,'MM')   = LPAD(p_mes,2,'0')
           AND TO_CHAR(emd_fecha,'YYYY') = TO_CHAR(p_anio);

        UPDATE VITALIS_SCHEMA.vitalis_escalas_mensuales
        SET    esm_estado = 'PROCESADA'
        WHERE  esm_id = persona_rec.esm_id;

        ------------------------------------------------------------
        -- 11) ACUMULAR EN TOTALES DE LA PLANILLA
        ------------------------------------------------------------
        v_tot_ingresos_planilla := v_tot_ingresos_planilla + v_ing_total_persona;
        v_tot_ded_planilla      := v_tot_ded_planilla      + v_ded_total_persona;
        v_tot_neto_planilla     := v_tot_neto_planilla     + v_neto_persona;

        ------------------------------------------------------------
        -- 12) OUTPUT VISIBLE
        ------------------------------------------------------------
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE(' Persona: '||persona_rec.per_nombre||'  (Tipo: '||persona_rec.per_tipo_personal||')');
        DBMS_OUTPUT.PUT_LINE('  - Ingresos por turnos:      '||TO_CHAR(v_ing_turnos,'999G999G999D00'));
        DBMS_OUTPUT.PUT_LINE('  - Ingresos por procedimientos: '||TO_CHAR(v_ing_procs,'999G999G999D00'));
        DBMS_OUTPUT.PUT_LINE('  = Ingreso bruto:            '||TO_CHAR(v_ing_total_persona,'999G999G999D00'));
        DBMS_OUTPUT.PUT_LINE('  - Deducciones:              '||TO_CHAR(v_ded_total_persona,'999G999G999D00'));
        DBMS_OUTPUT.PUT_LINE('  = Neto a pagar:             '||TO_CHAR(v_neto_persona,'999G999G999D00'));
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    END LOOP; -- personas

    -- 13) actualizar totales del encabezado de la planilla del tipo actual
    UPDATE VITALIS_SCHEMA.vitalis_planillas
    SET    pla_total_ingresos    = v_tot_ingresos_planilla,
           pla_total_deducciones = v_tot_ded_planilla,
           pla_total_neto        = v_tot_neto_planilla
    WHERE  pla_id = v_pla_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('>>>> Totales del tipo '||
        CASE v_tipo_personal WHEN 'M' THEN 'MEDICOS' ELSE 'ADMINISTRATIVOS' END || ':');
    DBMS_OUTPUT.PUT_LINE('    Total ingresos:    '||TO_CHAR(v_tot_ingresos_planilla,'999G999G999D00'));
    DBMS_OUTPUT.PUT_LINE('    Total deducciones: '||TO_CHAR(v_tot_ded_planilla,'999G999G999D00'));
    DBMS_OUTPUT.PUT_LINE('    Total neto:        '||TO_CHAR(v_tot_neto_planilla,'999G999G999D00'));
    DBMS_OUTPUT.PUT_LINE('========================================');

  END LOOP; -- tipos de personal

  DBMS_OUTPUT.PUT_LINE('Todas las planillas (medicos y administrativos) fueron generadas correctamente.');

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error generando planillas: '||SQLERRM);
END;
