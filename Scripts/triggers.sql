-- Trigger for sequence vitalis_paises_seq01 for column pai_id in table vitalis_paises ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_paises_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_paises FOR EACH ROW
BEGIN
    if :new.pai_id is null or :new.pai_id <= 0 then
        :new.pai_id := VITALIS_SCHEMA.vitalis_paises_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_paises_TGR02 AFTER UPDATE OF pai_id
ON VITALIS_SCHEMA.vitalis_paises FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pai_id in table vitalis_paises as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_provincias_seq01 for column pro_id in table vitalis_provincia ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_provincia_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_provincia FOR EACH ROW
BEGIN
    if :new.pro_id is null or :new.pro_id <= 0 then
        :new.pro_id := VITALIS_SCHEMA.vitalis_provincias_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_provincia_TGR02 AFTER UPDATE OF pro_id
ON VITALIS_SCHEMA.vitalis_provincia FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pro_id in table vitalis_provincia as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_cantones_seq01 for column can_id in table vitalis_cantones ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_cantones_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_cantones FOR EACH ROW
BEGIN
    if :new.can_id is null or :new.can_id <= 0 then
        :new.can_id := VITALIS_SCHEMA.vitalis_cantones_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_cantones_TGR02 AFTER UPDATE OF can_id
ON VITALIS_SCHEMA.vitalis_cantones FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column can_id in table vitalis_cantones as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_distritos_seq01 for column dis_id in table vitalis_distritos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_distritos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_distritos FOR EACH ROW
BEGIN
    if :new.dis_id is null or :new.dis_id <= 0 then
        :new.dis_id := VITALIS_SCHEMA.vitalis_distritos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_distritos_TGR02 AFTER UPDATE OF dis_id
ON VITALIS_SCHEMA.vitalis_distritos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column dis_id in table vitalis_distritos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_tipos_documentos_seq01 for column tdo_id in table vitalis_tipos_documentos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_documentos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_tipos_documentos FOR EACH ROW
BEGIN
    if :new.tdo_id is null or :new.tdo_id <= 0 then
        :new.tdo_id := VITALIS_SCHEMA.vitalis_tipos_documentos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_documentos_TGR02 AFTER UPDATE OF tdo_id
ON VITALIS_SCHEMA.vitalis_tipos_documentos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tdo_id in table vitalis_tipos_documentos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_bancos_seq01 for column ban_id in table vitalis_bancos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_bancos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_bancos FOR EACH ROW
BEGIN
    if :new.ban_id is null or :new.ban_id <= 0 then
        :new.ban_id := VITALIS_SCHEMA.vitalis_bancos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_bancos_TGR02 AFTER UPDATE OF ban_id
ON VITALIS_SCHEMA.vitalis_bancos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column ban_id in table vitalis_bancos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_tipos_cuenta_seq01 for column tcu_id in table vitalis_tipos_cuenta ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_cuenta_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_tipos_cuenta FOR EACH ROW
BEGIN
    if :new.tcu_id is null or :new.tcu_id <= 0 then
        :new.tcu_id := VITALIS_SCHEMA.vitalis_tipos_cuenta_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_cuenta_TGR02 AFTER UPDATE OF tcu_id
ON VITALIS_SCHEMA.vitalis_tipos_cuenta FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tcu_id in table vitalis_tipos_cuenta as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_personas_seq01 for column per_id in table vitalis_personas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_personas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_personas FOR EACH ROW
BEGIN
    if :new.per_id is null or :new.per_id <= 0 then
        :new.per_id := VITALIS_SCHEMA.vitalis_personas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_personas_TGR02 AFTER UPDATE OF per_id
ON VITALIS_SCHEMA.vitalis_personas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column per_id in table vitalis_personas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_direcciones_seq01 for column dpe_id in table vitalis_direcciones_personas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_direcciones_personas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_direcciones_personas FOR EACH ROW
BEGIN
    if :new.dpe_id is null or :new.dpe_id <= 0 then
        :new.dpe_id := VITALIS_SCHEMA.vitalis_direcciones_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_direcciones_personas_TGR02 AFTER UPDATE OF dpe_id
ON VITALIS_SCHEMA.vitalis_direcciones_personas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column dpe_id in table vitalis_direcciones_personas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_telefonos_personas_seq01 for column tpe_id in table vitalis_telefonos_personas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_telefonos_personas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_telefonos_personas FOR EACH ROW
BEGIN
    if :new.tpe_id is null or :new.tpe_id <= 0 then
        :new.tpe_id := VITALIS_SCHEMA.vitalis_telefonos_personas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_telefonos_personas_TGR02 AFTER UPDATE OF tpe_id
