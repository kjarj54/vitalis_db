
-- ============================================================================
-- CREAR TRIGGERS
-- ============================================================================

-- TRIGGER PARA INSERT EN PLANILLAS
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_planillas_insert
AFTER INSERT ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB := '{}';
    v_valores_new CLOB;
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON manualmente (más compatible)
    v_valores_new := '{' ||
        '"pla_id":' || :NEW.pla_id || ',' ||
        '"pla_mes":' || :NEW.pla_mes || ',' ||
        '"pla_anio":' || :NEW.pla_anio || ',' ||
        '"pla_nombre":"' || :NEW.pla_nombre || '",' ||
        '"pla_estado":"' || :NEW.pla_estado || '",' ||
        '"pla_notificada":"' || :NEW.pla_notificada || '",' ||
        '"pla_total_ingresos":' || :NEW.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :NEW.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :NEW.pla_total_neto ||
    '}';

    -- Insertar en bitácora
    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_planillas',
        'INSERT',
        :NEW.pla_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        -- Log del error sin detener la transacción principal
        NULL;
END;
/

-- TRIGGER PARA UPDATE EN PLANILLAS
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_planillas_update
AFTER UPDATE ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB;
    v_valores_new CLOB;
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON de valores anteriores
    v_valores_ant := '{' ||
        '"pla_id":' || :OLD.pla_id || ',' ||
        '"pla_estado":"' || :OLD.pla_estado || '",' ||
        '"pla_notificada":"' || :OLD.pla_notificada || '",' ||
        '"pla_total_ingresos":' || :OLD.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :OLD.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :OLD.pla_total_neto ||
    '}';
    
    -- Construir JSON de valores nuevos
    v_valores_new := '{' ||
        '"pla_id":' || :NEW.pla_id || ',' ||
        '"pla_estado":"' || :NEW.pla_estado || '",' ||
        '"pla_notificada":"' || :NEW.pla_notificada || '",' ||
        '"pla_total_ingresos":' || :NEW.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :NEW.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :NEW.pla_total_neto ||
    '}';

    -- Insertar en bitácora
    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_planillas',
        'UPDATE',
        :NEW.pla_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- TRIGGER PARA DELETE EN PLANILLAS
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_planillas_delete
AFTER DELETE ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB;
    v_valores_new CLOB := '{}';
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON con valores antiguos
    v_valores_ant := '{' ||
        '"pla_id":' || :OLD.pla_id || ',' ||
        '"pla_mes":' || :OLD.pla_mes || ',' ||
        '"pla_anio":' || :OLD.pla_anio || ',' ||
        '"pla_nombre":"' || :OLD.pla_nombre || '",' ||
        '"pla_estado":"' || :OLD.pla_estado || '"' ||
    '}';

    -- Insertar en bitácora
    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_planillas',
        'DELETE',
        :OLD.pla_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- TRIGGER PARA INSERT EN ESCALAS MENSUALES
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_escalas_insert
AFTER INSERT ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB := '{}';
    v_valores_new CLOB;
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON
    v_valores_new := '{' ||
        '"esm_id":' || :NEW.esm_id || ',' ||
        '"esm_mes":' || :NEW.esm_mes || ',' ||
        '"esm_anio":' || :NEW.esm_anio || ',' ||
        '"esm_nombre":"' || :NEW.esm_nombre || '",' ||
        '"esm_estado":"' || :NEW.esm_estado || '",' ||
        '"esm_procesado":"' || :NEW.esm_procesado || '"' ||
    '}';

    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_escalas_mensuales',
        'INSERT',
        :NEW.esm_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- TRIGGER PARA UPDATE EN ESCALAS MENSUALES
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_escalas_update
AFTER UPDATE ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB;
    v_valores_new CLOB;
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON de valores anteriores
    v_valores_ant := '{' ||
        '"esm_id":' || :OLD.esm_id || ',' ||
        '"esm_estado":"' || :OLD.esm_estado || '",' ||
        '"esm_procesado":"' || :OLD.esm_procesado || '"' ||
    '}';
    
    -- Construir JSON de valores nuevos
    v_valores_new := '{' ||
        '"esm_id":' || :NEW.esm_id || ',' ||
        '"esm_estado":"' || :NEW.esm_estado || '",' ||
        '"esm_procesado":"' || :NEW.esm_procesado || '"' ||
    '}';

    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_escalas_mensuales',
        'UPDATE',
        :NEW.esm_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- TRIGGER PARA DELETE EN ESCALAS MENSUALES
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_bitacora_escalas_delete
AFTER DELETE ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_usuario_id NUMBER;
    v_ip_usuario VARCHAR2(50);
    v_valores_ant CLOB;
    v_valores_new CLOB := '{}';
BEGIN
    -- Obtener IP
    BEGIN
        v_ip_usuario := SYS_CONTEXT('USERENV','IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            v_ip_usuario := 'UNKNOWN';
    END;

    -- Obtener el usuario actual
    BEGIN
        SELECT usu_id INTO v_usuario_id
        FROM VITALIS_SCHEMA.vitalis_usuarios
        WHERE UPPER(usu_login) = UPPER(USER)
        AND ROWNUM = 1;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_usuario_id := NULL;
    END;

    -- Construir JSON con valores antiguos
    v_valores_ant := '{' ||
        '"esm_id":' || :OLD.esm_id || ',' ||
        '"esm_mes":' || :OLD.esm_mes || ',' ||
        '"esm_anio":' || :OLD.esm_anio || ',' ||
        '"esm_estado":"' || :OLD.esm_estado || '"' ||
    '}';

    INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
        bit_tabla,
        bit_operacion,
        bit_pk_tabla,
        bit_usuario_id,
        bit_usu_id,
        bit_fecha,
        bit_valores_anteriores,
        bit_valores_nuevos,
        bit_ip_usuario
    ) VALUES (
        'vitalis_escalas_mensuales',
        'DELETE',
        :OLD.esm_id,
        NVL(v_usuario_id, 0),
        v_usuario_id,
        SYSDATE,
        v_valores_ant,
        v_valores_new,
        NVL(v_ip_usuario, 'UNKNOWN')
    );
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/