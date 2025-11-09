CREATE OR REPLACE PROCEDURE generar_planilla_mensual (
    p_mes      IN NUMBER,
    p_anio     IN NUMBER,
    p_tpl_id   IN NUMBER,
    p_usuario  IN VARCHAR2 DEFAULT 'SISTEMA'
) AS
    v_pla_id          NUMBER;
    v_total_general   NUMBER := 0;
    v_total_persona   NUMBER;
BEGIN
    -- 1. Crear encabezado de la planilla (todas las columnas obligatorias)
    INSERT INTO VITALIS_SCHEMA.vitalis_planillas (
        pla_id,
        pla_mes,
        pla_anio,
        pla_nombre,
        pla_fecha_generacion,
        pla_fecha_aprobacion,
        pla_usu_aprobador,
        pla_total_ingresos,
        pla_total_deducciones,
        pla_total_neto,
        pla_estado,
        pla_notificada,
        pla_version,
        pla_tpl_id
    )
    VALUES (
        VITALIS_SCHEMA.vitalis_planillas_seq01.NEXTVAL,
        p_mes,
        p_anio,
        'Planilla ' || p_mes || '/' || p_anio,
        SYSDATE,     -- fecha generacion
        SYSDATE,     -- fecha aprobacion
        p_usuario,   -- usuario aprobador
        0,           -- total ingresos (actualiza luego)
        0,           -- total deducciones
        0,           -- total neto
        'A',         -- A = aprobada
        'N',         -- N = no notificada
        1,           -- version
        p_tpl_id
    )
    RETURNING pla_id INTO v_pla_id;

    DBMS_OUTPUT.PUT_LINE('Planilla creada con ID ' || v_pla_id);

    -- 2. Recorrer personas con detalle en escalas mensuales
    FOR persona_rec IN (
        SELECT DISTINCT p.per_id
        FROM VITALIS_SCHEMA.vitalis_personas p
        JOIN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle d
          ON d.per_id = p.per_id
        WHERE TO_CHAR(d.emd_fecha, 'MM') = LPAD(p_mes, 2, '0')
          AND TO_CHAR(d.emd_fecha, 'YYYY') = TO_CHAR(p_anio)
          AND d.emd_trabajado = 'S'
          AND p.per_tipo_personal = CASE p_tpl_id
                                   WHEN 1 THEN 'M'  -- tipo de planilla médicos
                                   WHEN 2 THEN 'A'  -- tipo de planilla administradores
                                END
    ) LOOP
        -- 3. Calcular total por persona (suma de montos del turno)
        SELECT NVL(SUM(put.put_monto_pagar), 0)
        INTO v_total_persona
        FROM VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle d
        JOIN VITALIS_SCHEMA.vitalis_puestos_turnos put
          ON d.put_id = put.put_id
        WHERE d.per_id = persona_rec.per_id
          AND TO_CHAR(d.emd_fecha, 'MM') = LPAD(p_mes, 2, '0')
          AND TO_CHAR(d.emd_fecha, 'YYYY') = TO_CHAR(p_anio)
          AND d.emd_trabajado = 'S';

        -- 4. Insertar detalle de planilla
        INSERT INTO VITALIS_SCHEMA.vitalis_planillas_detalle (
            pld_id,
            pld_salario_base,
            pld_total_ingresos,
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
            v_total_persona,   -- salario base
            v_total_persona,   -- total ingresos
            0,                 -- deducciones
            v_total_persona,   -- total neto
            'N',               -- no notificado
            SYSDATE,           -- fecha notificacion (obligatorio)
            1,                 -- version
            persona_rec.per_id,
            v_pla_id
        );

        v_total_general := v_total_general + v_total_persona;

        DBMS_OUTPUT.PUT_LINE('Persona ID ' || persona_rec.per_id ||
                             ' - Total: ' || v_total_persona);
    END LOOP;

    -- 5. Actualizar totales del encabezado
    UPDATE VITALIS_SCHEMA.vitalis_planillas
       SET pla_total_ingresos    = v_total_general,
           pla_total_deducciones = 0,
           pla_total_neto        = v_total_general
     WHERE pla_id = v_pla_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Planilla mensual generada correctamente. Total general: ' || v_total_general);

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error generando planilla: ' || SQLERRM);
END;