ON VITALIS_SCHEMA.vitalis_telefonos_personas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpe_id in table vitalis_telefonos_personas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_cuentas_bancarias_seq01 for column cba_id in table vitalis_cuentas_bancarias ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_cuentas_bancarias_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_cuentas_bancarias FOR EACH ROW
BEGIN
    if :new.cba_id is null or :new.cba_id <= 0 then
        :new.cba_id := VITALIS_SCHEMA.vitalis_cuentas_bancarias_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_cuentas_bancarias_TGR02 AFTER UPDATE OF cba_id
ON VITALIS_SCHEMA.vitalis_cuentas_bancarias FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column cba_id in table vitalis_cuentas_bancarias as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_documentos_personas_seq01 for column dop_id in table vitalis_documentos_personas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_documentos_personas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_documentos_personas FOR EACH ROW
BEGIN
    if :new.dop_id is null or :new.dop_id <= 0 then
        :new.dop_id := VITALIS_SCHEMA.vitalis_documentos_personas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_documentos_personas_TGR02 AFTER UPDATE OF dop_id
ON VITALIS_SCHEMA.vitalis_documentos_personas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column dop_id in table vitalis_documentos_personas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_perfiles_seq01 for column prf_id in table vitalis_perfiles ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_perfiles_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_perfiles FOR EACH ROW
BEGIN
    if :new.prf_id is null or :new.prf_id <= 0 then
        :new.prf_id := VITALIS_SCHEMA.vitalis_perfiles_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_perfiles_TGR02 AFTER UPDATE OF prf_id
ON VITALIS_SCHEMA.vitalis_perfiles FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column prf_id in table vitalis_perfiles as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_pantallas_seq01 for column pan_id in table vitalis_pantallas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_pantallas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_pantallas FOR EACH ROW
BEGIN
    if :new.pan_id is null or :new.pan_id <= 0 then
        :new.pan_id := VITALIS_SCHEMA.vitalis_pantallas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_pantallas_TGR02 AFTER UPDATE OF pan_id
ON VITALIS_SCHEMA.vitalis_pantallas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pan_id in table vitalis_pantallas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_usuarios_seq01 for column usu_id in table vitalis_usuarios ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_usuarios_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_usuarios FOR EACH ROW
BEGIN
    if :new.usu_id is null or :new.usu_id <= 0 then
        :new.usu_id := VITALIS_SCHEMA.vitalis_usuarios_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_usuarios_TGR02 AFTER UPDATE OF usu_id
ON VITALIS_SCHEMA.vitalis_usuarios FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column usu_id in table vitalis_usuarios as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_centros_salud_seq01 for column csa_id in table vitalis_centros_salud ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_centros_salud_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_centros_salud FOR EACH ROW
BEGIN
    if :new.csa_id is null or :new.csa_id <= 0 then
        :new.csa_id := VITALIS_SCHEMA.vitalis_centros_salud_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_centros_salud_TGR02 AFTER UPDATE OF csa_id
ON VITALIS_SCHEMA.vitalis_centros_salud FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column csa_id in table vitalis_centros_salud as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_tipos_procedimientos_seq01 for column tpr_id in table vitalis_tipos_procedimientos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_procedimientos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_tipos_procedimientos FOR EACH ROW
BEGIN
    if :new.tpr_id is null or :new.tpr_id <= 0 then
        :new.tpr_id := VITALIS_SCHEMA.vitalis_tipos_procedimientos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_procedimientos_TGR02 AFTER UPDATE OF tpr_id
ON VITALIS_SCHEMA.vitalis_tipos_procedimientos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpr_id in table vitalis_tipos_procedimientos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_procedimientos_medicos_seq01 for column prm_id in table vitalis_procedimientos_medicos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_procedimientos_medicos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_procedimientos_medicos FOR EACH ROW
BEGIN
    if :new.prm_id is null or :new.prm_id <= 0 then
        :new.prm_id := VITALIS_SCHEMA.vitalis_procedimientos_medicos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_procedimientos_medicos_TGR02 AFTER UPDATE OF prm_id
