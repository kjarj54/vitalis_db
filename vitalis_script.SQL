/*
Created: 16/8/2025
Modified: 27/10/2025
Model: Vitalis
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_paises_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_provincias_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_cantones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_distritos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_direcciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_facturas_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_facturas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_consultorios_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_feriados_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_resumen_financiero_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_centros_salud_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_procedimientos_medicos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_escalas_mensuales_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_puestos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tipos_procedimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_puestos_turno_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_escalas_base_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_escalas_base_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_telefonos_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_bancos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tipos_cuenta_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_cuentas_bancarias_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_usuarios_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_vacaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_contratos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_incapacidades_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_identificacion_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_personal_tipos_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tipos_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tipos_movimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_planillas_movimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_planillas_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_documentos_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_autoregistros_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_autoregistros_documentos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tipos_documentos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_estados_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_perfiles_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_pantallas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_perfiles_pantallas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_bitacoras_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_parametros_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_tarifas_historial_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_padron_nacional_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_notificaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE VITALIS_SCHEMA.vitalis_planillas_notificaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

-- Create tables section -------------------------------------------------

-- Table VITALIS_SCHEMA.vitalis_paises

CREATE TABLE VITALIS_SCHEMA.vitalis_paises(
  pai_id Number NOT NULL,
  pai_codigo Varchar2(4 ) NOT NULL,
  pai_nombre Varchar2(100 ) NOT NULL,
  pai_estado Char(1 ) NOT NULL,
  pai_version Number DEFAULT 1,
  CONSTRAINT vitalis_paises_ck01 CHECK (pai_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_paises

ALTER TABLE VITALIS_SCHEMA.vitalis_paises ADD CONSTRAINT vitalis_paises_pk PRIMARY KEY (pai_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_paises.pai_id IS 'ID único del país'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_paises.pai_codigo IS 'Código ISO del país
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_paises.pai_nombre IS 'Nombre del país'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_paises.pai_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_paises.pai_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_provincia

CREATE TABLE VITALIS_SCHEMA.vitalis_provincia(
  pro_id Number NOT NULL,
  pai_id Number,
  pro_codigo Varchar2(10 ),
  pro_nombre Varchar2(100 ),
  pro_estado Varchar2(1 ),
  pro_version Number NOT NULL,
  CONSTRAINT vitalis_provincia_ck01 CHECK (pro_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_provincia

CREATE INDEX vitalis_provincia_ind01 ON VITALIS_SCHEMA.vitalis_provincia (pai_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_provincia

ALTER TABLE VITALIS_SCHEMA.vitalis_provincia ADD CONSTRAINT vitalis_provincia_pk PRIMARY KEY (pro_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pro_id IS 'ID único de la provincia'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pai_id IS 'Referencia a vitalis_paises
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pro_codigo IS 'Código de la provincia'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pro_nombre IS 'Nombre de la provincia
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pro_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_provincia.pro_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_cantones

CREATE TABLE VITALIS_SCHEMA.vitalis_cantones(
  can_id Number NOT NULL,
  can_codigo Number NOT NULL,
  can_nombre Varchar2(100 ) NOT NULL,
  can_estado Varchar2(1 ) NOT NULL,
  can_version Number DEFAULT 1 NOT NULL,
  can_pro_id Number,
  CONSTRAINT vitalis_cantones_ck01 CHECK (can_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_cantones

CREATE INDEX vitalis_cantones_ind01 ON VITALIS_SCHEMA.vitalis_cantones (can_pro_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_cantones

ALTER TABLE VITALIS_SCHEMA.vitalis_cantones ADD CONSTRAINT vitalis_cantones_pk PRIMARY KEY (can_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cantones.can_codigo IS 'Codigo del canton'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cantones.can_nombre IS 'Nombre del cantón'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cantones.can_estado IS 'A=Activo o I=inactivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cantones.can_version IS 'version del cantón'
;

-- Table VITALIS_SCHEMA.vitalis_distritos

CREATE TABLE VITALIS_SCHEMA.vitalis_distritos(
  dis_id Number NOT NULL,
  dis_codigo Number NOT NULL,
  dis_nombre Varchar2(100 ) NOT NULL,
  dis_estado Varchar2(1 ) NOT NULL,
  dis_version Number NOT NULL,
  dis_can_id Number,
  CONSTRAINT vitalis_distritos_ck01 CHECK (dis_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_distritos

CREATE INDEX viatalis_distritos_ind01 ON VITALIS_SCHEMA.vitalis_distritos (dis_can_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_distritos

ALTER TABLE VITALIS_SCHEMA.vitalis_distritos ADD CONSTRAINT vitalis_distritos_pk PRIMARY KEY (dis_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_id IS ' ID único del distrito'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_codigo IS 'Código del distrito
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_nombre IS 'Nombre del distrito
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_distritos.dis_can_id IS 'Referencia a vitalis_cantones
'
;

-- Table VITALIS_SCHEMA.vitalis_tipos_documentos

CREATE TABLE VITALIS_SCHEMA.vitalis_tipos_documentos(
  tdo_id Number NOT NULL,
  tdo_nombre Varchar2(30 ) NOT NULL,
  tdo_descripcion Varchar2(500 ) NOT NULL,
  tdo_tipo_personal Varchar2(20 ) NOT NULL,
  tdo_url_recurso Varchar2(200 ) NOT NULL,
  tdo_estado Char(1 ) NOT NULL,
  tdo_version Number,
  CONSTRAINT vitalis_tipos_documentos_ck01 CHECK (tdo_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_tipos_documentos

ALTER TABLE VITALIS_SCHEMA.vitalis_tipos_documentos ADD CONSTRAINT vitalis_tipos_documentos_pk PRIMARY KEY (tdo_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON TABLE VITALIS_SCHEMA.vitalis_tipos_documentos IS 'Tabla para almacenar los documentos solicitados al momento de la contratación. '
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_id IS 'ID único del tipo de documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_nombre IS 'Nombre del tipo de documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_descripcion IS 'Descripción del tipo de documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_tipo_personal IS 'Tipo de personal (MEDICO, ADMINISTRATIVO, AMBOS)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_url_recurso IS 'URL del recurso o documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_documentos.tdo_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_bancos

CREATE TABLE VITALIS_SCHEMA.vitalis_bancos(
  ban_id Number NOT NULL,
  ban_ced_juridica Varchar2(10 ) NOT NULL,
  ban_nombre Varchar2(70 ) NOT NULL,
  ban_estado Char(1 ) NOT NULL,
  ban_version Number,
  CONSTRAINT vitalis_bancos_ck01 CHECK (ban_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_bancos

ALTER TABLE VITALIS_SCHEMA.vitalis_bancos ADD CONSTRAINT vitalis_bancos_pk PRIMARY KEY (ban_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bancos.ban_ced_juridica IS 'Cedula juridica del banco'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bancos.ban_nombre IS 'Nombre del banco'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bancos.ban_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bancos.ban_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_tipos_cuenta

CREATE TABLE VITALIS_SCHEMA.vitalis_tipos_cuenta(
  tcu_id Number NOT NULL,
  tcu_nombre Varchar2(50 ) NOT NULL,
  tcu_estado Char(1 ) NOT NULL,
  tcu_moneda Varchar2(10 ) NOT NULL,
  tcu_version Number,
  CONSTRAINT vitalis_tipos_cuenta_ck01 CHECK (tcu_estado in ('A', 'I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_tipos_cuenta

ALTER TABLE VITALIS_SCHEMA.vitalis_tipos_cuenta ADD CONSTRAINT vitalis_tipos_cuenta_pk PRIMARY KEY (tcu_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_cuenta.tcu_nombre IS 'Nombre del tipo de cuenta (Corriente, Ahorros, etc.)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_cuenta.tcu_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_cuenta.tcu_moneda IS 'Tipo de moneda en la que esta la cuenta'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_cuenta.tcu_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_personas

CREATE TABLE VITALIS_SCHEMA.vitalis_personas(
  per_id Number NOT NULL,
  per_nombre Varchar2(20 ) NOT NULL,
  per_apellido1 Varchar2(15 ) NOT NULL,
  per_apellido2 Varchar2(15 ) NOT NULL,
  per_estado_civil Varchar2(10 ) NOT NULL,
  per_fecha_nacimiento Date NOT NULL,
  per_sexo Char(1 ) NOT NULL,
  per_email Varchar2(200 ) NOT NULL,
  per_estado Char(1 ) NOT NULL,
  per_tipo_personal Char(20 ) NOT NULL,
  per_version Number DEFAULT 1,
  CONSTRAINT vitalis_personas_ck01 CHECK (per_sexo in ('M', 'F')),
  CONSTRAINT vitalis_personas_ck02 CHECK (per_estado in ('A', 'I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_personas

ALTER TABLE VITALIS_SCHEMA.vitalis_personas ADD CONSTRAINT vitalis_personas_pk PRIMARY KEY (per_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_id IS 'ID único de la persona'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_nombre IS 'Nombre de la person'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_apellido1 IS 'Primer apellido
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_apellido2 IS 'Segundo apellido'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_estado_civil IS 'Estado civil'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_fecha_nacimiento IS 'Fecha de nacimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_sexo IS 'Sexo de la persona (M=masculino, F= femenino)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_email IS 'Correo electrónico'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_estado IS 'Estado de la persona(A= activo, I= inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_tipo_personal IS 'Tipo personal(MÉDICO, ADMINISTRATIVO)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personas.per_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_direcciones_personas

CREATE TABLE VITALIS_SCHEMA.vitalis_direcciones_personas(
  dpe_id Number NOT NULL,
  dpe_tipo_direccion Varchar2(10 ) NOT NULL,
  dpe_direccion_exacta Varchar2(250 ) NOT NULL,
  dpe_principal Char(1 ) NOT NULL,
  dpe_codigo_postal Varchar2(30 ) NOT NULL,
  dpe_version Number DEFAULT 1,
  dpe_per_id Number NOT NULL,
  dpe_dis_id Number NOT NULL,
  CONSTRAINT vitalis_direcciones_personas_ck01 CHECK (dpe_principal in ('S','N'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_direcciones_personas

CREATE INDEX vitalis_direcciones_personas_ind01 ON VITALIS_SCHEMA.vitalis_direcciones_personas (dpe_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_direcciones_personas_ind02 ON VITALIS_SCHEMA.vitalis_direcciones_personas (dpe_dis_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_direcciones_personas

ALTER TABLE VITALIS_SCHEMA.vitalis_direcciones_personas ADD CONSTRAINT vitalis_direcciones_personas_pk PRIMARY KEY (dpe_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_tipo_direccion IS 'Casa, trabajo, apartamento, otro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_direccion_exacta IS 'Direccion exacta'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_principal IS 'Dirección principal (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_codigo_postal IS 'Codigo postal'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_direcciones_personas.dpe_dis_id IS 'Referencia a vitalis_distritos'
;

-- Table VITALIS_SCHEMA.vitalis_telefonos_personas

CREATE TABLE VITALIS_SCHEMA.vitalis_telefonos_personas(
  tpe_id Number NOT NULL,
  tpe_numero Varchar2(12 ) NOT NULL,
  tpe_tipo Varchar2(10 ) NOT NULL,
  tpe_principal Varchar2(1 ) NOT NULL,
  tpe_estado Varchar2(1 ) NOT NULL,
  tpe_version Number,
  tpe_per_id Number NOT NULL,
  CONSTRAINT vitalis_telefonos_personas_ck01 CHECK (tpe_estado in ('A', 'I')),
  CONSTRAINT vitalis_telefonos_personas_ck02 CHECK (tpe_principal in ('S', 'N'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_telefonos_personas

CREATE INDEX vitalis_telefonos_personas_ind01 ON VITALIS_SCHEMA.vitalis_telefonos_personas (tpe_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_telefonos_personas

ALTER TABLE VITALIS_SCHEMA.vitalis_telefonos_personas ADD CONSTRAINT vitalis_telefonos_personas_pk PRIMARY KEY (tpe_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_id IS 'ID único del teléfono'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_numero IS 'Número de teléfono'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_tipo IS 'CELULAR, CASA, TRABAJO, FAX, ETC'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_principal IS 'Teléfono principal (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_telefonos_personas.tpe_per_id IS 'Referencia a vitalis_personas'
;

-- Table VITALIS_SCHEMA.vitalis_cuentas_bancarias

CREATE TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias(
  cba_id Number NOT NULL,
  cba_numero_cuenta Varchar2(50 ) NOT NULL,
  cba_iban Varchar2(50 ) NOT NULL,
  cba_principal Char(1 ) NOT NULL,
  cba_estado Char(1 ) NOT NULL,
  cba_version Number DEFAULT 1,
  cba_per_id Number NOT NULL,
  cba_ban_id Number NOT NULL,
  cba_tcu_id Number NOT NULL,
  CONSTRAINT vitalis_cuentas_bancarias_ck01 CHECK (cba_principal in ('S','N')),
  CONSTRAINT vitalis_cuentas_bancarias_ck02 CHECK (cba_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_cuentas_bancarias

CREATE INDEX vitalis_cuentas_bancarias_ind01 ON VITALIS_SCHEMA.vitalis_cuentas_bancarias (cba_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_cuentas_bancarias_ind02 ON VITALIS_SCHEMA.vitalis_cuentas_bancarias (cba_ban_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_cuentas_bancarias_ind03 ON VITALIS_SCHEMA.vitalis_cuentas_bancarias (cba_tcu_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_cuentas_bancarias

ALTER TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_cuentas_bancarias_pk PRIMARY KEY (cba_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias IS 'Tabla para manejo tanto de bancos como de cuentas bancarias asociada a persona '
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_id IS 'ID único de la cuenta bancaria'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_numero_cuenta IS 'Número de cuenta'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_iban IS 'Código IBAN'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_principal IS 'Cuenta principal (S=Sí, N=No)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_ban_id IS 'Referencia a vitalis_bancos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_cuentas_bancarias.cba_tcu_id IS 'Referencia a vitalis_tipos_cuenta'
;

-- Table VITALIS_SCHEMA.vitalis_documentos_personas

CREATE TABLE VITALIS_SCHEMA.vitalis_documentos_personas(
  dop_id Number NOT NULL,
  dop_nombre_archivo Varchar2(50 ) NOT NULL,
  dop_ruta_archivo Varchar2(200 ) NOT NULL,
  dop_fecha_carga Date NOT NULL,
  dop_descripcion Varchar2(500 ) NOT NULL,
  dop_autoridad_emisora Varchar2(150 ) NOT NULL,
  dop_fecha_vencimiento Date NOT NULL,
  dop_observaciones Varchar2(200 ) NOT NULL,
  dop_version Number DEFAULT 1 NOT NULL,
  dop_per_id Number NOT NULL,
  dop_tdo_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_documentos_personas

CREATE INDEX vitalis_documentos_personas_fk01 ON VITALIS_SCHEMA.vitalis_documentos_personas (dop_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_documentos_personas_fk02 ON VITALIS_SCHEMA.vitalis_documentos_personas (dop_tdo_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_documentos_personas

ALTER TABLE VITALIS_SCHEMA.vitalis_documentos_personas ADD CONSTRAINT vitalis_documentos_personas_pk PRIMARY KEY (dop_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_id IS 'ID único del documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_nombre_archivo IS 'Nombre del archivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_ruta_archivo IS 'Ruta del archivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_fecha_carga IS 'Fecha de carga'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_descripcion IS 'Descripcion del documento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_autoridad_emisora IS 'Autoridad emisora'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_fecha_vencimiento IS 'Fecha de vencimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_observaciones IS 'Observaciones del archivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_documentos_personas.dop_tdo_id IS 'Referencia a vitalis_tipos_documentos'
;

-- Table VITALIS_SCHEMA.vitalis_perfiles

CREATE TABLE VITALIS_SCHEMA.vitalis_perfiles(
  prf_id Number NOT NULL,
  prf_nombre Varchar2(20 ) NOT NULL,
  prf_descripcion Varchar2(100 ) NOT NULL,
  prf_estado Char(1 ) NOT NULL,
  prf_version Number DEFAULT 1,
  CONSTRAINT vitalis_perfiles_ck01 CHECK (prf_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_perfiles

ALTER TABLE VITALIS_SCHEMA.vitalis_perfiles ADD CONSTRAINT vitalis_perfiles_pk PRIMARY KEY (prf_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles.prf_id IS 'ID único del perfil'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles.prf_nombre IS 'Nombre del perfil'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles.prf_descripcion IS 'Descripción del perfil'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles.prf_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles.prf_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_pantallas

CREATE TABLE VITALIS_SCHEMA.vitalis_pantallas(
  pan_id Number NOT NULL,
  pan_codigo Number NOT NULL,
  pan_nombre Varchar2(30 ) NOT NULL,
  pan_descripcion Varchar2(100 ) NOT NULL,
  pan_modulo Number NOT NULL,
  pan_estado Char(1 ) NOT NULL,
  pan_version Number DEFAULT 1 NOT NULL,
  pan_fk_id Number,
  CONSTRAINT vitalis_pantallas_ck01 CHECK (pan_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_pantallas

CREATE INDEX vitales_pantallas_fk01 ON VITALIS_SCHEMA.vitalis_pantallas (pan_fk_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_pantallas

ALTER TABLE VITALIS_SCHEMA.vitalis_pantallas ADD CONSTRAINT vitalis_pantallas_pk PRIMARY KEY (pan_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_codigo IS 'Código de la pantalla
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_nombre IS 'Nombre de la pantalla
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_descripcion IS 'Descripción de la pantalla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_modulo IS 'Módulo al que pertenece'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_pantallas.pan_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_usuarios

CREATE TABLE VITALIS_SCHEMA.vitalis_usuarios(
  usu_id Number NOT NULL,
  usu_login Varchar2(20 ) NOT NULL,
  usu_password Varchar2(20 ) NOT NULL,
  usu_fecha_creacion Date NOT NULL,
  usu_fecha_ultimo_acceso Date NOT NULL,
  usu_intentos_fallidos Number NOT NULL,
  usu_bloqueado Char(1 ) NOT NULL,
  usu_estado Char(1 ) NOT NULL,
  usu_version Number DEFAULT 1,
  usu_per_id Number NOT NULL,
  usu_prf_id Number NOT NULL,
  CONSTRAINT vitalis_usuarios_ck01 CHECK (usu_bloqueado in ('S','N')),
  CONSTRAINT vitalis_usuarios_ck02 CHECK (usu_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_usuarios

CREATE INDEX vitalis_usuarios_ind01 ON VITALIS_SCHEMA.vitalis_usuarios (usu_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_usuarios_ind02 ON VITALIS_SCHEMA.vitalis_usuarios (usu_prf_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_usuarios

ALTER TABLE VITALIS_SCHEMA.vitalis_usuarios ADD CONSTRAINT vitalis_usuarios_pk PRIMARY KEY (usu_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_id IS 'ID único del usuario
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_login IS 'Nombre de usuario
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_password IS 'Contraseña encriptada
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_fecha_ultimo_acceso IS 'Fecha del último acceso'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_intentos_fallidos IS 'Intentos fallidos de login
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_bloqueado IS 'Usuario bloqueado (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_per_id IS 'Referencia a vitalis_personas
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_usuarios.usu_prf_id IS 'Referencia a vitalis_perfiles'
;

-- Table VITALIS_SCHEMA.vitalis_centros_salud

CREATE TABLE VITALIS_SCHEMA.vitalis_centros_salud(
  csa_id Number NOT NULL,
  csa_codigo Number NOT NULL,
  csa_nombre Varchar2(20 ) NOT NULL,
  csa_direccion_exacta Varchar2(200 ) NOT NULL,
  csa_telefono Varchar2(15 ) NOT NULL,
  csa_email Varchar2(30 ) NOT NULL,
  csa_contacto_principal Varchar2(30 ) NOT NULL,
  csa_telefono_contacto Varchar2(30 ) NOT NULL,
  csa_estado Char(1 ) NOT NULL,
  csa_version Number,
  csa_dis_id Number NOT NULL,
  CONSTRAINT vitalis_centros_salud_ck01 CHECK (csa_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_centros_salud

CREATE INDEX vitalis_centros_salud_ind01 ON VITALIS_SCHEMA.vitalis_centros_salud (csa_dis_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_centros_salud

ALTER TABLE VITALIS_SCHEMA.vitalis_centros_salud ADD CONSTRAINT vitalis_centros_salud_pk PRIMARY KEY (csa_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_id IS 'ID único del centro de salud
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_codigo IS 'Código del centro de salud'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_nombre IS 'Nombre del centro de salud'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_direccion_exacta IS 'Dirección exacta'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_telefono IS 'Teléfono principal
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_email IS 'Correo electrónico'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_contacto_principal IS 'Nombre del contacto principal'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_telefono_contacto IS 'Teléfono del contacto
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_version IS 'Version de los centros de salud'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_centros_salud.csa_dis_id IS 'Referencia a vitalis_distritos'
;

-- Table VITALIS_SCHEMA.vitalis_tipos_procedimientos

CREATE TABLE VITALIS_SCHEMA.vitalis_tipos_procedimientos(
  tpr_id Number NOT NULL,
  tpr_codigo Number NOT NULL,
  tpr_nombre Varchar2(20 ) NOT NULL,
  tpr_descripcion Varchar2(500 ) NOT NULL,
  tpr_monto_base_cobrar Number NOT NULL,
  tpr_monto_base_pagar Number NOT NULL,
  tpr_estado Char(1 ) NOT NULL,
  tpr_version Number,
  CONSTRAINT vitalis_tipos_procedimientos CHECK (tpr_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_tipos_procedimientos

ALTER TABLE VITALIS_SCHEMA.vitalis_tipos_procedimientos ADD CONSTRAINT vitalis_tipos_procedimientos_pk PRIMARY KEY (tpr_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_id IS ' ID único del tipo de procedimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_codigo IS 'Código del tipo de procedimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_nombre IS 'Nombre del tipo de procedimiento
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_descripcion IS 'Descripción del procedimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_monto_base_cobrar IS 'Monto base a cobrar'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_monto_base_pagar IS 'Monto base a pagar al médico'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_procedimientos.tpr_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_procedimientos_medicos

CREATE TABLE VITALIS_SCHEMA.vitalis_procedimientos_medicos(
  prm_id Number NOT NULL,
  prm_fecha_procedimiento Date NOT NULL,
  prm_hora_inicio Timestamp(4) NOT NULL,
  prm_hora_fin Timestamp(4) NOT NULL,
  prm_paciente_nombre Varchar2(30 ) NOT NULL,
  prm_paciente_cedula Varchar2(12 ) NOT NULL,
  prm_observaciones Varchar2(500 ) NOT NULL,
  prm_monto_cobrar Number NOT NULL,
  prm_monto_pagar Number NOT NULL,
  prm_procesado Char(1 ) NOT NULL,
  prm_estado Char(1 ) NOT NULL,
  prm_version Number,
  prm_per_id Number NOT NULL,
  prm_csa_id Number NOT NULL,
  prm_tpr_id Number NOT NULL,
  CONSTRAINT vitalis_procedimientos_medicos_ck01 CHECK (prm_procesado in ('S','N')),
  CONSTRAINT vitalis_procedimientos_medicos_ck02 CHECK (prm_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_procedimientos_medicos

CREATE INDEX vitalis_procedimientos_medicos_ind01 ON VITALIS_SCHEMA.vitalis_procedimientos_medicos (prm_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_procedimientos_medicos_ind02 ON VITALIS_SCHEMA.vitalis_procedimientos_medicos (prm_tpr_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_procedimientos_medicos_ind03 ON VITALIS_SCHEMA.vitalis_procedimientos_medicos (prm_csa_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_procedimientos_medicos

ALTER TABLE VITALIS_SCHEMA.vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_procedimientos_medicos_pk PRIMARY KEY (prm_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_fecha_procedimiento IS 'Fecha del procedimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_hora_inicio IS 'Hora de inicio
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_hora_fin IS 'Hora de fin'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_paciente_nombre IS 'Nombre del paciente'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_paciente_cedula IS 'Cédula del paciente'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_observaciones IS 'Observaciones del procedimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_monto_cobrar IS 'Monto a cobrar al centro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_monto_pagar IS 'Monto a pagar al médico'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_procesado IS 'Procesado en planilla (S=Sí, N=No)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_estado IS ' Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_per_id IS 'Referencia a vitalis_personas (médico)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_csa_id IS 'Referencia a vitalis_centros_salud'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_procedimientos_medicos.prm_tpr_id IS 'Referencia a vitalis_tipos_procedimientos'
;

-- Table VITALIS_SCHEMA.vitalis_escalas_base

CREATE TABLE VITALIS_SCHEMA.vitalis_escalas_base(
  esd_id Number NOT NULL,
  esd_dia_semana Number NOT NULL,
  esd_estado Char(1 ) NOT NULL,
  esd_version Number,
  esd_fecha_creacion Date NOT NULL,
  esd_nombre Char(30 ) NOT NULL,
  esd_dia_inicio Date NOT NULL,
  esd_dia_fin Date NOT NULL,
  esd_per_id Number NOT NULL,
  esd_put_id Number NOT NULL,
  CONSTRAINT vitalis_escalas_base_ck01 CHECK (esd_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_escalas_base

CREATE INDEX vitalis_escalas_base_detalle_ind01 ON VITALIS_SCHEMA.vitalis_escalas_base (esd_per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_escalas_base_detalle_ind03 ON VITALIS_SCHEMA.vitalis_escalas_base (esd_put_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_escalas_base

ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_base ADD CONSTRAINT vitalis_escalas_base_detalle_pk PRIMARY KEY (esd_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_id IS 'ID único del detalle de escala base'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_dia_semana IS 'Día de la semana (1=Lunes, 7=Domingo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_estado IS 'A=activo I=inactivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_nombre IS 'Nombre de la escala base'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_dia_inicio IS 'Fecha de inicio de la semana'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_dia_fin IS 'Fecha de fin de la semana'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_per_id IS 'Referencia a vitalis_personas (médico)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_base.esd_put_id IS 'Referencia a vitalis_puestos_turnos'
;

-- Table VITALIS_SCHEMA.vitalis_escalas_mensuales

CREATE TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales(
  esm_id Number NOT NULL,
  esm_mes Number NOT NULL,
  esm_anio Number NOT NULL,
  esm_nombre Varchar2(20 ) NOT NULL,
  esm_fecha_creacion Date NOT NULL,
  esm_estado Varchar2(30 ) NOT NULL,
  esm_procesado Char(1 ) NOT NULL,
  esm_version Number DEFAULT 1,
  esm_esd_id Number NOT NULL,
  esm_csa_id Number NOT NULL,
  CONSTRAINT vitalis_escalas_mensuales_ck01 CHECK (esm_procesado in ('S','N'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_escalas_mensuales

CREATE INDEX vitalis_escalas_mensuales_ind02 ON VITALIS_SCHEMA.vitalis_escalas_mensuales (esm_csa_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_escalasbasesescalasmensuales_fk01 ON VITALIS_SCHEMA.vitalis_escalas_mensuales (esm_esd_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_escalas_mensuales

ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales ADD CONSTRAINT vitalis_escalas_mensuales_pk PRIMARY KEY (esm_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_id IS 'ID único de la escala mensual'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_mes IS 'Mes de la escala
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_anio IS 'Año de la escala'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_nombre IS 'Nombre de la escala mensual'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_estado IS 'CONSTRUCCION, VIGENTE, EN_REVISION, LISTA_PAGO, PROCESADA'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_procesado IS 'Procesado en planilla (S=Sí, N=No)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales.esm_csa_id IS 'Referencia a vitalis_centros_salud'
;

-- Table VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle

CREATE TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle(
  emd_id Number NOT NULL,
  emd_fecha Date,
  emd_trabajado Char(1 ),
  emd_hora_inicio_real Timestamp(4),
  emd_hora_fin_real Timestamp(4),
  emd_horas_trabajadas Number,
  emd_observaciones Varchar2(500 ),
  emd_procesado Char(1 ),
  emd_estado Char(1 ),
  put_id Number,
  per_id Number,
  esm_id Number,
  CONSTRAINT vitalis_escalas_mensuales_detalle_ck01 CHECK (emd_procesado in ('S','N')),
  CONSTRAINT vitalis_escalas_mensuales_detalle_ck02 CHECK (emd_trabajado in ('S','N'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle

CREATE INDEX vitalis_escalas_mensuales_detalle_ind01 ON VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle (esm_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_escalas_mensuales_detalle_ind02 ON VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle (per_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_escalas_mensuales_detalle_ind03 ON VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle (put_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle

ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_escalas_mensuales_detalle_pk PRIMARY KEY (emd_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_id IS 'ID único del detalle de escala mensual'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_fecha IS 'Fecha específica del turno
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_trabajado IS 'Si trabajó (S=Sí, N=No)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_hora_inicio_real IS 'Hora real de inicio
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_hora_fin_real IS 'Hora real de fin
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_horas_trabajadas IS 'Horas realmente trabajadas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_observaciones IS 'Observaciones del turno'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_procesado IS 'Procesado en planilla (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.emd_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.put_id IS 'Referencia a vitalis_puestos_turnos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.per_id IS 'Referencia a vitalis_personas (médico)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle.esm_id IS 'Referencia a vitalis_escalas_mensuales'
;

-- Table VITALIS_SCHEMA.vitalis_tipos_planillas

CREATE TABLE VITALIS_SCHEMA.vitalis_tipos_planillas(
  tpl_id Number NOT NULL,
  tpl_codigo Number NOT NULL,
  tpl_nombre Varchar2(20 ) NOT NULL,
  tpl_descripcion Varchar2(500 ) NOT NULL,
  tpl_tipo_personal Char(1 ) NOT NULL,
  tpl_estado Char(1 ) NOT NULL,
  tpl_version Number DEFAULT 1,
  CONSTRAINT vitalis_tipos_planillas_ck01 CHECK (tpl_tipo_personal in ('M','A')),
  CONSTRAINT vitalis_tipos_planillas_ck02 CHECK (tpl_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_tipos_planillas

ALTER TABLE VITALIS_SCHEMA.vitalis_tipos_planillas ADD CONSTRAINT vitalis_tipos_planillas_pk PRIMARY KEY (tpl_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_id IS 'ID único del tipo de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_codigo IS 'Código del tipo de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_nombre IS 'Nombre del tipo de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_descripcion IS 'Descripción del tipo de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_tipo_personal IS 'M=Medico, A=Administrativo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_planillas.tpl_estado IS 'Estado (A=Activo, I=Inactivo)'
;

-- Table VITALIS_SCHEMA.vitalis_tipos_movimientos

CREATE TABLE VITALIS_SCHEMA.vitalis_tipos_movimientos(
  tmo_id Number NOT NULL,
  tmo_codigo Number NOT NULL,
  tmo_nombre Varchar2(20 ) NOT NULL,
  tmo_descripcion Varchar2(500 ) NOT NULL,
  tmo_tipo Varchar2(20 ) NOT NULL,
  tmo_calculo Varchar2(20 ) NOT NULL,
  tmo_valor Number NOT NULL,
  tmo_rango_salarial_min Number NOT NULL,
  tmo_rango_salarial_max Number NOT NULL,
  tmo_automatico Char(1 ) NOT NULL,
  tmo_aplica_medicos Char(1 ) NOT NULL,
  tmo_aplica_administrativos Char(1 ) NOT NULL,
  tmo_estado Char(1 ) NOT NULL,
  tmo_version Number DEFAULT 1,
  CONSTRAINT vitalis_tipos_movimientos_ck01 CHECK (tmo_automatico in ('S','N')),
  CONSTRAINT vitalis_tipos_movimientos_ck02 CHECK (tmo_aplica_medicos in ('S','N')),
  CONSTRAINT vitalis_tipos_movimientos_ck03 CHECK (tmo_aplica_administrativos in ('S','N')),
  CONSTRAINT vitalis_tipos_movimientos_ck04 CHECK (tmo_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_tipos_movimientos

ALTER TABLE VITALIS_SCHEMA.vitalis_tipos_movimientos ADD CONSTRAINT vitalis_tipos_movimientos_pk PRIMARY KEY (tmo_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_id IS 'ID único del tipo de movimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_codigo IS 'Código del tipo de movimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_nombre IS 'Nombre del tipo de movimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_descripcion IS 'Descripción del movimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_tipo IS 'INGRESO, DEDUCCION'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_calculo IS 'PORCENTUAL, ABSOLUTO'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_valor IS 'Valor del movimiento (% o monto)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_rango_salarial_min IS 'Rango salarial mínimo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_rango_salarial_max IS 'Rango salarial máximo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_automatico IS 'Movimiento automático (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_aplica_medicos IS 'Aplica a médicos (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_aplica_administrativos IS 'Aplica a administrativos (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_tipos_movimientos.tmo_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_planillas

CREATE TABLE VITALIS_SCHEMA.vitalis_planillas(
  pla_id Number NOT NULL,
  pla_mes Number NOT NULL,
  pla_anio Number NOT NULL,
  pla_nombre Varchar2(20 ) NOT NULL,
  pla_fecha_generacion Date NOT NULL,
  pla_fecha_aprobacion Date NOT NULL,
  pla_usu_aprobador Varchar2(20 ) NOT NULL,
  pla_total_ingresos Number NOT NULL,
  pla_total_deducciones Number NOT NULL,
  pla_total_neto Number NOT NULL,
  pla_estado Char(1 ) NOT NULL,
  pla_notificada Char(1 ) NOT NULL,
  pla_version Number DEFAULT 1,
  pla_tpl_id Number NOT NULL,
  CONSTRAINT vitalis_planillas_ck01 CHECK (pla_estado in ('G','A','P')),
  CONSTRAINT vitalis_planillas_ck02 CHECK (pla_notificada in ('S','N'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_planillas

CREATE INDEX vitalis_planillas_ind01 ON VITALIS_SCHEMA.vitalis_planillas (pla_tpl_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_planillas

ALTER TABLE VITALIS_SCHEMA.vitalis_planillas ADD CONSTRAINT vitalis_planillas_pk PRIMARY KEY (pla_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON TABLE VITALIS_SCHEMA.vitalis_planillas IS 'Tabla para el manejo de las planillas correspondientes a médicos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_id IS 'ID único de la planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_mes IS 'Mes de la planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_anio IS 'Año de la planilla
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_nombre IS 'Nombre de la planilla
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_fecha_generacion IS 'Fecha de generación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_fecha_aprobacion IS 'Fecha de aprobación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_usu_aprobador IS 'Usuario que aprobó'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_total_ingresos IS 'Total de ingresos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_total_deducciones IS 'Total de deducciones'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_total_neto IS 'Total neto a pagar'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_estado IS 'G=generada, A=aprobada, P=Pagada
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_notificada IS 'Comprobantes enviados (S=Sí, N=No)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas.pla_tpl_id IS 'Referencia a vitalis_tipos_planillas'
;

-- Table VITALIS_SCHEMA.vitalis_planillas_detalle

CREATE TABLE VITALIS_SCHEMA.vitalis_planillas_detalle(
  pld_id Number NOT NULL,
  pld_salario_base Number NOT NULL,
  pld_total_ingresos Number NOT NULL,
  pld_total_deducciones Number NOT NULL,
  pld_total_neto Number NOT NULL,
  pld_notificado Char(1 ) NOT NULL,
  pld_fecha_notificacion Date NOT NULL,
  pld_version Number DEFAULT 1,
  pld_per_id Number NOT NULL,
  pld_pla_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_planillas_detalle

CREATE INDEX vitalis_planillas_detalle_ind01 ON VITALIS_SCHEMA.vitalis_planillas_detalle (pld_pla_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_planillas_detalle_ind02 ON VITALIS_SCHEMA.vitalis_planillas_detalle (pld_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_planillas_detalle

ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_detalle ADD CONSTRAINT vitalis_planillas_detalle_pk PRIMARY KEY (pld_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_id IS 'ID único del detalle de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_salario_base IS 'Salario base
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_total_ingresos IS 'Total de ingresos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_total_deducciones IS 'Total de deducciones'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_total_neto IS 'Total neto a pagar
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_notificado IS 'Comprobante enviado (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_fecha_notificacion IS 'Fecha de envío del comprobante'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_version IS 'Version registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_detalle.pld_pla_id IS 'Referencia a vitalis_planillas
'
;

-- Table VITALIS_SCHEMA.vitalis_planillas_movimientos

CREATE TABLE VITALIS_SCHEMA.vitalis_planillas_movimientos(
  plm_id Number NOT NULL,
  plm_concepto Varchar2(500 ) NOT NULL,
  plm_cantidad Number NOT NULL,
  plm_monto Number NOT NULL,
  plm_tipo Varchar2(20 ) NOT NULL,
  plm_version Number DEFAULT 1,
  plm_pld_id Number NOT NULL,
  plm_tmo_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_planillas_movimientos

CREATE INDEX vitalis_planillas_movimientos_ind01 ON VITALIS_SCHEMA.vitalis_planillas_movimientos (plm_tmo_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_planillas_movimientos_ind02 ON VITALIS_SCHEMA.vitalis_planillas_movimientos (plm_pld_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_planillas_movimientos

ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_movimientos ADD CONSTRAINT vitalis_planillas_movimientos_pk PRIMARY KEY (plm_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON TABLE VITALIS_SCHEMA.vitalis_planillas_movimientos IS 'Tabla para manejar los movimientos en planilla, entre ellos nombramientos, ascensos, deducciones e ingresos.'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_id IS 'ID único del movimiento de planilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_concepto IS 'Concepto del movimiento, del porque se hizo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_cantidad IS 'Cantidad (horas, turnos, etc.)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_monto IS 'Monto total del movimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_tipo IS 'ascensos, traslados o nombramientos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_pld_id IS 'Referencia a vitalis_planillas_detalle'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_planillas_movimientos.plm_tmo_id IS 'Referencia a vitalis_tipos_movimientos'
;

-- Table VITALIS_SCHEMA.vitalis_resumen_financiero

CREATE TABLE VITALIS_SCHEMA.vitalis_resumen_financiero(
  ref_id Number NOT NULL,
  ref_mes Number NOT NULL,
  ref_anio Number NOT NULL,
  ref_total_ingresos_turnos Number NOT NULL,
  ref_total_ingresos_procedimientos Number NOT NULL,
  ref_total_ingresos Number NOT NULL,
  ref_total_gastos_medicos Number NOT NULL,
  ref_total_gastos_administrativos Number NOT NULL,
  ref_total_gastos Number NOT NULL,
  ref_utilidad Varchar2(30 ) NOT NULL,
  ref_fecha_generacion Date NOT NULL,
  ref_version Number DEFAULT 1,
  ref_csa_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_resumen_financiero

CREATE INDEX vitalis_resumen_financiero_ind01 ON VITALIS_SCHEMA.vitalis_resumen_financiero (ref_csa_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_resumen_financiero

ALTER TABLE VITALIS_SCHEMA.vitalis_resumen_financiero ADD CONSTRAINT vitalis_resumen_financiero_pk PRIMARY KEY (ref_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_id IS 'ID único del resumen financiero'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_mes IS 'Mes del resumen
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_anio IS 'Año del resumen'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_ingresos_turnos IS 'Total ingresos por turnos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_ingresos_procedimientos IS 'Total ingresos por procedimientos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_ingresos IS 'Total de ingresos
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_gastos_medicos IS 'Total gastos médicos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_gastos_administrativos IS 'Total gastos administrativos'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_total_gastos IS 'Total de gastos
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_utilidad IS 'Utilidad (ingresos - gastos)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_fecha_generacion IS 'Fecha de generación

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_resumen_financiero.ref_csa_id IS 'Referencia a vitalis_centros_salud (NULL para general)'
;

-- Table VITALIS_SCHEMA.vitalis_parametros

CREATE TABLE VITALIS_SCHEMA.vitalis_parametros(
  par_id Number NOT NULL,
  par_codigo Number NOT NULL,
  par_nombre Varchar2(30 ) NOT NULL,
  par_valor Varchar2(30 ) NOT NULL,
  par_descripcion Varchar2(500 ) NOT NULL,
  par_tipo_dato Varchar2(30 ) NOT NULL,
  par_encriptado Char(1 ) NOT NULL,
  par_modulo Varchar2(30 ) NOT NULL,
  par_estado Char(1 ) NOT NULL,
  par_version Number DEFAULT 1,
  CONSTRAINT vitalis_parametros_ck01 CHECK (par_encriptado in ('S','N')),
  CONSTRAINT vitalis_parametros_ck02 CHECK (par_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_parametros

ALTER TABLE VITALIS_SCHEMA.vitalis_parametros ADD CONSTRAINT vitalis_parametros_pk PRIMARY KEY (par_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_id IS 'ID único del parámetro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_codigo IS 'Código del parámetro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_nombre IS 'Nombre del parámetro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_valor IS 'Valor del parámetro
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_descripcion IS 'Descripción del parámetro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_tipo_dato IS 'STRING, NUMBER, DATE, BOOLEAN
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_encriptado IS 'Valor encriptado (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_modulo IS 'Módulo al que pertenece'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_parametros.par_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_bitacoras

CREATE TABLE VITALIS_SCHEMA.vitalis_bitacoras(
  bit_id Number NOT NULL,
  bit_tabla Varchar2(30 ) NOT NULL,
  bit_operacion Varchar2(30 ) NOT NULL,
  bit_pk_tabla Number NOT NULL,
  bit_usuario_id Number NOT NULL,
  bit_fecha Date NOT NULL,
  bit_valores_anteriores Varchar2(30 ) NOT NULL,
  bit_valores_nuevos Varchar2(30 ) NOT NULL,
  bit_ip_usuario Varchar2(12 ) NOT NULL,
  bit_version Number DEFAULT 1,
  bit_usu_id Number
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_bitacoras

CREATE INDEX vitalis_bitacoras_ind01 ON VITALIS_SCHEMA.vitalis_bitacoras (bit_usu_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_bitacoras

ALTER TABLE VITALIS_SCHEMA.vitalis_bitacoras ADD CONSTRAINT vitalis_bitacoras_pk PRIMARY KEY (bit_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_id IS ' ID único de la bitácora'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_tabla IS 'Nombre de la tabla
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_operacion IS 'INSERT, UPDATE, DELETE'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_pk_tabla IS 'Clave primaria del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_usuario_id IS 'Usuario que realizó la operación
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_fecha IS 'Fecha y hora de la operación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_valores_anteriores IS 'Valores anteriores (para UPDATE y DELETE)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_valores_nuevos IS 'Valores nuevos (para INSERT y UPDATE)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_ip_usuario IS 'IP del usuario

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_bitacoras.bit_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_padron_nacional

CREATE TABLE VITALIS_SCHEMA.vitalis_padron_nacional(
  pad_id Number NOT NULL,
  pad_cedula Varchar2(12 ) NOT NULL,
  pad_nombre Varchar2(30 ) NOT NULL,
  pad_apellido1 Varchar2(30 ) NOT NULL,
  pad_apellido2 Varchar2(30 ) NOT NULL,
  pad_codigo_elec Varchar2(6 ) NOT NULL,
  pad_fecha_cadu Date NOT NULL,
  pad_junta_recep Varchar2(5 ) NOT NULL,
  pad_provincia Varchar2(15 ) NOT NULL,
  pad_canton Varchar2(25 ) NOT NULL,
  pad_distrito Varchar2(40 ) NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_padron_nacional

ALTER TABLE VITALIS_SCHEMA.vitalis_padron_nacional ADD CONSTRAINT vitalis_padron_nacional_pk PRIMARY KEY (pad_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

ALTER TABLE VITALIS_SCHEMA.vitalis_padron_nacional ADD CONSTRAINT pad_cedula UNIQUE (pad_cedula)
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_id IS 'ID único del padrón'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_cedula IS 'Cédula de identidad'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_nombre IS 'Nombre'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_apellido1 IS 'Primer apellido
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_apellido2 IS 'Segundo apellido'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_codigo_elec IS 'Codigo electoral'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_fecha_cadu IS 'Fecha de caducidad o sea cuando se vence la cedula'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_junta_recep IS 'Junta receptora de la persona'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_provincia IS 'Provincia de la persona'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_canton IS 'Cantón de la persona'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_padron_nacional.pad_distrito IS 'Distrito de la persona'
;

-- Table VITALIS_SCHEMA.vitalis_puestos_turnos

CREATE TABLE VITALIS_SCHEMA.vitalis_puestos_turnos(
  put_id Number NOT NULL,
  put_dia_semana Number NOT NULL,
  put_monto_cobrar Number NOT NULL,
  put_monto_pagar Number NOT NULL,
  put_tipo_pago Varchar2(10 ) NOT NULL,
  put_fecha_inicio Date NOT NULL,
  put_fecha_fin Date NOT NULL,
  put_max_personas Number NOT NULL,
  put_min_persona Number NOT NULL,
  put_version Varchar2(30 ),
  put_nombre Varchar2(15 ) NOT NULL,
  put_hora_inicio Timestamp(4) NOT NULL,
  put_hora_fin Timestamp(4) NOT NULL,
  put_especialidad Varchar2(30 ) NOT NULL,
  put_salario Number NOT NULL,
  put_csa_id Number NOT NULL,
  put_per_id Number NOT NULL,
  CONSTRAINT vitalis_puestos_turnos_ck01 CHECK ( put_dia_semana in ('1', '2', '3', '4', '5', '6', '7'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_puestos_turnos

CREATE INDEX vitalis_puestosturnoscentrossalud_fk01 ON VITALIS_SCHEMA.vitalis_puestos_turnos (put_csa_id)
TABLESPACE VITALIS_IDX
;

CREATE INDEX vitalis_personaspuestosturnos_fk01 ON VITALIS_SCHEMA.vitalis_puestos_turnos (put_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_puestos_turnos

ALTER TABLE VITALIS_SCHEMA.vitalis_puestos_turnos ADD CONSTRAINT vitalis_puestos_turnos_pk PRIMARY KEY (put_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_id IS ' ID único de la relación puesto-turno'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_dia_semana IS 'Día de la semana (1=Lunes, 7=Domingo)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_monto_cobrar IS 'Monto a cobrar al centro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_monto_pagar IS 'Monto a pagar al médico'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_tipo_pago IS 'HORAS, TURNO_COMPLETO'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_fecha_inicio IS 'Fecha de inicio de vigencia'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_fecha_fin IS 'Fecha de fin de vigencia'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_max_personas IS 'Maximo de personas por turno'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_min_persona IS 'Minimo de persona por turno'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_nombre IS 'Nombre de ese puesto y turnos en el centro de salud'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_hora_inicio IS 'Hora en la que inicia el turno de ese empleado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_hora_fin IS 'Hora en la que finaliza el turno de ese empleado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_especialidad IS 'Especialidad de ese puesto'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_puestos_turnos.put_salario IS 'Salario de ese puesto'
;

-- Table VITALIS_SCHEMA.vitalis_perfiles_pantallas

CREATE TABLE VITALIS_SCHEMA.vitalis_perfiles_pantallas(
  prp_id Number NOT NULL,
  prp_lectura Char(1 ) NOT NULL,
  prp_escritura Char(1 ) NOT NULL,
  prp_eliminacion Char(1 ) NOT NULL,
  prp_estado Char(1 ) NOT NULL,
  prp_version Number DEFAULT 1,
  prp_pan_id Number NOT NULL,
  prp_prf_id Number NOT NULL,
  CONSTRAINT vitalis_perfiles_pantallas_ck01 CHECK (prp_lectura in ('S','N')),
  CONSTRAINT vitalis_perfiles_pantallas_ck02 CHECK (prp_escritura in ('S','N')),
  CONSTRAINT vitalis_perfiles_pantallas_ck03 CHECK (prp_eliminacion in ('S','N')),
  CONSTRAINT vitalis_perfiles_pantallas_ck04 CHECK (prp_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_perfiles_pantallas

ALTER TABLE VITALIS_SCHEMA.vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_perfiles_pantallas_pk PRIMARY KEY (prp_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_id IS 'ID único de la relación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_lectura IS 'Permiso de lectura (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_escritura IS 'Permiso de escritura (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_eliminacion IS 'Permiso de eliminación (S=Sí, N=No)
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_pan_id IS 'Referencia a vitalis_pantallas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_perfiles_pantallas.prp_prf_id IS 'Referencia a vitalis_perfiles'
;

-- Table VITALIS_SCHEMA.vitalis_personal_tipos_planillas

CREATE TABLE VITALIS_SCHEMA.vitalis_personal_tipos_planillas(
  ptp_id Number NOT NULL,
  ptp_salario_base Number NOT NULL,
  ptp_fecha_asignacion Varchar2(30 ) NOT NULL,
  ptp_estado Char(1 ) NOT NULL,
  ptp_version Number DEFAULT 1,
  ptp_per_id Number NOT NULL,
  ptp_tpl_id Number NOT NULL,
  CONSTRAINT vitalis_personal_tipos_planillas_ck01 CHECK (ptp_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_personal_tipos_planillas

ALTER TABLE VITALIS_SCHEMA.vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_personal_tipos_plantillas_pk PRIMARY KEY (ptp_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_id IS 'ID único de la relación
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_salario_base IS 'Salario base (para administrativos)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_fecha_asignacion IS 'Fecha de asignación'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_version IS 'Version del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_personal_tipos_planillas.ptp_tpl_id IS 'Referencia a vitalis_tipos_planillas'
;

-- Table VITALIS_SCHEMA.vitalis_identificacion

CREATE TABLE VITALIS_SCHEMA.vitalis_identificacion(
  ide_id Number NOT NULL,
  ide_numero Varchar2(30 ) NOT NULL,
  ide_tipo Varchar2(30 ) NOT NULL,
  ide_version Number DEFAULT 1 NOT NULL,
  ide_per_id Number
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_identificacion

CREATE INDEX vitalis_identificacion_ind01 ON VITALIS_SCHEMA.vitalis_identificacion (ide_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_identificacion

ALTER TABLE VITALIS_SCHEMA.vitalis_identificacion ADD CONSTRAINT vitalis_identificacion_pk PRIMARY KEY (ide_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_identificacion.ide_id IS 'Identificador de identificaccion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_identificacion.ide_numero IS 'Numero de la identificacion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_identificacion.ide_tipo IS 'Dimex, cedula de identidad, pasaporte, etc
'
;

-- Table VITALIS_SCHEMA.vitalis_notificaciones

CREATE TABLE VITALIS_SCHEMA.vitalis_notificaciones(
  not_id Number NOT NULL,
  not_tipo Varchar2(30 ) NOT NULL,
  not_destinatario Varchar2(30 ) NOT NULL,
  not_asunto Varchar2(30 ) NOT NULL,
  not_mensaje Varchar2(500 ) NOT NULL,
  not_fecha_envio Date NOT NULL,
  not_estado Char(1 ) NOT NULL,
  not_intentos Number NOT NULL,
  not_version Number DEFAULT 1,
  not_pln_id Number NOT NULL,
  CONSTRAINT vitalis_notificaciones_ck01 CHECK (not_estado in ('E','P','F'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_notificaciones

CREATE INDEX vitalis_notificaciones_ind01 ON VITALIS_SCHEMA.vitalis_notificaciones (not_pln_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_notificaciones

ALTER TABLE VITALIS_SCHEMA.vitalis_notificaciones ADD CONSTRAINT vitalis_notificaciones_pk PRIMARY KEY (not_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_tipo IS 'Tipo de notificación
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_destinatario IS 'Email destinatario
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_asunto IS 'Ansunto de la notificacion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_mensaje IS 'Mensaje de la notificacion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_fecha_envio IS 'Fecha de envio'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_estado IS 'E=Enviado, P=Pendiente, F=Fallido'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_intentos IS 'Intentos de envio'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_notificaciones.not_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_contratos

CREATE TABLE VITALIS_SCHEMA.vitalis_contratos(
  ctr_id Number NOT NULL,
  ctr_tipo Varchar2(500 ) NOT NULL,
  ctr_fecha_inicio Date NOT NULL,
  ctr_fecha_fin Date NOT NULL,
  ctr_monto_base Number NOT NULL,
  ctr_estado Char(1 ) NOT NULL,
  ctr_version Number,
  ctr_per_id Number NOT NULL,
  CONSTRAINT vitalis_contratos_ck01 CHECK (ctr_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_contratos

CREATE INDEX vitalis_contratos_ind01 ON VITALIS_SCHEMA.vitalis_contratos (ctr_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_contratos

ALTER TABLE VITALIS_SCHEMA.vitalis_contratos ADD CONSTRAINT vitalis_contratos_pk PRIMARY KEY (ctr_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_tipo IS 'Tipo del contrato que se va a realizar'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_fecha_inicio IS 'fecha de inicio del contrato'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_fecha_fin IS 'fecha final del contrato'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_monto_base IS 'El monto que estipula la legislación según el puesto'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_estado IS 'Estado A=activo I=Inactivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_contratos.ctr_version IS 'Version en la que se encuentra el contrato'
;

-- Table VITALIS_SCHEMA.vitalis_incapacidades

CREATE TABLE VITALIS_SCHEMA.vitalis_incapacidades(
  inc_id Number NOT NULL,
  inc_fecha_inicio Date NOT NULL,
  inc_fecha_fin Date NOT NULL,
  inc_tipo Varchar2(30 ) NOT NULL,
  inc_certificado Blob NOT NULL,
  inc_version Number DEFAULT 1,
  inc_per_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_incapacidades

CREATE INDEX vitalis_incapacidades_ind01 ON VITALIS_SCHEMA.vitalis_incapacidades (inc_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_incapacidades

ALTER TABLE VITALIS_SCHEMA.vitalis_incapacidades ADD CONSTRAINT vitalis_incapacidades_pk PRIMARY KEY (inc_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_incapacidades.inc_fecha_inicio IS 'Fecha de inicio de la incapacidad'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_incapacidades.inc_fecha_fin IS 'Fecha final de incapacidad'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_incapacidades.inc_tipo IS 'Concepto de la incapacidad'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_incapacidades.inc_certificado IS 'Constancia o comprobante de la incapacidad
'
;

-- Table VITALIS_SCHEMA.vitalis_vacaciones

CREATE TABLE VITALIS_SCHEMA.vitalis_vacaciones(
  vac_id Number NOT NULL,
  vac_fecha_inicio Date NOT NULL,
  vac_fecha_fin Date NOT NULL,
  vac_dias Number NOT NULL,
  vac_estado Char(1 ) NOT NULL,
  vac_version Number DEFAULT 1 NOT NULL,
  vac_per_id Number,
  CONSTRAINT vitalis_vacaciones_ck01 CHECK (vac_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_vacaciones

CREATE INDEX vitalis_vacaciones_ind01 ON VITALIS_SCHEMA.vitalis_vacaciones (vac_per_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_vacaciones

ALTER TABLE VITALIS_SCHEMA.vitalis_vacaciones ADD CONSTRAINT vitalis_vacaciones_pk PRIMARY KEY (vac_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_vacaciones.vac_fecha_inicio IS 'Fecha de inicio de vaciones
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_vacaciones.vac_fecha_fin IS 'Fecha final de vaciones'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_vacaciones.vac_dias IS 'Numero de dias de vaciones'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_vacaciones.vac_estado IS 'A=activo I=Inactivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_vacaciones.vac_version IS 'Version en la que se encuentra las vacaciones'
;

-- Table VITALIS_SCHEMA.vitalis_feriados

CREATE TABLE VITALIS_SCHEMA.vitalis_feriados(
  fer_id Number NOT NULL,
  fer_fecha Date NOT NULL,
  fer_nombre Varchar2(30 ) NOT NULL,
  fer_tipo Varchar2(30 ) NOT NULL,
  fer_estado Char(1 ) NOT NULL,
  fer_version Number DEFAULT 1,
  fer_csa_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_feriados

CREATE INDEX vitalis_feriados_ind01 ON VITALIS_SCHEMA.vitalis_feriados (fer_csa_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_feriados

ALTER TABLE VITALIS_SCHEMA.vitalis_feriados ADD CONSTRAINT vitalis_feriados_pk PRIMARY KEY (fer_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_feriados.fer_fecha IS 'Fecha de feriado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_feriados.fer_nombre IS 'Nombre del feriado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_feriados.fer_tipo IS 'Tipo del feriado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_feriados.fer_estado IS 'A=activo I=inactivo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_feriados.fer_version IS 'Version de cuando del feriado'
;

-- Table VITALIS_SCHEMA.vitalis_consultorios

CREATE TABLE VITALIS_SCHEMA.vitalis_consultorios(
  con_id Number NOT NULL,
  con_codigo Number NOT NULL,
  con_nombre Varchar2(20 ) NOT NULL,
  con_capacidad Number NOT NULL,
  con_estado Char(1 ) NOT NULL,
  con_version Number DEFAULT 1 NOT NULL,
  csa_id Number,
  CONSTRAINT vitalis_consultorios_ck01 CHECK (con_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_consultorios

CREATE INDEX vitalis_consultorios_ind01 ON VITALIS_SCHEMA.vitalis_consultorios (csa_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_consultorios

ALTER TABLE VITALIS_SCHEMA.vitalis_consultorios ADD CONSTRAINT vitalis_consultorios_pk PRIMARY KEY (con_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_consultorios.con_codigo IS 'Codigo de consultorio'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_consultorios.con_nombre IS 'Nombre del consultorio
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_consultorios.con_capacidad IS 'Capacidad de personas que puede atender'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_consultorios.con_estado IS 'A=activo I=Inactivo'
;

-- Table VITALIS_SCHEMA.vitalis_facturas_detalle

CREATE TABLE VITALIS_SCHEMA.vitalis_facturas_detalle(
  fad_id Number NOT NULL,
  fad_descripcion Varchar2(200 ),
  fad_cantidad Number NOT NULL,
  fad_precio_unit Number NOT NULL,
  fad_monto Number NOT NULL,
  fad_version Number DEFAULT 1 NOT NULL,
  fac_id Number
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_facturas_detalle

CREATE INDEX vitalis_facturas_detalle_ind01 ON VITALIS_SCHEMA.vitalis_facturas_detalle (fac_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_facturas_detalle

ALTER TABLE VITALIS_SCHEMA.vitalis_facturas_detalle ADD CONSTRAINT vitalis_facturas_detalle_pk PRIMARY KEY (fad_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_detalle.fad_descripcion IS 'Descripcion de la factura sus detalles agregados'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_detalle.fad_cantidad IS 'Cantidad de suministros en la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_detalle.fad_precio_unit IS 'Precio de unitario del coste de lo que se realizo
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_detalle.fad_monto IS 'Precio total 
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_detalle.fad_version IS 'Version de la factura'
;

-- Table VITALIS_SCHEMA.vitalis_facturas_centros

CREATE TABLE VITALIS_SCHEMA.vitalis_facturas_centros(
  fac_id Number NOT NULL,
  fac_mes Number NOT NULL,
  fac_anio Number NOT NULL,
  fac_numero Number NOT NULL,
  fac_fecha Date NOT NULL,
  fac_subtotal Number NOT NULL,
  fac_impuestos Number NOT NULL,
  fac_total Number NOT NULL,
  fac_estado Char(20 ) NOT NULL,
  fac_version Number,
  fac_csa_id Number NOT NULL
)
TABLESPACE VITALIS_DATA
;

-- Create indexes for table VITALIS_SCHEMA.vitalis_facturas_centros

CREATE INDEX vitalis_facturas_centros_ind01 ON VITALIS_SCHEMA.vitalis_facturas_centros (fac_csa_id)
TABLESPACE VITALIS_IDX
;

-- Add keys for table VITALIS_SCHEMA.vitalis_facturas_centros

ALTER TABLE VITALIS_SCHEMA.vitalis_facturas_centros ADD CONSTRAINT vitalis_facturas_centros_pk PRIMARY KEY (fac_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_mes IS 'mes de la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_anio IS 'año de la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_numero IS 'numero de la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_fecha IS 'Fecha de la factura dada'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_subtotal IS 'subtotal de la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_impuestos IS 'Impuestos de la factura que fueron colocados
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_total IS 'Total de la factura'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_estado IS ' (EMITIDA/PAGADA/ANULADA)'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_facturas_centros.fac_version IS 'Version del registro'
;

-- Table VITALIS_SCHEMA.vitalis_autoregistros

CREATE TABLE VITALIS_SCHEMA.vitalis_autoregistros(
  aur_id Number NOT NULL,
  aur_cedula Varchar2(12 ) NOT NULL,
  aur_nombre Varchar2(30 ) NOT NULL,
  aur_apellido1 Varchar2(10 ) NOT NULL,
  aur_apellido2 Varchar2(10 ) NOT NULL,
  aur_email Varchar2(20 ) NOT NULL,
  aur_telefono Varchar2(10 ) NOT NULL,
  aur_tipo_personal Char(1 ) NOT NULL,
  aur_fecha_nacimiento Date NOT NULL,
  aur_estado Char(1 ) NOT NULL,
  aur_fecha_registro Date NOT NULL,
  aur_fecha_revision Date NOT NULL,
  aur_usu_revisor Varchar2(20 ) NOT NULL,
  aur_version Number DEFAULT 1 NOT NULL,
  CONSTRAINT vitalis_autoregistros_ck01 CHECK (aur_tipo_personal in ('M','A')),
  CONSTRAINT vitalis_autoregistros_ck02 CHECK (aur_estado in ('P','A','R'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_autoregistros

ALTER TABLE VITALIS_SCHEMA.vitalis_autoregistros ADD CONSTRAINT vitalis_autoregistros_pk PRIMARY KEY (aur_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_id IS 'ID único del autoregistro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_cedula IS 'Cédula de identidad'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_nombre IS 'Primer nombre'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_apellido1 IS 'Apellidos de la persona que se autoregistra'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_apellido2 IS 'Apellido numero 2 del autoregistro
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_email IS 'Email del autoregistro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_telefono IS 'Telefeno del que realizo el autoregistro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_tipo_personal IS 'M=medico, A=Administrativo'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_fecha_nacimiento IS 'Fecha de nacimiento'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_estado IS 'P=Pendiente, A=Aprobado, R=Rechazado'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_fecha_registro IS 'Fecha del registro'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_fecha_revision IS 'Fecha en que se realizo la revisión'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_autoregistros.aur_usu_revisor IS 'Usuario que reviso el autoregistro para aprobarlo'
;

-- Table VITALIS_SCHEMA.vitalis_plantillas_notificacion

CREATE TABLE VITALIS_SCHEMA.vitalis_plantillas_notificacion(
  pln_id Number NOT NULL,
  pln_codigo Number NOT NULL,
  pln_nombre Varchar2(30 ) NOT NULL,
  pln_asunto Varchar2(500 ) NOT NULL,
  pln_cuerpo Varchar2(2000 ) NOT NULL,
  pln_tipo Varchar2(30 ) NOT NULL,
  pln_estado Char(1 ) NOT NULL,
  pln_fecha_creacion Date NOT NULL,
  pln_version Number DEFAULT 1,
  CONSTRAINT vitalis_plantillas_notificacion_ck01 CHECK (pln_estado in ('A','I'))
)
TABLESPACE VITALIS_DATA
;

-- Add keys for table VITALIS_SCHEMA.vitalis_plantillas_notificacion

ALTER TABLE VITALIS_SCHEMA.vitalis_plantillas_notificacion ADD CONSTRAINT vitalis_plantillas_notificacion_pk PRIMARY KEY (pln_id)
   USING INDEX TABLESPACE VITALIS_IDX
;

-- Table and Columns comments section

COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_codigo IS 'Codigo de la notificacion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_nombre IS 'Nombre de la notificacion'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_asunto IS 'Descripcion o asunto de la notificacion dada
'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_cuerpo IS 'El HTML de las notificaciones'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_tipo IS 'Tipo de la notificacion si es general o etc'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_estado IS 'A=activa I=Inactiva'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_fecha_creacion IS 'Fecha de creacion de la plantilla'
;
COMMENT ON COLUMN VITALIS_SCHEMA.vitalis_plantillas_notificacion.pln_version IS 'Version de la plantilla'
;
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


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE VITALIS_SCHEMA.vitalis_provincia ADD CONSTRAINT vitalis_pasisesprovincia_fk01 FOREIGN KEY (pai_id) REFERENCES VITALIS_SCHEMA.vitalis_paises (pai_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_cantones ADD CONSTRAINT vitalis_provinciacantones_fk01 FOREIGN KEY (can_pro_id) REFERENCES VITALIS_SCHEMA.vitalis_provincia (pro_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_distritos ADD CONSTRAINT vitalis_cantonesdistritos_fk01 FOREIGN KEY (dis_can_id) REFERENCES VITALIS_SCHEMA.vitalis_cantones (can_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_direcciones_personas ADD CONSTRAINT vitalis_personasdireccionesper_fk01 FOREIGN KEY (dpe_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_telefonos_personas ADD CONSTRAINT vitalis_personastelefonos_fk01 FOREIGN KEY (tpe_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_personascuentabancaria_fk01 FOREIGN KEY (cba_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_documentos_personas ADD CONSTRAINT vitalis_personasdocumentospersona_fk01 FOREIGN KEY (dop_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_usuarios ADD CONSTRAINT vitalis_personasusuario_fk01 FOREIGN KEY (usu_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_escalasmensualesescalasmensualesdetalle_fk01 FOREIGN KEY (esm_id) REFERENCES VITALIS_SCHEMA.vitalis_escalas_mensuales (esm_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_planillas ADD CONSTRAINT vitalis_tiposplanillasplanillas_fk01 FOREIGN KEY (pla_tpl_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_detalle ADD CONSTRAINT vitalis_planillasplanillasdetalle_fk01 FOREIGN KEY (pld_pla_id) REFERENCES VITALIS_SCHEMA.vitalis_planillas (pla_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_pantallasperfilespantallas_fk01 FOREIGN KEY (prp_pan_id) REFERENCES VITALIS_SCHEMA.vitalis_pantallas (pan_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_perfilesperfilespantalla_fk01 FOREIGN KEY (prp_prf_id) REFERENCES VITALIS_SCHEMA.vitalis_perfiles (prf_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_personaspersonaltiposplanilla_fk01 FOREIGN KEY (ptp_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_tiposplanillaspersonaltiposplanillas_fk01 FOREIGN KEY (ptp_tpl_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_centros_salud ADD CONSTRAINT vitalis_distritoscentrossalud_fk01 FOREIGN KEY (csa_dis_id) REFERENCES VITALIS_SCHEMA.vitalis_distritos (dis_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_direcciones_personas ADD CONSTRAINT vitalis_distritosdireccionesper_fk01 FOREIGN KEY (dpe_dis_id) REFERENCES VITALIS_SCHEMA.vitalis_distritos (dis_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_bancoscuentasbancarias_fk01 FOREIGN KEY (cba_ban_id) REFERENCES VITALIS_SCHEMA.vitalis_bancos (ban_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_tiposcuentacuentasbancarias_fk01 FOREIGN KEY (cba_tcu_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_cuenta (tcu_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_documentos_personas ADD CONSTRAINT vitalis_tiposdocumentosdocumentospersonas_fk01 FOREIGN KEY (dop_tdo_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_documentos (tdo_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_usuarios ADD CONSTRAINT vitalis_perfilesusuarios_fk01 FOREIGN KEY (usu_prf_id) REFERENCES VITALIS_SCHEMA.vitalis_perfiles (prf_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_base ADD CONSTRAINT vitalis_personasescalasbasedetalle_fk01 FOREIGN KEY (esd_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_personasescalasmensualesdetalle_fk01 FOREIGN KEY (per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_personasprocedimientosmedicos_fk01 FOREIGN KEY (prm_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_tiposprocedimientosprocedimientosmedicos_fk01 FOREIGN KEY (prm_tpr_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_procedimientos (tpr_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_movimientos ADD CONSTRAINT vitalis_tiposmovimientosplanillasmovimientos_fk01 FOREIGN KEY (plm_tmo_id) REFERENCES VITALIS_SCHEMA.vitalis_tipos_movimientos (tmo_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_centrossaludprocedimientosmedicos_fk01 FOREIGN KEY (prm_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_base ADD CONSTRAINT vitalis_puestosturnosescalasbasedetalle_fk01 FOREIGN KEY (esd_put_id) REFERENCES VITALIS_SCHEMA.vitalis_puestos_turnos (put_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales ADD CONSTRAINT vitalis_centrossaludescalasmensuales_fk01 FOREIGN KEY (esm_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_puestosturnosescalasmensualesdetalle_fk01 FOREIGN KEY (put_id) REFERENCES VITALIS_SCHEMA.vitalis_puestos_turnos (put_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_detalle ADD CONSTRAINT vitalis_personasplanillasdetalle_fk01 FOREIGN KEY (pld_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_planillas_movimientos ADD CONSTRAINT vitalis_planillasdetalleplanillasmovimientos_fk01 FOREIGN KEY (plm_pld_id) REFERENCES VITALIS_SCHEMA.vitalis_planillas_detalle (pld_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_resumen_financiero ADD CONSTRAINT vitalis_centrossaludresumenfinanciero_fk01 FOREIGN KEY (ref_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_identificacion ADD CONSTRAINT vitalis_personasidentificacion_fk01 FOREIGN KEY (ide_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_contratos ADD CONSTRAINT vitalis_personascontratos_fk01 FOREIGN KEY (ctr_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_incapacidades ADD CONSTRAINT vitalis_personasincapacidades_fk01 FOREIGN KEY (inc_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_consultorios ADD CONSTRAINT vitalis_centrossaludconsultorios_fk01 FOREIGN KEY (csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_facturas_centros ADD CONSTRAINT vitalis_centrossaludfacturascentros_fk01 FOREIGN KEY (fac_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_facturas_detalle ADD CONSTRAINT vitalis_facturasdetallefacturascentro_fk01 FOREIGN KEY (fac_id) REFERENCES VITALIS_SCHEMA.vitalis_facturas_centros (fac_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_vacaciones ADD CONSTRAINT vitalis_personasvaciones_fk01 FOREIGN KEY (vac_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_feriados ADD CONSTRAINT vitalis_centrossaludferiados_fk01 FOREIGN KEY (fer_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_notificaciones ADD CONSTRAINT vitalis_planillasnotificacionnotificaciones_fk01 FOREIGN KEY (not_pln_id) REFERENCES VITALIS_SCHEMA.vitalis_plantillas_notificacion (pln_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_bitacoras ADD CONSTRAINT vitalis_usuariosbitacoras_fk01 FOREIGN KEY (bit_usu_id) REFERENCES VITALIS_SCHEMA.vitalis_usuarios (usu_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_puestos_turnos ADD CONSTRAINT vitalis_puestosturnoscentrossalud_fk01 FOREIGN KEY (put_csa_id) REFERENCES VITALIS_SCHEMA.vitalis_centros_salud (csa_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_puestos_turnos ADD CONSTRAINT vitalis_personaspuestosturnos_fk01 FOREIGN KEY (put_per_id) REFERENCES VITALIS_SCHEMA.vitalis_personas (per_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_escalas_mensuales ADD CONSTRAINT vitalis_escalasbasesescalasmensuales_fk01 FOREIGN KEY (esm_esd_id) REFERENCES VITALIS_SCHEMA.vitalis_escalas_base (esd_id)
;



ALTER TABLE VITALIS_SCHEMA.vitalis_pantallas ADD CONSTRAINT vitales_pantallas_fk01 FOREIGN KEY (pan_fk_id) REFERENCES VITALIS_SCHEMA.vitalis_pantallas (pan_id)
;




-- Grant permissions section -------------------------------------------------


