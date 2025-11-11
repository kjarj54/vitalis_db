
-- TRIGGER PARA INSERT
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_planillas_insert
AFTER INSERT ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_valores_nuevos CLOB;
BEGIN
    -- Construir JSON con los valores nuevos
    v_valores_nuevos := '{' ||
        '"pla_id":' || :NEW.pla_id || ',' ||
        '"pla_mes":' || :NEW.pla_mes || ',' ||
        '"pla_anio":' || :NEW.pla_anio || ',' ||
        '"pla_nombre":"' || REPLACE(:NEW.pla_nombre, '"', '\"') || '",' ||
        '"pla_fecha_generacion":"' || TO_CHAR(:NEW.pla_fecha_generacion, 'YYYY-MM-DD') || '",' ||
        '"pla_fecha_aprobacion":"' || TO_CHAR(:NEW.pla_fecha_aprobacion, 'YYYY-MM-DD') || '",' ||
        '"pla_usu_aprobador":"' || :NEW.pla_usu_aprobador || '",' ||
        '"pla_total_ingresos":' || :NEW.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :NEW.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :NEW.pla_total_neto || ',' ||
        '"pla_estado":"' || :NEW.pla_estado || '",' ||
        '"pla_notificada":"' || :NEW.pla_notificada || '",' ||
        '"pla_tpl_id":' || :NEW.pla_tpl_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_planillas',
        p_operacion => 'INSERT',
        p_pk_tabla => :NEW.pla_id,
        p_valores_anteriores => NULL,
        p_valores_nuevos => v_valores_nuevos
    );
END;
/

-- TRIGGER PARA UPDATE
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_planillas_update
AFTER UPDATE ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_valores_anteriores CLOB;
    v_valores_nuevos CLOB;
BEGIN
    -- Construir JSON con valores anteriores
    v_valores_anteriores := '{' ||
        '"pla_id":' || :OLD.pla_id || ',' ||
        '"pla_mes":' || :OLD.pla_mes || ',' ||
        '"pla_anio":' || :OLD.pla_anio || ',' ||
        '"pla_nombre":"' || REPLACE(:OLD.pla_nombre, '"', '\"') || '",' ||
        '"pla_fecha_generacion":"' || TO_CHAR(:OLD.pla_fecha_generacion, 'YYYY-MM-DD') || '",' ||
        '"pla_fecha_aprobacion":"' || TO_CHAR(:OLD.pla_fecha_aprobacion, 'YYYY-MM-DD') || '",' ||
        '"pla_usu_aprobador":"' || :OLD.pla_usu_aprobador || '",' ||
        '"pla_total_ingresos":' || :OLD.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :OLD.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :OLD.pla_total_neto || ',' ||
        '"pla_estado":"' || :OLD.pla_estado || '",' ||
        '"pla_notificada":"' || :OLD.pla_notificada || '",' ||
        '"pla_tpl_id":' || :OLD.pla_tpl_id ||
    '}';
    
    -- Construir JSON con valores nuevos
    v_valores_nuevos := '{' ||
        '"pla_id":' || :NEW.pla_id || ',' ||
        '"pla_mes":' || :NEW.pla_mes || ',' ||
        '"pla_anio":' || :NEW.pla_anio || ',' ||
        '"pla_nombre":"' || REPLACE(:NEW.pla_nombre, '"', '\"') || '",' ||
        '"pla_fecha_generacion":"' || TO_CHAR(:NEW.pla_fecha_generacion, 'YYYY-MM-DD') || '",' ||
        '"pla_fecha_aprobacion":"' || TO_CHAR(:NEW.pla_fecha_aprobacion, 'YYYY-MM-DD') || '",' ||
        '"pla_usu_aprobador":"' || :NEW.pla_usu_aprobador || '",' ||
        '"pla_total_ingresos":' || :NEW.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :NEW.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :NEW.pla_total_neto || ',' ||
        '"pla_estado":"' || :NEW.pla_estado || '",' ||
        '"pla_notificada":"' || :NEW.pla_notificada || '",' ||
        '"pla_tpl_id":' || :NEW.pla_tpl_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_planillas',
        p_operacion => 'UPDATE',
        p_pk_tabla => :NEW.pla_id,
        p_valores_anteriores => v_valores_anteriores,
        p_valores_nuevos => v_valores_nuevos
    );
END;
/

-- TRIGGER PARA DELETE
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_planillas_delete
AFTER DELETE ON VITALIS_SCHEMA.vitalis_planillas
FOR EACH ROW
DECLARE
    v_valores_anteriores CLOB;
BEGIN
    -- Construir JSON con valores anteriores
    v_valores_anteriores := '{' ||
        '"pla_id":' || :OLD.pla_id || ',' ||
        '"pla_mes":' || :OLD.pla_mes || ',' ||
        '"pla_anio":' || :OLD.pla_anio || ',' ||
        '"pla_nombre":"' || REPLACE(:OLD.pla_nombre, '"', '\"') || '",' ||
        '"pla_fecha_generacion":"' || TO_CHAR(:OLD.pla_fecha_generacion, 'YYYY-MM-DD') || '",' ||
        '"pla_fecha_aprobacion":"' || TO_CHAR(:OLD.pla_fecha_aprobacion, 'YYYY-MM-DD') || '",' ||
        '"pla_usu_aprobador":"' || :OLD.pla_usu_aprobador || '",' ||
        '"pla_total_ingresos":' || :OLD.pla_total_ingresos || ',' ||
        '"pla_total_deducciones":' || :OLD.pla_total_deducciones || ',' ||
        '"pla_total_neto":' || :OLD.pla_total_neto || ',' ||
        '"pla_estado":"' || :OLD.pla_estado || '",' ||
        '"pla_notificada":"' || :OLD.pla_notificada || '",' ||
        '"pla_tpl_id":' || :OLD.pla_tpl_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_planillas',
        p_operacion => 'DELETE',
        p_pk_tabla => :OLD.pla_id,
        p_valores_anteriores => v_valores_anteriores,
        p_valores_nuevos => NULL
    );