ON VITALIS_SCHEMA.vitalis_procedimientos_medicos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column prm_id in table vitalis_procedimientos_medicos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_escalas_base_detalle_seq01 for column esd_id in table vitalis_escalas_base ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_base_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_escalas_base FOR EACH ROW
BEGIN
    if :new.esd_id is null or :new.esd_id <= 0 then
        :new.esd_id := VITALIS_SCHEMA.vitalis_escalas_base_detalle_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_base_TGR02 AFTER UPDATE OF esd_id
ON VITALIS_SCHEMA.vitalis_escalas_base FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column esd_id in table vitalis_escalas_base as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_escalas_mensuales_seq01 for column esm_id in table vitalis_escalas_mensuales ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_mensuales_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_escalas_mensuales FOR EACH ROW
BEGIN
    if :new.esm_id is null or :new.esm_id <= 0 then
        :new.esm_id := VITALIS_SCHEMA.vitalis_escalas_mensuales_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_mensuales_TGR02 AFTER UPDATE OF esm_id
ON VITALIS_SCHEMA.vitalis_escalas_mensuales FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column esm_id in table vitalis_escalas_mensuales as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_escalas_mensuales_detalle_seq01 for column emd_id in table vitalis_escalas_mensuales_detalle ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle FOR EACH ROW
BEGIN
    if :new.emd_id is null or :new.emd_id <= 0 then
        :new.emd_id := VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle_TGR02 AFTER UPDATE OF emd_id
ON VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column emd_id in table vitalis_escalas_mensuales_detalle as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_tipos_planillas_seq01 for column tpl_id in table vitalis_tipos_planillas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_planillas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_tipos_planillas FOR EACH ROW
BEGIN
    if :new.tpl_id is null or :new.tpl_id <= 0 then
        :new.tpl_id := VITALIS_SCHEMA.vitalis_tipos_planillas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_planillas_TGR02 AFTER UPDATE OF tpl_id
ON VITALIS_SCHEMA.vitalis_tipos_planillas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpl_id in table vitalis_tipos_planillas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_tipos_movimientos_seq01 for column tmo_id in table vitalis_tipos_movimientos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_movimientos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_tipos_movimientos FOR EACH ROW
BEGIN
    if :new.tmo_id is null or :new.tmo_id <= 0 then
        :new.tmo_id := VITALIS_SCHEMA.vitalis_tipos_movimientos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_tipos_movimientos_TGR02 AFTER UPDATE OF tmo_id
ON VITALIS_SCHEMA.vitalis_tipos_movimientos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column tmo_id in table vitalis_tipos_movimientos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_planillas_seq01 for column pla_id in table vitalis_planillas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_planillas FOR EACH ROW
BEGIN
    if :new.pla_id is null or :new.pla_id <= 0 then
        :new.pla_id := VITALIS_SCHEMA.vitalis_planillas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_TGR02 AFTER UPDATE OF pla_id
ON VITALIS_SCHEMA.vitalis_planillas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pla_id in table vitalis_planillas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_planillas_detalle_seq01 for column pld_id in table vitalis_planillas_detalle ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_detalle_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_planillas_detalle FOR EACH ROW
BEGIN
    if :new.pld_id is null or :new.pld_id <= 0 then
        :new.pld_id := VITALIS_SCHEMA.vitalis_planillas_detalle_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_detalle_TGR02 AFTER UPDATE OF pld_id
ON VITALIS_SCHEMA.vitalis_planillas_detalle FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pld_id in table vitalis_planillas_detalle as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_planillas_movimientos_seq01 for column plm_id in table vitalis_planillas_movimientos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_movimientos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_planillas_movimientos FOR EACH ROW
BEGIN
    if :new.plm_id is null or :new.plm_id <= 0 then
        :new.plm_id := VITALIS_SCHEMA.vitalis_planillas_movimientos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_planillas_movimientos_TGR02 AFTER UPDATE OF plm_id
ON VITALIS_SCHEMA.vitalis_planillas_movimientos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column plm_id in table vitalis_planillas_movimientos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_resumen_financiero_seq01 for column ref_id in table vitalis_resumen_financiero ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_resumen_financiero_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_resumen_financiero FOR EACH ROW
BEGIN
    if :new.ref_id is null or :new.ref_id <= 0 then
        :new.ref_id := VITALIS_SCHEMA.vitalis_resumen_financiero_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_resumen_financiero_TGR02 AFTER UPDATE OF ref_id
