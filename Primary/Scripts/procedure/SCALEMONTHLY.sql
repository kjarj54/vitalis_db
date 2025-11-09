CREATE OR REPLACE PROCEDURE generar_escala_mensual (
    p_esd_id   IN NUMBER,
    p_mes      IN NUMBER,
    p_anio     IN NUMBER,
    p_csa_id   IN NUMBER
) AS
    v_esm_id             NUMBER;
    v_fecha              DATE;
    v_dia_sem            NUMBER;
    v_dia_semana_base    NUMBER;
    v_per_id             NUMBER;
    v_put_id             NUMBER;
    v_count              NUMBER;
    v_hora_inicio        TIMESTAMP;
    v_hora_fin           TIMESTAMP;
    v_horas_trabajadas   NUMBER;
BEGIN
    -- 1. Verificar si ya existe una escala mensual para ese mes, anio y escala base
    SELECT COUNT(*)
      INTO v_count
      FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
     WHERE esm_mes = p_mes
       AND esm_anio = p_anio
       AND esm_esd_id = p_esd_id
       AND esm_csa_id = p_csa_id;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Ya existe una escala mensual para esa combinacion de mes/anio/base.');
        RETURN;
    END IF;

    -- 2. Obtener informacion base de la escala
    SELECT esd_dia_semana, esd_per_id, esd_put_id
      INTO v_dia_semana_base, v_per_id, v_put_id
      FROM VITALIS_SCHEMA.vitalis_escalas_base
     WHERE esd_id = p_esd_id;

    -- 3. Crear la escala mensual
    INSERT INTO VITALIS_SCHEMA.vitalis_escalas_mensuales (
        esm_id,
        esm_mes,
        esm_anio,
        esm_nombre,
        esm_fecha_creacion,
        esm_estado,
        esm_procesado,
        esm_version,
        esm_esd_id,
        esm_csa_id
    )
    VALUES (
        VITALIS_SCHEMA.vitalis_escalas_mensuales_seq01.NEXTVAL,
        p_mes,
        p_anio,
        'Escala ' || p_mes || '/' || p_anio,
        SYSDATE,
        'CONSTRUCCION',
        'N',
        1,
        p_esd_id,
        p_csa_id
    )
    RETURNING esm_id INTO v_esm_id;

    -- 4. Generar detalles segun los dias del mes
    v_fecha := TO_DATE('01/' || p_mes || '/' || p_anio, 'DD/MM/YYYY');

    WHILE TO_CHAR(v_fecha, 'MM') = LPAD(p_mes, 2, '0') LOOP
        -- Dia de la semana (1=Domingo, 7=Sabado depende de NLS_TERRITORY)
        v_dia_sem := TO_NUMBER(TO_CHAR(v_fecha, 'D'));

        -- Comparar con el dia definido en la escala base
        IF v_dia_sem = v_dia_semana_base THEN
            -- Obtener horas del puesto-turno
            SELECT put_hora_inicio, put_hora_fin
              INTO v_hora_inicio, v_hora_fin
              FROM VITALIS_SCHEMA.vitalis_puestos_turnos
             WHERE put_id = v_put_id;

            -- Calcular diferencia en horas
            v_horas_trabajadas := (EXTRACT(HOUR FROM (v_hora_fin - v_hora_inicio))) +
                                  (EXTRACT(MINUTE FROM (v_hora_fin - v_hora_inicio)) / 60);

            -- Insertar detalle de la escala mensual
            INSERT INTO VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle (
                emd_id,
                emd_fecha,
                emd_trabajado,
                emd_estado,
                emd_procesado,
                esm_id,
                put_id,
                per_id,
                emd_hora_inicio_real,
                emd_hora_fin_real,
                emd_horas_trabajadas,
                emd_observaciones
            ) VALUES (
                VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle_seq01.NEXTVAL,
                v_fecha,
                'S',
                'A',
                'N',
                v_esm_id,
                v_put_id,
                v_per_id,
                v_hora_inicio,
                v_hora_fin,
                v_horas_trabajadas,
                'Generado automaticamente segun escala base'
            );
        END IF;

        v_fecha := v_fecha + 1;
    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Escala mensual creada exitosamente (esm_id=' || v_esm_id || ').');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: No se encontro la escala base con ID ' || p_esd_id);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;