END;
/

-- ========================================
-- TRIGGERS PARA vitalis_escalas_mensuales
-- ========================================

-- TRIGGER PARA INSERT
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_escalas_mensuales_insert
AFTER INSERT ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_valores_nuevos CLOB;
BEGIN
    -- Construir JSON con los valores nuevos
    v_valores_nuevos := '{' ||
        '"esm_id":' || :NEW.esm_id || ',' ||
        '"esm_mes":' || :NEW.esm_mes || ',' ||
        '"esm_anio":' || :NEW.esm_anio || ',' ||
        '"esm_nombre":"' || REPLACE(:NEW.esm_nombre, '"', '\"') || '",' ||
        '"esm_fecha_creacion":"' || TO_CHAR(:NEW.esm_fecha_creacion, 'YYYY-MM-DD') || '",' ||
        '"esm_estado":"' || :NEW.esm_estado || '",' ||
        '"esm_procesado":"' || :NEW.esm_procesado || '",' ||
        '"esm_esd_id":' || :NEW.esm_esd_id || ',' ||
        '"esm_csa_id":' || :NEW.esm_csa_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_escalas_mensuales',
        p_operacion => 'INSERT',
        p_pk_tabla => :NEW.esm_id,
        p_valores_anteriores => NULL,
        p_valores_nuevos => v_valores_nuevos
    );
END;
/

-- TRIGGER PARA UPDATE
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_escalas_mensuales_update
AFTER UPDATE ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_valores_anteriores CLOB;
    v_valores_nuevos CLOB;
BEGIN
    -- Construir JSON con valores anteriores
    v_valores_anteriores := '{' ||
        '"esm_id":' || :OLD.esm_id || ',' ||
        '"esm_mes":' || :OLD.esm_mes || ',' ||
        '"esm_anio":' || :OLD.esm_anio || ',' ||
        '"esm_nombre":"' || REPLACE(:OLD.esm_nombre, '"', '\"') || '",' ||
        '"esm_fecha_creacion":"' || TO_CHAR(:OLD.esm_fecha_creacion, 'YYYY-MM-DD') || '",' ||
        '"esm_estado":"' || :OLD.esm_estado || '",' ||
        '"esm_procesado":"' || :OLD.esm_procesado || '",' ||
        '"esm_esd_id":' || :OLD.esm_esd_id || ',' ||
        '"esm_csa_id":' || :OLD.esm_csa_id ||
    '}';
    
    -- Construir JSON con valores nuevos
    v_valores_nuevos := '{' ||
        '"esm_id":' || :NEW.esm_id || ',' ||
        '"esm_mes":' || :NEW.esm_mes || ',' ||
        '"esm_anio":' || :NEW.esm_anio || ',' ||
        '"esm_nombre":"' || REPLACE(:NEW.esm_nombre, '"', '\"') || '",' ||
        '"esm_fecha_creacion":"' || TO_CHAR(:NEW.esm_fecha_creacion, 'YYYY-MM-DD') || '",' ||
        '"esm_estado":"' || :NEW.esm_estado || '",' ||
        '"esm_procesado":"' || :NEW.esm_procesado || '",' ||
        '"esm_esd_id":' || :NEW.esm_esd_id || ',' ||
        '"esm_csa_id":' || :NEW.esm_csa_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_escalas_mensuales',
        p_operacion => 'UPDATE',
        p_pk_tabla => :NEW.esm_id,
        p_valores_anteriores => v_valores_anteriores,
        p_valores_nuevos => v_valores_nuevos
    );
END;
/

-- TRIGGER PARA DELETE
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.trg_escalas_mensuales_delete
AFTER DELETE ON VITALIS_SCHEMA.vitalis_escalas_mensuales
FOR EACH ROW
DECLARE
    v_valores_anteriores CLOB;
BEGIN
    -- Construir JSON con valores anteriores
    v_valores_anteriores := '{' ||
        '"esm_id":' || :OLD.esm_id || ',' ||
        '"esm_mes":' || :OLD.esm_mes || ',' ||
        '"esm_anio":' || :OLD.esm_anio || ',' ||
        '"esm_nombre":"' || REPLACE(:OLD.esm_nombre, '"', '\"') || '",' ||
        '"esm_fecha_creacion":"' || TO_CHAR(:OLD.esm_fecha_creacion, 'YYYY-MM-DD') || '",' ||
        '"esm_estado":"' || :OLD.esm_estado || '",' ||
        '"esm_procesado":"' || :OLD.esm_procesado || '",' ||
        '"esm_esd_id":' || :OLD.esm_esd_id || ',' ||
        '"esm_csa_id":' || :OLD.esm_csa_id ||
    '}';
    
    -- Registrar en bitácoras
    PKG_AUDITORIA.registrar_cambio(
        p_tabla => 'vitalis_escalas_mensuales',
        p_operacion => 'DELETE',
        p_pk_tabla => :OLD.esm_id,
        p_valores_anteriores => v_valores_anteriores,
        p_valores_nuevos => NULL
    );
END;
/