ON VITALIS_SCHEMA.vitalis_resumen_financiero FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column ref_id in table vitalis_resumen_financiero as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_parametros_seq01 for column par_id in table vitalis_parametros ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_parametros_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_parametros FOR EACH ROW
BEGIN
    if :new.par_id is null or :new.par_id <= 0 then
        :new.par_id := VITALIS_SCHEMA.vitalis_parametros_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_parametros_TGR02 AFTER UPDATE OF par_id
ON VITALIS_SCHEMA.vitalis_parametros FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column par_id in table vitalis_parametros as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_bitacoras_seq01 for column bit_id in table vitalis_bitacoras ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_bitacoras_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_bitacoras FOR EACH ROW
BEGIN
    if :new.bit_id is null or :new.bit_id <= 0 then
        :new.bit_id := VITALIS_SCHEMA.vitalis_bitacoras_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_bitacoras_TGR02 AFTER UPDATE OF bit_id
ON VITALIS_SCHEMA.vitalis_bitacoras FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column bit_id in table vitalis_bitacoras as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_padron_nacional_seq01 for column pad_id in table vitalis_padron_nacional ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_padron_nacional_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_padron_nacional FOR EACH ROW
BEGIN
    if :new.pad_id is null or :new.pad_id <= 0 then
        :new.pad_id := VITALIS_SCHEMA.vitalis_padron_nacional_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_padron_nacional_TGR02 AFTER UPDATE OF pad_id
ON VITALIS_SCHEMA.vitalis_padron_nacional FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pad_id in table vitalis_padron_nacional as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_puestos_turno_seq01 for column put_id in table vitalis_puestos_turnos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_puestos_turnos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_puestos_turnos FOR EACH ROW
BEGIN
    if :new.put_id is null or :new.put_id <= 0 then
        :new.put_id := VITALIS_SCHEMA.vitalis_puestos_turno_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_puestos_turnos_TGR02 AFTER UPDATE OF put_id
ON VITALIS_SCHEMA.vitalis_puestos_turnos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column put_id in table vitalis_puestos_turnos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_perfiles_pantallas_seq01 for column prp_id in table vitalis_perfiles_pantallas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_perfiles_pantallas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_perfiles_pantallas FOR EACH ROW
BEGIN
    if :new.prp_id is null or :new.prp_id <= 0 then
        :new.prp_id := VITALIS_SCHEMA.vitalis_perfiles_pantallas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_perfiles_pantallas_TGR02 AFTER UPDATE OF prp_id
ON VITALIS_SCHEMA.vitalis_perfiles_pantallas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column prp_id in table vitalis_perfiles_pantallas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_personal_tipos_planillas_seq01 for column ptp_id in table vitalis_personal_tipos_planillas ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_personal_tipos_planillas_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_personal_tipos_planillas FOR EACH ROW
BEGIN
    if :new.ptp_id is null or :new.ptp_id <= 0 then
        :new.ptp_id := VITALIS_SCHEMA.vitalis_personal_tipos_planillas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_personal_tipos_planillas_TGR02 AFTER UPDATE OF ptp_id
ON VITALIS_SCHEMA.vitalis_personal_tipos_planillas FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column ptp_id in table vitalis_personal_tipos_planillas as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_identificacion_seq01 for column ide_id in table vitalis_identificacion ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_identificacion_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_identificacion FOR EACH ROW
BEGIN
    if :new.ide_id is null or :new.ide_id <= 0 then
        :new.ide_id := VITALIS_SCHEMA.vitalis_identificacion_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_identificacion_TGR02 AFTER UPDATE OF ide_id
ON VITALIS_SCHEMA.vitalis_identificacion FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column ide_id in table vitalis_identificacion as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_notificaciones_seq01 for column not_id in table vitalis_notificaciones ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_notificaciones_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_notificaciones FOR EACH ROW
BEGIN
    if :new.not_id is null or :new.not_id <= 0 then
        :new.not_id := VITALIS_SCHEMA.vitalis_notificaciones_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_notificaciones_TGR02 AFTER UPDATE OF not_id
ON VITALIS_SCHEMA.vitalis_notificaciones FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column not_id in table vitalis_notificaciones as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_contratos_seq01 for column ctr_id in table vitalis_contratos ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_contratos_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_contratos FOR EACH ROW
BEGIN
    if :new.ctr_id is null or :new.ctr_id <= 0 then
        :new.ctr_id := VITALIS_SCHEMA.vitalis_contratos_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_contratos_TGR02 AFTER UPDATE OF ctr_id
ON VITALIS_SCHEMA.vitalis_contratos FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column ctr_id in table vitalis_contratos as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_incapacidades_seq01 for column inc_id in table vitalis_incapacidades ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_incapacidades_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_incapacidades FOR EACH ROW
BEGIN
    if :new.inc_id is null or :new.inc_id <= 0 then
        :new.inc_id := VITALIS_SCHEMA.vitalis_incapacidades_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_incapacidades_TGR02 AFTER UPDATE OF inc_id
ON VITALIS_SCHEMA.vitalis_incapacidades FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column inc_id in table vitalis_incapacidades as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_vacaciones_seq01 for column vac_id in table vitalis_vacaciones ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_vacaciones_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_vacaciones FOR EACH ROW
BEGIN
    if :new.vac_id is null or :new.vac_id <= 0 then
        :new.vac_id := VITALIS_SCHEMA.vitalis_vacaciones_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_vacaciones_TGR02 AFTER UPDATE OF vac_id
ON VITALIS_SCHEMA.vitalis_vacaciones FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column vac_id in table vitalis_vacaciones as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_feriados_seq01 for column fer_id in table vitalis_feriados ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_feriados_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_feriados FOR EACH ROW
BEGIN
    if :new.fer_id is null or :new.fer_id <= 0 then
        :new.fer_id := VITALIS_SCHEMA.vitalis_feriados_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_feriados_TGR02 AFTER UPDATE OF fer_id
ON VITALIS_SCHEMA.vitalis_feriados FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column fer_id in table vitalis_feriados as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_consultorios_seq01 for column con_id in table vitalis_consultorios ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_consultorios_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_consultorios FOR EACH ROW
BEGIN
    if :new.con_id is null or :new.con_id <= 0 then
        :new.con_id := VITALIS_SCHEMA.vitalis_consultorios_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_consultorios_TGR02 AFTER UPDATE OF con_id
ON VITALIS_SCHEMA.vitalis_consultorios FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column con_id in table vitalis_consultorios as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_facturas_detalle_seq01 for column fad_id in table vitalis_facturas_detalle ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_facturas_detalle_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_facturas_detalle FOR EACH ROW
BEGIN
    if :new.fad_id is null or :new.fad_id <= 0 then
        :new.fad_id := VITALIS_SCHEMA.vitalis_facturas_detalle_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_facturas_detalle_TGR02 AFTER UPDATE OF fad_id
ON VITALIS_SCHEMA.vitalis_facturas_detalle FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column fad_id in table vitalis_facturas_detalle as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_facturas_seq01 for column fac_id in table vitalis_facturas_centros ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_facturas_centros_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_facturas_centros FOR EACH ROW
BEGIN
    if :new.fac_id is null or :new.fac_id <= 0 then
        :new.fac_id := VITALIS_SCHEMA.vitalis_facturas_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_facturas_centros_TGR02 AFTER UPDATE OF fac_id
ON VITALIS_SCHEMA.vitalis_facturas_centros FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column fac_id in table vitalis_facturas_centros as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_autoregistros_seq01 for column aur_id in table vitalis_autoregistros ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_autoregistros_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_autoregistros FOR EACH ROW
BEGIN
    if :new.aur_id is null or :new.aur_id <= 0 then
        :new.aur_id := VITALIS_SCHEMA.vitalis_autoregistros_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_autoregistros_TGR02 AFTER UPDATE OF aur_id
ON VITALIS_SCHEMA.vitalis_autoregistros FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column aur_id in table vitalis_autoregistros as it uses sequence.');
END;
/

-- Trigger for sequence vitalis_planillas_notificaciones_seq01 for column pln_id in table vitalis_plantillas_notificacion ---------
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_plantillas_notificacion_TGR01 BEFORE INSERT
ON VITALIS_SCHEMA.vitalis_plantillas_notificacion FOR EACH ROW
BEGIN
    if :new.pln_id is null or :new.pln_id <= 0 then
        :new.pln_id := VITALIS_SCHEMA.vitalis_planillas_notificaciones_seq01.nextval;
    end if;
END;
/
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_plantillas_notificacion_TGR02 AFTER UPDATE OF pln_id
ON VITALIS_SCHEMA.vitalis_plantillas_notificacion FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20010,'Cannot update column pln_id in table vitalis_plantillas_notificacion as it uses sequence.');
END;
/
