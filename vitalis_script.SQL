/*
Created: 16/8/2025
Modified: 30/8/2025
Model: Vitalis
Database: Oracle 19c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE vitalis_paises_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_provincias_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_cantones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_distritos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_direcciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_facturas_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_facturas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_consultorios_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_feriados_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_resumen_financiero_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_centros_salud_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_procedimientos_medicos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_escalas_mensuales_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_puestos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tipos_procedimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_turnos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_escalas_mensuales_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_puestos_turno_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_escalas_base_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_escalas_base_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_telefonos_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_bancos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tipos_cuenta_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_cuentas_bancarias_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_usuarios_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_vacaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_contratos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_incapacidades_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_identificacion_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_personal_tipos_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tipos_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_planillas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tipos_movimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_planillas_movimientos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_planillas_detalle_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_documentos_personas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_autoregistros_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_autoregistros_documentos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tipos_documentos_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_estados_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_perfiles_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_pantallas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_perfiles_pantallas_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_bitacoras_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_parametros_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_tarifas_historial_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_padron_nacional_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_notificaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

CREATE SEQUENCE vitalis_planillas_notificaciones_seq01
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 MINVALUE 0
 NOCACHE
;

-- Create tables section -------------------------------------------------

-- Table vitalis_paises

CREATE TABLE vitalis_paises(
  pai_id Number NOT NULL,
  pai_codigo Varchar2(4 ) NOT NULL,
  pai_nombre Varchar2(100 ),
  pai_estado Char(1 )
        CONSTRAINT chk_pai_estado CHECK (activo IN ('A','I')),
  pai_version Number DEFAULT 1 NOT NULL,
  CONSTRAINT vitalis_paises_ck01 CHECK (pai_estado in ('A','I'))
)
;

-- Add keys for table vitalis_paises

ALTER TABLE vitalis_paises ADD CONSTRAINT vitalis_paises_pk PRIMARY KEY (pai_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_paises.pai_id IS 'ID único del país'
;
COMMENT ON COLUMN vitalis_paises.pai_codigo IS 'Código ISO del país
'
;
COMMENT ON COLUMN vitalis_paises.pai_nombre IS 'Nombre del país'
;
COMMENT ON COLUMN vitalis_paises.pai_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_paises.pai_version IS 'Version del registro'
;

-- Table vitalis_provincia

CREATE TABLE vitalis_provincia(
  pro_id Number NOT NULL,
  pai_id Number,
  pro_codigo Varchar2(10 ),
  pro_nombre Varchar2(100 ),
  pro_estado Varchar2(1 ),
  pro_version Number NOT NULL,
  CONSTRAINT vitalis_provincia_ck01 CHECK (pro_estado in ('A','I'))
)
;

-- Create indexes for table vitalis_provincia

CREATE INDEX vitalis_provincia_ind01 ON vitalis_provincia (pai_id)
;

-- Add keys for table vitalis_provincia

ALTER TABLE vitalis_provincia ADD CONSTRAINT vitalis_provincia_pk PRIMARY KEY (pro_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_provincia.pro_id IS 'ID único de la provincia'
;
COMMENT ON COLUMN vitalis_provincia.pai_id IS 'Referencia a vitalis_paises
'
;
COMMENT ON COLUMN vitalis_provincia.pro_codigo IS 'Código de la provincia'
;
COMMENT ON COLUMN vitalis_provincia.pro_nombre IS 'Nombre de la provincia
'
;
COMMENT ON COLUMN vitalis_provincia.pro_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_provincia.pro_version IS 'Version del registro'
;

-- Table vitalis_cantones

CREATE TABLE vitalis_cantones(
  can_id Number NOT NULL,
  pro_id Number,
  can_codigo Number NOT NULL,
  can_nombre Varchar2(100 ) NOT NULL,
  can_estado Varchar2(1 ) NOT NULL
        CONSTRAINT chk_can_estado CHECK (activo IN ('A','I')),
  can_version Number DEFAULT 1 NOT NULL,
  CONSTRAINT vitalis_cantones_ck01 CHECK (can_estado in ('A','I'))
)
;

-- Create indexes for table vitalis_cantones

CREATE INDEX vitalis_cantones_ind01 ON vitalis_cantones (pro_id)
;

-- Add keys for table vitalis_cantones

ALTER TABLE vitalis_cantones ADD CONSTRAINT vitalis_cantones_pk PRIMARY KEY (can_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_cantones.can_codigo IS 'Codigo del canton'
;
COMMENT ON COLUMN vitalis_cantones.can_nombre IS 'Nombre del cantón'
;
COMMENT ON COLUMN vitalis_cantones.can_estado IS 'A=Activo o I=inactivo'
;
COMMENT ON COLUMN vitalis_cantones.can_version IS 'version del cantón'
;

-- Table vitalis_distritos

CREATE TABLE vitalis_distritos(
  dis_id Number NOT NULL,
  can_id Number,
  dis_codigo Number NOT NULL,
  dis_nombre Varchar2(100 ) NOT NULL,
  dis_estado Varchar2(1 ) NOT NULL
        CONSTRAINT chk_dis_estado CHECK (activo IN ('A','I')),
  dis_version Number NOT NULL,
  CONSTRAINT vitalis_distritos_ck01 CHECK (dis_estado in ('A','I'))
)
;

-- Create indexes for table vitalis_distritos

CREATE INDEX viatalis_distritos_ind01 ON vitalis_distritos (can_id)
;

-- Add keys for table vitalis_distritos

ALTER TABLE vitalis_distritos ADD CONSTRAINT vitalis_distritos_pk PRIMARY KEY (dis_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_distritos.dis_id IS ' ID único del distrito'
;
COMMENT ON COLUMN vitalis_distritos.can_id IS 'Referencia a vitalis_cantones
'
;
COMMENT ON COLUMN vitalis_distritos.dis_codigo IS 'Código del distrito
'
;
COMMENT ON COLUMN vitalis_distritos.dis_nombre IS 'Nombre del distrito
'
;
COMMENT ON COLUMN vitalis_distritos.dis_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_distritos.dis_version IS 'Version del registro'
;

-- Table vitalis_tipos_documentos

CREATE TABLE vitalis_tipos_documentos(
  tdo_id Number NOT NULL,
  tdo_nombre Varchar2(30 ),
  tdo_descripcion Varchar2(500 ),
  tdo_tipo_personal Varchar2(20 ),
  tdo_url_recurso Varchar2(200 ) NOT NULL,
  tdo_estado Char(1 )
        CONSTRAINT chk_tdo_estado CHECK (activo IN ('A','I')),
  tdo_version Number,
  est_id Number
)
;

-- Create indexes for table vitalis_tipos_documentos

CREATE INDEX vitalis_tipos_documentos_ind01 ON vitalis_tipos_documentos (est_id)
;

-- Add keys for table vitalis_tipos_documentos

ALTER TABLE vitalis_tipos_documentos ADD CONSTRAINT vitalis_tipos_documentos_pk PRIMARY KEY (tdo_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tipos_documentos.tdo_id IS 'ID único del tipo de documento'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_nombre IS 'Nombre del tipo de documento'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_descripcion IS 'Descripción del tipo de documento'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_tipo_personal IS 'Tipo de personal (MEDICO, ADMINISTRATIVO, AMBOS)'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_url_recurso IS 'URL del recurso o documento'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_version IS 'Version del registro'
;

-- Table vitalis_bancos

CREATE TABLE vitalis_bancos(
  ban_id Number NOT NULL,
  ban_ced_juridica Varchar2(10 ),
  ban_nombre Varchar2(70 ),
  ban_estado Char(1 )
        CONSTRAINT chk_ban_estado CHECK (activo IN ('A','I')),
  ban_version Number
)
;

-- Add keys for table vitalis_bancos

ALTER TABLE vitalis_bancos ADD CONSTRAINT vitalis_bancos_pk PRIMARY KEY (ban_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_bancos.ban_ced_juridica IS 'Cedula juridica del banco'
;
COMMENT ON COLUMN vitalis_bancos.ban_nombre IS 'Nombre del banco'
;
COMMENT ON COLUMN vitalis_bancos.ban_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_bancos.ban_version IS 'Version del registro'
;

-- Table vitalis_tipos_cuenta

CREATE TABLE vitalis_tipos_cuenta(
  tcu_id Number NOT NULL,
  tcu_nombre Varchar2(50 ),
  tcu_estado Char(1 )
        CONSTRAINT chk_tcu_estado CHECK (activo IN ('A','I')),
  tcu_moneda Varchar2(10 ),
  tcu_version Number,
  CONSTRAINT vitalis_tipos_cuenta_ck01 CHECK (tcu_estado in ('A', 'I'))
)
;

-- Add keys for table vitalis_tipos_cuenta

ALTER TABLE vitalis_tipos_cuenta ADD CONSTRAINT vitalis_tipos_cuenta_pk PRIMARY KEY (tcu_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tipos_cuenta.tcu_nombre IS 'Nombre del tipo de cuenta (Corriente, Ahorros, etc.)
'
;
COMMENT ON COLUMN vitalis_tipos_cuenta.tcu_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_tipos_cuenta.tcu_moneda IS 'Tipo de moneda en la que esta la cuenta'
;
COMMENT ON COLUMN vitalis_tipos_cuenta.tcu_version IS 'Version del registro'
;

-- Table vitalis_personas

CREATE TABLE vitalis_personas(
  per_id Number NOT NULL,
  per_nombre Varchar2(20 ) NOT NULL,
  per_apellido1 Varchar2(15 ) NOT NULL,
  per_apellido2 Varchar2(15 ) NOT NULL,
  per_estado_civil Varchar2(10 ) NOT NULL,
  per_fecha_nacimiento Date NOT NULL,
  per_sexo Char(1 ) NOT NULL
        CONSTRAINT chk_per_sexo CHECK (activo IN ('M','F')),
  per_email Varchar2(200 ) NOT NULL,
  per_estado Char(1 )
        CONSTRAINT chk_per_estado CHECK (activo IN ('A','I')),
  per_tipo_personal Char(20 ) NOT NULL,
  per_version Number DEFAULT 1 NOT NULL,
  CONSTRAINT vitalis_personas_ck01 CHECK (per_sexo in ('M', 'F')),
  CONSTRAINT vitalis_personas_ck02 CHECK (per_estado in ('A', 'I'))
)
;

-- Add keys for table vitalis_personas

ALTER TABLE vitalis_personas ADD CONSTRAINT vitalis_personas_pk PRIMARY KEY (per_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_personas.per_id IS 'ID único de la persona'
;
COMMENT ON COLUMN vitalis_personas.per_nombre IS 'Nombre de la person'
;
COMMENT ON COLUMN vitalis_personas.per_apellido1 IS 'Primer apellido
'
;
COMMENT ON COLUMN vitalis_personas.per_apellido2 IS 'Segundo apellido'
;
COMMENT ON COLUMN vitalis_personas.per_estado_civil IS 'Estado civil'
;
COMMENT ON COLUMN vitalis_personas.per_fecha_nacimiento IS 'Fecha de nacimiento'
;
COMMENT ON COLUMN vitalis_personas.per_sexo IS 'Sexo de la persona (M=masculino, F= femenino)'
;
COMMENT ON COLUMN vitalis_personas.per_email IS 'Correo electrónico'
;
COMMENT ON COLUMN vitalis_personas.per_estado IS 'Estado de la persona(A= activo, I= inactivo)'
;
COMMENT ON COLUMN vitalis_personas.per_tipo_personal IS 'Tipo personal(MÉDICO, ADMINISTRATIVO)'
;
COMMENT ON COLUMN vitalis_personas.per_version IS 'Version del registro'
;

-- Table vitalis_direcciones_personas

CREATE TABLE vitalis_direcciones_personas(
  dpe_id Number NOT NULL,
  per_id Number,
  dis_id Number,
  dpe_tipo_direccion Varchar2(10 ) NOT NULL,
  dpe_direccion_exacta Varchar2(250 ) NOT NULL,
  dpe_principal Char(1 ) NOT NULL
        CONSTRAINT chk_dpe_principal CHECK (activo IN ('S','N')),
  dpe_codigo_postal Varchar2(30 ),
  dpe_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_direcciones_personas

CREATE INDEX vitalis_direcciones_personas_ind01 ON vitalis_direcciones_personas (per_id)
;

CREATE INDEX vitalis_direcciones_personas_ind02 ON vitalis_direcciones_personas (dis_id)
;

-- Add keys for table vitalis_direcciones_personas

ALTER TABLE vitalis_direcciones_personas ADD CONSTRAINT vitalis_direcciones_personas_pk PRIMARY KEY (dpe_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_direcciones_personas.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dis_id IS 'Referencia a vitalis_distritos'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dpe_tipo_direccion IS 'Casa, trabajo, apartamento, otro'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dpe_direccion_exacta IS 'Direccion exacta'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dpe_principal IS 'Dirección principal (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dpe_codigo_postal IS 'Codigo postal'
;
COMMENT ON COLUMN vitalis_direcciones_personas.dpe_version IS 'Version del registro'
;

-- Table vitalis_telefonos_personas

CREATE TABLE vitalis_telefonos_personas(
  tpe_id Number NOT NULL,
  per_id Number,
  tpe_numero Varchar2(12 ),
  tpe_tipo Varchar2(10 ),
  tpe_principal Varchar2(1 ),
  tpe_estado Varchar2(1 ),
  tpe_version Number NOT NULL,
  CONSTRAINT vitalis_telefonos_personas_ck01 CHECK (tpe_estado in ('A', 'I')),
  CONSTRAINT vitalis_telefonos_personas_ck02 CHECK (tpe_principal in ('S', 'N'))
)
;

-- Create indexes for table vitalis_telefonos_personas

CREATE INDEX vitalis_telefonos_personas_ind01 ON vitalis_telefonos_personas (per_id)
;

-- Add keys for table vitalis_telefonos_personas

ALTER TABLE vitalis_telefonos_personas ADD CONSTRAINT vitalis_telefonos_personas_pk PRIMARY KEY (tpe_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_telefonos_personas.tpe_id IS 'ID único del teléfono'
;
COMMENT ON COLUMN vitalis_telefonos_personas.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_telefonos_personas.tpe_numero IS 'Número de teléfono'
;
COMMENT ON COLUMN vitalis_telefonos_personas.tpe_tipo IS 'CELULAR, CASA, TRABAJO, FAX, ETC'
;
COMMENT ON COLUMN vitalis_telefonos_personas.tpe_principal IS 'Teléfono principal (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_telefonos_personas.tpe_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_telefonos_personas.tpe_version IS 'Version del registro'
;

-- Table vitalis_cuentas_bancarias

CREATE TABLE vitalis_cuentas_bancarias(
  cba_id Number NOT NULL,
  per_id Number,
  ban_id Number,
  tcu_id Number,
  cba_numero_cuenta Varchar2(50 ) NOT NULL,
  cba_iban Varchar2(50 ) NOT NULL,
  cba_principal Char(1 ) NOT NULL
        CONSTRAINT chk_cba_principal CHECK (activo IN ('S','N')),
  cba_estado Char(1 ) NOT NULL
        CONSTRAINT cba_estado CHECK (activo IN ('A','I')),
  cba_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_cuentas_bancarias

CREATE INDEX vitalis_cuentas_bancarias_ind01 ON vitalis_cuentas_bancarias (per_id)
;

CREATE INDEX vitalis_cuentas_bancarias_ind02 ON vitalis_cuentas_bancarias (ban_id)
;

CREATE INDEX vitalis_cuentas_bancarias_ind03 ON vitalis_cuentas_bancarias (tcu_id)
;

-- Add keys for table vitalis_cuentas_bancarias

ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_cuentas_bancarias_pk PRIMARY KEY (cba_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_cuentas_bancarias.cba_id IS 'ID único de la cuenta bancaria'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.ban_id IS 'Referencia a vitalis_bancos'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.tcu_id IS 'Referencia a vitalis_tipos_cuenta'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.cba_numero_cuenta IS 'Número de cuenta'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.cba_iban IS 'Código IBAN'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.cba_principal IS 'Cuenta principal (S=Sí, N=No)'
;
COMMENT ON COLUMN vitalis_cuentas_bancarias.cba_estado IS 'Estado (A=Activo, I=Inactivo)'
;

-- Table vitalis_documentos_personas

CREATE TABLE vitalis_documentos_personas(
  dop_id Number NOT NULL,
  per_id Number,
  tdo_id Number,
  dop_nombre_archivo Varchar2(50 ),
  dop_ruta_archivo Varchar2(200 ),
  dop_fecha_carga Date,
  dop_descripcion Varchar2(500 ),
  dop_autoridad_emisora Varchar2(150 ),
  dop_fecha_vencimiento Date,
  dop_observaciones Varchar2(200 ),
  dop_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_documentos_personas

CREATE INDEX vitalis_documentos_personas_fk01 ON vitalis_documentos_personas (per_id)
;

CREATE INDEX vitalis_documentos_personas_fk02 ON vitalis_documentos_personas (tdo_id)
;

-- Add keys for table vitalis_documentos_personas

ALTER TABLE vitalis_documentos_personas ADD CONSTRAINT vitalis_documentos_personas_pk PRIMARY KEY (dop_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_documentos_personas.dop_id IS 'ID único del documento'
;
COMMENT ON COLUMN vitalis_documentos_personas.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_documentos_personas.tdo_id IS 'Referencia a vitalis_tipos_documentos'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_nombre_archivo IS 'Nombre del archivo'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_ruta_archivo IS 'Ruta del archivo'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_fecha_carga IS 'Fecha de carga'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_descripcion IS 'Descripcion del documento'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_autoridad_emisora IS 'Autoridad emisora'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_fecha_vencimiento IS 'Fecha de vencimiento'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_observaciones IS 'Observaciones del archivo'
;
COMMENT ON COLUMN vitalis_documentos_personas.dop_version IS 'Version del registro'
;

-- Table vitalis_perfiles

CREATE TABLE vitalis_perfiles(
  prf_id Number NOT NULL,
  est_id Number,
  prf_nombre Varchar2(20 ),
  prf_descripcion Varchar2(100 ),
  prf_estado Char(1 )
        CONSTRAINT chk_prf_estado CHECK (activo IN ('A','I')),
  prf_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_perfiles

CREATE INDEX vitalis_perfiles_ind01 ON vitalis_perfiles (est_id)
;

-- Add keys for table vitalis_perfiles

ALTER TABLE vitalis_perfiles ADD CONSTRAINT vitalis_perfiles_pk PRIMARY KEY (prf_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_perfiles.prf_id IS 'ID único del perfil'
;
COMMENT ON COLUMN vitalis_perfiles.prf_nombre IS 'Nombre del perfil'
;
COMMENT ON COLUMN vitalis_perfiles.prf_descripcion IS 'Descripción del perfil'
;
COMMENT ON COLUMN vitalis_perfiles.prf_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_perfiles.prf_version IS 'Version del registro'
;

-- Table vitalis_pantallas

CREATE TABLE vitalis_pantallas(
  pan_id Number NOT NULL,
  pan_codigo Number NOT NULL,
  pan_nombre Varchar2(30 ),
  pan_descripcion Varchar2(100 ),
  pan_modulo Number,
  pan_estado Char(1 )
        CONSTRAINT chk_pan_estado CHECK (activo IN ('A','I')),
  pan_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_pantallas

ALTER TABLE vitalis_pantallas ADD CONSTRAINT vitalis_pantallas_pk PRIMARY KEY (pan_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_pantallas.pan_codigo IS 'Código de la pantalla
'
;
COMMENT ON COLUMN vitalis_pantallas.pan_nombre IS 'Nombre de la pantalla
'
;
COMMENT ON COLUMN vitalis_pantallas.pan_descripcion IS 'Descripción de la pantalla'
;
COMMENT ON COLUMN vitalis_pantallas.pan_modulo IS 'Módulo al que pertenece'
;
COMMENT ON COLUMN vitalis_pantallas.pan_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_pantallas.pan_version IS 'Version del registro'
;

-- Table vitalis_usuarios

CREATE TABLE vitalis_usuarios(
  usu_id Number NOT NULL,
  per_id Number,
  prf_id Number,
  usu_login Varchar2(20 ) NOT NULL,
  usu_password Varchar2(20 ) NOT NULL,
  usu_fecha_creacion Date,
  usu_fecha_ultimo_acceso Date,
  usu_intentos_fallidos Number,
  usu_bloqueado Char(1 )
        CONSTRAINT chk_usu_bloqueado CHECK (activo IN ('S','N')),
  usu_estado Char(1 )
        CONSTRAINT chk_usu_estado CHECK (activo IN ('S','N')),
  usu_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_usuarios

CREATE INDEX vitalis_usuarios_ind01 ON vitalis_usuarios (per_id)
;

CREATE INDEX vitalis_usuarios_ind02 ON vitalis_usuarios (prf_id)
;

-- Add keys for table vitalis_usuarios

ALTER TABLE vitalis_usuarios ADD CONSTRAINT vitalis_usuarios_pk PRIMARY KEY (usu_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_usuarios.usu_id IS 'ID único del usuario
'
;
COMMENT ON COLUMN vitalis_usuarios.per_id IS 'Referencia a vitalis_personas
'
;
COMMENT ON COLUMN vitalis_usuarios.prf_id IS 'Referencia a vitalis_perfiles'
;
COMMENT ON COLUMN vitalis_usuarios.usu_login IS 'Nombre de usuario
'
;
COMMENT ON COLUMN vitalis_usuarios.usu_password IS 'Contraseña encriptada
'
;
COMMENT ON COLUMN vitalis_usuarios.usu_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN vitalis_usuarios.usu_fecha_ultimo_acceso IS 'Fecha del último acceso'
;
COMMENT ON COLUMN vitalis_usuarios.usu_intentos_fallidos IS 'Intentos fallidos de login
'
;
COMMENT ON COLUMN vitalis_usuarios.usu_bloqueado IS 'Usuario bloqueado (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_usuarios.usu_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_usuarios.usu_version IS 'Version del registro'
;

-- Table vitalis_centros_salud

CREATE TABLE vitalis_centros_salud(
  csa_id Number NOT NULL,
  dis_id Number,
  csa_codigo Number,
  csa_nombre Varchar2(20 ),
  csa_direccion_exacta Varchar2(200 ),
  csa_telefono Varchar2(15 ),
  csa_email Varchar2(30 ),
  csa_contacto_principal Varchar2(30 ),
  csa_telefono_contacto Varchar2(30 ),
  csa_estado Char(1 )
        CONSTRAINT chk_csa_estado CHECK (activo IN ('A','I')),
  csa_version Number
)
;

-- Create indexes for table vitalis_centros_salud

CREATE INDEX vitalis_centros_salud_ind01 ON vitalis_centros_salud (dis_id)
;

-- Add keys for table vitalis_centros_salud

ALTER TABLE vitalis_centros_salud ADD CONSTRAINT vitalis_centros_salud_pk PRIMARY KEY (csa_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_centros_salud.csa_id IS 'ID único del centro de salud
'
;
COMMENT ON COLUMN vitalis_centros_salud.dis_id IS 'Referencia a vitalis_distritos'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_codigo IS 'Código del centro de salud'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_nombre IS 'Nombre del centro de salud'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_direccion_exacta IS 'Dirección exacta'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_telefono IS 'Teléfono principal
'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_email IS 'Correo electrónico'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_contacto_principal IS 'Nombre del contacto principal'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_telefono_contacto IS 'Teléfono del contacto
'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_centros_salud.csa_version IS 'Version de los centros de salud'
;

-- Table vitalis_puestos

CREATE TABLE vitalis_puestos(
  pue_id Number NOT NULL,
  csa_id Number,
  pue_codigo Varchar2(30 ),
  pue_nombre Varchar2(30 ),
  pue_descripcion Varchar2(500 ),
  pue_especialidad Varchar2(30 ),
  pue_estado Char(1 )
        CONSTRAINT chk_pue_estado CHECK (activo IN ('A','I')),
  pue_nivel Varchar2(10 ),
  pue_salario Number,
  pue_version Number NOT NULL
)
;

-- Create indexes for table vitalis_puestos

CREATE INDEX vitalis_puestos_ind01 ON vitalis_puestos (csa_id)
;

-- Add keys for table vitalis_puestos

ALTER TABLE vitalis_puestos ADD CONSTRAINT vitalis_puestos_pk PRIMARY KEY (pue_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_puestos.pue_id IS ' ID único del puesto'
;
COMMENT ON COLUMN vitalis_puestos.csa_id IS 'Referencia a vitalis_centros_salud'
;
COMMENT ON COLUMN vitalis_puestos.pue_codigo IS 'Código del puesto'
;
COMMENT ON COLUMN vitalis_puestos.pue_nombre IS 'Nombre del puesto'
;
COMMENT ON COLUMN vitalis_puestos.pue_descripcion IS 'Descripción del puesto
'
;
COMMENT ON COLUMN vitalis_puestos.pue_especialidad IS 'Especialidad requerida'
;
COMMENT ON COLUMN vitalis_puestos.pue_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_puestos.pue_nivel IS 'Nivel requerido para el puesto(DIPLOMADO, BACHILLER, MASRTER, DOCTORADO)'
;
COMMENT ON COLUMN vitalis_puestos.pue_salario IS 'Salario del puesto'
;
COMMENT ON COLUMN vitalis_puestos.pue_version IS 'Version del registro'
;

-- Table vitalis_turnos

CREATE TABLE vitalis_turnos(
  tur_id Number NOT NULL,
  tur_nombre Varchar2(10 ),
  tur_hora_inicio Timestamp(4),
  tur_hora_fin Timestamp(4),
  tur_horas_laborales Number,
  tur_estado Char(1 )
        CONSTRAINT chk_tur_estado CHECK (activo IN ('A','I')),
  tur_tipo Varchar2(15 ),
  tur_break Number,
  tur_version Number NOT NULL
)
;

-- Add keys for table vitalis_turnos

ALTER TABLE vitalis_turnos ADD CONSTRAINT vitalis_turnos_pk PRIMARY KEY (tur_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_turnos.tur_id IS ' ID único del turno'
;
COMMENT ON COLUMN vitalis_turnos.tur_nombre IS 'Nombre del turno(Diurno, Nocturno)'
;
COMMENT ON COLUMN vitalis_turnos.tur_hora_inicio IS 'Hora de inicio'
;
COMMENT ON COLUMN vitalis_turnos.tur_hora_fin IS 'Hora de fin'
;
COMMENT ON COLUMN vitalis_turnos.tur_horas_laborales IS 'Horas laborales'
;
COMMENT ON COLUMN vitalis_turnos.tur_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_turnos.tur_tipo IS 'Tipo de turno (Rotativo, Guardia, Fijo, Extra)'
;
COMMENT ON COLUMN vitalis_turnos.tur_break IS 'Tiempo de descanso que dispone la persona en un turno'
;
COMMENT ON COLUMN vitalis_turnos.tur_version IS 'Version del registro'
;

-- Table vitalis_tipos_procedimientos

CREATE TABLE vitalis_tipos_procedimientos(
  tpr_id Number NOT NULL,
  tpr_codigo Number NOT NULL,
  tpr_nombre Varchar2(20 ) NOT NULL,
  tpr_descripcion Varchar2(500 ),
  tpr_monto_base_cobrar Number,
  tpr_monto_base_pagar Number,
  tpr_estado Char(1 )
        CONSTRAINT chk_tpr_estado CHECK (activo IN ('A','I')),
  tpr_version Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_procedimientos

ALTER TABLE vitalis_tipos_procedimientos ADD CONSTRAINT vitalis_tipos_procedimientos_pk PRIMARY KEY (tpr_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_id IS ' ID único del tipo de procedimiento'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_codigo IS 'Código del tipo de procedimiento'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_nombre IS 'Nombre del tipo de procedimiento
'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_descripcion IS 'Descripción del procedimiento'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_monto_base_cobrar IS 'Monto base a cobrar'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_monto_base_pagar IS 'Monto base a pagar al médico'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_tipos_procedimientos.tpr_version IS 'Version del registro'
;

-- Table vitalis_procedimientos_medicos

CREATE TABLE vitalis_procedimientos_medicos(
  prm_id Number NOT NULL,
  per_id Number,
  tpr_id Number,
  csa_id Number,
  prm_fecha_procedimiento Date,
  prm_hora_inicio Timestamp(4),
  prm_hora_fin Timestamp(4),
  prm_paciente_nombre Varchar2(30 ),
  prm_paciente_cedula Varchar2(12 ),
  prm_observaciones Varchar2(500 ),
  prm_monto_cobrar Number,
  prm_monto_pagar Number,
  prm_procesado Char(1 )
        CONSTRAINT chk_prm_procesado CHECK (activo IN ('S','N')),
  prm_estado Char(1 )
        CONSTRAINT chk_prm_estado CHECK (activo IN ('A','I')),
  prm_version Number NOT NULL
)
;

-- Create indexes for table vitalis_procedimientos_medicos

CREATE INDEX vitalis_procedimientos_medicos_ind01 ON vitalis_procedimientos_medicos (per_id)
;

CREATE INDEX vitalis_procedimientos_medicos_ind02 ON vitalis_procedimientos_medicos (tpr_id)
;

CREATE INDEX vitalis_procedimientos_medicos_ind03 ON vitalis_procedimientos_medicos (csa_id)
;

-- Add keys for table vitalis_procedimientos_medicos

ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_procedimientos_medicos_pk PRIMARY KEY (prm_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_procedimientos_medicos.per_id IS 'Referencia a vitalis_personas (médico)'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.tpr_id IS 'Referencia a vitalis_tipos_procedimientos'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.csa_id IS 'Referencia a vitalis_centros_salud'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_fecha_procedimiento IS 'Fecha del procedimiento'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_hora_inicio IS 'Hora de inicio
'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_hora_fin IS 'Hora de fin'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_paciente_nombre IS 'Nombre del paciente'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_paciente_cedula IS 'Cédula del paciente'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_observaciones IS 'Observaciones del procedimiento'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_monto_cobrar IS 'Monto a cobrar al centro'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_monto_pagar IS 'Monto a pagar al médico'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_procesado IS 'Procesado en planilla (S=Sí, N=No)'
;
COMMENT ON COLUMN vitalis_procedimientos_medicos.prm_estado IS ' Estado (A=Activo, I=Inactivo)'
;

-- Table vitalis_escalas_base

CREATE TABLE vitalis_escalas_base(
  esb_id Number NOT NULL,
  csa_id Number,
  esb_nombre Varchar2(30 ),
  esb_semana_inicio Date,
  esb_semana_fin Date,
  esb_fecha_creacion Date,
  esb_estado Char(1 )
        CONSTRAINT chk_esb_estado CHECK (activo IN ('A','I')),
  esb_version Number DEFAULT 1
 NOT NULL
)
;

-- Create indexes for table vitalis_escalas_base

CREATE INDEX vitalis_escalas_base_ind01 ON vitalis_escalas_base (csa_id)
;

-- Add keys for table vitalis_escalas_base

ALTER TABLE vitalis_escalas_base ADD CONSTRAINT vitalis_escalas_base_pk PRIMARY KEY (esb_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_escalas_base.esb_id IS 'ID único de la escala base'
;
COMMENT ON COLUMN vitalis_escalas_base.csa_id IS 'Referencia a vitalis_centros_salud
'
;
COMMENT ON COLUMN vitalis_escalas_base.esb_nombre IS 'Nombre de la escala base
'
;
COMMENT ON COLUMN vitalis_escalas_base.esb_semana_inicio IS 'Fecha de inicio de la semana'
;
COMMENT ON COLUMN vitalis_escalas_base.esb_semana_fin IS 'Fecha de fin de la semana
'
;
COMMENT ON COLUMN vitalis_escalas_base.esb_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN vitalis_escalas_base.esb_estado IS 'Estado (A=Activo, I=Inactivo)

'
;

-- Table vitalis_escalas_base_detalle

CREATE TABLE vitalis_escalas_base_detalle(
  esd_id Number NOT NULL,
  per_id Number,
  esb_id Number,
  put_id Number,
  esd_dia_semana Number,
  esd_estado Char(1 )
        CONSTRAINT chk_esd_estado CHECK (activo IN ('A','I')),
  esd_version Number NOT NULL
)
;

-- Create indexes for table vitalis_escalas_base_detalle

CREATE INDEX vitalis_escalas_base_detalle_ind01 ON vitalis_escalas_base_detalle (per_id)
;

CREATE INDEX vitalis_escalas_base_detalle_ind02 ON vitalis_escalas_base_detalle (esb_id)
;

CREATE INDEX vitalis_escalas_base_detalle_ind03 ON vitalis_escalas_base_detalle (put_id)
;

-- Add keys for table vitalis_escalas_base_detalle

ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT vitalis_escalas_base_detalle_pk PRIMARY KEY (esd_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_escalas_base_detalle.esd_id IS 'ID único del detalle de escala base'
;
COMMENT ON COLUMN vitalis_escalas_base_detalle.per_id IS 'Referencia a vitalis_personas (médico)
'
;
COMMENT ON COLUMN vitalis_escalas_base_detalle.esb_id IS 'Referencia a vitalis_escalas_base'
;
COMMENT ON COLUMN vitalis_escalas_base_detalle.put_id IS 'Referencia a vitalis_puestos_turnos'
;
COMMENT ON COLUMN vitalis_escalas_base_detalle.esd_dia_semana IS 'Día de la semana (1=Lunes, 7=Domingo)'
;
COMMENT ON COLUMN vitalis_escalas_base_detalle.esd_estado IS 'A=activo I=inactivo'
;

-- Table vitalis_escalas_mensuales

CREATE TABLE vitalis_escalas_mensuales(
  esm_id Number NOT NULL,
  esb_id Number,
  csa_id Number,
  esm_mes Number,
  esm_anio Number,
  esm_nombre Varchar2(20 ),
  esm_fecha_creacion Date,
  esm_estado Varchar2(30 ),
  esm_procesado Char(1 )
        CONSTRAINT chk_esm_procesado CHECK (activo IN ('S','N')),
  esm_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_escalas_mensuales

CREATE INDEX vitalis_escalas_mensuales_ind01 ON vitalis_escalas_mensuales (esb_id)
;

CREATE INDEX vitalis_escalas_mensuales_ind02 ON vitalis_escalas_mensuales (csa_id)
;

-- Add keys for table vitalis_escalas_mensuales

ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT vitalis_escalas_mensuales_pk PRIMARY KEY (esm_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_escalas_mensuales.esm_id IS 'ID único de la escala mensual'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esb_id IS 'Referencia a vitalis_escalas_base'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.csa_id IS 'Referencia a vitalis_centros_salud'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_mes IS 'Mes de la escala
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_anio IS 'Año de la escala'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_nombre IS 'Nombre de la escala mensual'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_fecha_creacion IS 'Fecha de creación'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_estado IS 'CONSTRUCCION, VIGENTE, EN_REVISION, LISTA_PAGO, PROCESADA'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_procesado IS 'Procesado en planilla (S=Sí, N=No)

'
;
COMMENT ON COLUMN vitalis_escalas_mensuales.esm_version IS 'Version del registro'
;

-- Table vitalis_escalas_mensuales_detalle

CREATE TABLE vitalis_escalas_mensuales_detalle(
  emd_id Number NOT NULL,
  esm_id Number,
  per_id Number,
  put_id Number,
  emd_fecha Date,
  emd_trabajado Char(1 )
        CONSTRAINT chk_emd_trabajado CHECK (activo IN ('S','N')),
  emd_hora_inicio_real Timestamp(4),
  emd_hora_fin_real Timestamp(4),
  emd_horas_trabajadas Number,
  emd_observaciones Varchar2(500 ),
  emd_procesado Char(1 )
        CONSTRAINT chk_emd_procesado CHECK (activo IN ('S','N')),
  emd_estado Char(1 )
        CONSTRAINT chk_emd_estado CHECK (activo IN ('A','I'))
)
;

-- Create indexes for table vitalis_escalas_mensuales_detalle

CREATE INDEX IX_Relationship13 ON vitalis_escalas_mensuales_detalle (esm_id)
;

CREATE INDEX IX_Relationship32 ON vitalis_escalas_mensuales_detalle (per_id)
;

CREATE INDEX IX_Relationship44 ON vitalis_escalas_mensuales_detalle (put_id)
;

-- Add keys for table vitalis_escalas_mensuales_detalle

ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_escalas_mensuales_detalle_pk PRIMARY KEY (emd_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_id IS 'ID único del detalle de escala mensual'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.esm_id IS 'Referencia a vitalis_escalas_mensuales'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.per_id IS 'Referencia a vitalis_personas (médico)
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.put_id IS 'Referencia a vitalis_puestos_turnos'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_fecha IS 'Fecha específica del turno
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_trabajado IS 'Si trabajó (S=Sí, N=No)'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_hora_inicio_real IS 'Hora real de inicio
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_hora_fin_real IS 'Hora real de fin
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_horas_trabajadas IS 'Horas realmente trabajadas'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_observaciones IS 'Observaciones del turno'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_procesado IS 'Procesado en planilla (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_escalas_mensuales_detalle.emd_estado IS 'Estado (A=Activo, I=Inactivo)

'
;

-- Table vitalis_tipos_planillas

CREATE TABLE vitalis_tipos_planillas(
  tpl_id Number NOT NULL,
  tpl_codigo Number,
  tpl_nombre Varchar2(20 ),
  tpl_descripcion Varchar2(500 ),
  tpl_tipo_personal Char(1 )
        CONSTRAINT chk_tpl_tipo_personal CHECK (activo IN ('M','A')),
  tpl_estado Char(1 )
        CONSTRAINT chk_tpl_estado CHECK (activo IN ('A','I')),
  tpl_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_tipos_planillas

ALTER TABLE vitalis_tipos_planillas ADD CONSTRAINT vitalis_tipos_planillas_pk PRIMARY KEY (tpl_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tipos_planillas.tpl_id IS 'ID único del tipo de planilla'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_codigo IS 'Código del tipo de planilla'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_nombre IS 'Nombre del tipo de planilla'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_descripcion IS 'Descripción del tipo de planilla'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_tipo_personal IS 'M=Medico, A=Administrativo'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_estado IS 'Estado (A=Activo, I=Inactivo)'
;

-- Table vitalis_tipos_movimientos

CREATE TABLE vitalis_tipos_movimientos(
  tmo_id Number NOT NULL,
  tmo_codigo Number,
  tmo_nombre Varchar2(20 ),
  tmo_descripcion Varchar2(500 ),
  tmo_tipo Varchar2(20 ),
  tmo_calculo Varchar2(20 ),
  tmo_valor Number,
  tmo_rango_salarial_min Number,
  tmo_rango_salarial_max Number,
  tmo_automatico Char(1 )
        CONSTRAINT chk_tmo_automatico CHECK (activo IN ('S','N')),
  tmo_aplica_medicos Char(1 )
        CONSTRAINT chk_tmo_aplica_medicos CHECK (activo IN ('S','N')),
  tmo_aplica_administrativos Char(1 )
        CONSTRAINT chk_tmo_aplica_administrativos CHECK (activo IN ('S','N')),
  tmo_estado Char(1 )
        CONSTRAINT chk_tmo_estado CHECK (activo IN ('A','I')),
  tmo_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_tipos_movimientos

ALTER TABLE vitalis_tipos_movimientos ADD CONSTRAINT vitalis_tipos_movimientos_pk PRIMARY KEY (tmo_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_id IS 'ID único del tipo de movimiento'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_codigo IS 'Código del tipo de movimiento'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_nombre IS 'Nombre del tipo de movimiento'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_descripcion IS 'Descripción del movimiento'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_tipo IS 'INGRESO, DEDUCCION'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_calculo IS 'PORCENTUAL, ABSOLUTO'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_valor IS 'Valor del movimiento (% o monto)
'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_rango_salarial_min IS 'Rango salarial mínimo'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_rango_salarial_max IS 'Rango salarial máximo'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_automatico IS 'Movimiento automático (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_aplica_medicos IS 'Aplica a médicos (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_aplica_administrativos IS 'Aplica a administrativos (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_tipos_movimientos.tmo_version IS 'Version del registro'
;

-- Table vitalis_planillas

CREATE TABLE vitalis_planillas(
  pla_id Number NOT NULL,
  tpl_id Number,
  pla_mes Number,
  pla_anio Number,
  pla_nombre Varchar2(20 ),
  pla_fecha_generacion Date,
  pla_fecha_aprobacion Date,
  pla_usu_aprobador Varchar2(20 ),
  pla_total_ingresos Number,
  pla_total_deducciones Number,
  pla_total_neto Number,
  pla_estado Char(1 )
        CONSTRAINT chk_pla_estado CHECK (activo IN ('G','A','P')),
  pla_notificada Char(1 )
        CONSTRAINT chk_pla_notificada CHECK (activo IN ('S','N')),
  pla_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_planillas

CREATE INDEX vitalis_planillas_ind01 ON vitalis_planillas (tpl_id)
;

-- Add keys for table vitalis_planillas

ALTER TABLE vitalis_planillas ADD CONSTRAINT vitalis_planillas_pk PRIMARY KEY (pla_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_planillas.pla_id IS 'ID único de la planilla'
;
COMMENT ON COLUMN vitalis_planillas.tpl_id IS 'Referencia a vitalis_tipos_planillas'
;
COMMENT ON COLUMN vitalis_planillas.pla_mes IS 'Mes de la planilla'
;
COMMENT ON COLUMN vitalis_planillas.pla_anio IS 'Año de la planilla
'
;
COMMENT ON COLUMN vitalis_planillas.pla_nombre IS 'Nombre de la planilla
'
;
COMMENT ON COLUMN vitalis_planillas.pla_fecha_generacion IS 'Fecha de generación'
;
COMMENT ON COLUMN vitalis_planillas.pla_fecha_aprobacion IS 'Fecha de aprobación'
;
COMMENT ON COLUMN vitalis_planillas.pla_usu_aprobador IS 'Usuario que aprobó'
;
COMMENT ON COLUMN vitalis_planillas.pla_total_ingresos IS 'Total de ingresos'
;
COMMENT ON COLUMN vitalis_planillas.pla_total_deducciones IS 'Total de deducciones'
;
COMMENT ON COLUMN vitalis_planillas.pla_total_neto IS 'Total neto a pagar'
;
COMMENT ON COLUMN vitalis_planillas.pla_estado IS 'G=generada, A=aprobada, P=Pagada
'
;
COMMENT ON COLUMN vitalis_planillas.pla_notificada IS 'Comprobantes enviados (S=Sí, N=No)

'
;
COMMENT ON COLUMN vitalis_planillas.pla_version IS 'Version del registro'
;

-- Table vitalis_planillas_detalle

CREATE TABLE vitalis_planillas_detalle(
  pld_id Number NOT NULL,
  pla_id Number,
  per_id Number,
  pld_salario_base Number,
  pld_total_ingresos Number,
  pld_total_deducciones Number,
  pld_total_neto Number,
  pld_notificado Char(1 )
        CONSTRAINT chk_pld_notificado CHECK (activo IN ('S','N')),
  pld_fecha_notificacion Date,
  pld_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_planillas_detalle

CREATE INDEX vitalis_planillas_detalle_ind01 ON vitalis_planillas_detalle (pla_id)
;

CREATE INDEX vitalis_planillas_detalle_ind02 ON vitalis_planillas_detalle (per_id)
;

-- Add keys for table vitalis_planillas_detalle

ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT vitalis_planillas_detalle_pk PRIMARY KEY (pld_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_planillas_detalle.pld_id IS 'ID único del detalle de planilla'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pla_id IS 'Referencia a vitalis_planillas
'
;
COMMENT ON COLUMN vitalis_planillas_detalle.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_salario_base IS 'Salario base
'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_total_ingresos IS 'Total de ingresos'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_total_deducciones IS 'Total de deducciones'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_total_neto IS 'Total neto a pagar
'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_notificado IS 'Comprobante enviado (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_fecha_notificacion IS 'Fecha de envío del comprobante'
;
COMMENT ON COLUMN vitalis_planillas_detalle.pld_version IS 'Version registro'
;

-- Table vitalis_planillas_movimientos

CREATE TABLE vitalis_planillas_movimientos(
  plm_id Number NOT NULL,
  tmo_id Number,
  pld_id Number,
  plm_concepto Varchar2(500 ),
  plm_cantidad Number,
  plm_valor_unitario Number,
  plm_monto Number,
  plm_tipo Varchar2(20 ),
  plm_origen Varchar2(20 ),
  plm_origen_id Varchar2(20 ),
  plm_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_planillas_movimientos

CREATE INDEX vitalis_planillas_movimientos_ind01 ON vitalis_planillas_movimientos (tmo_id)
;

CREATE INDEX vitalis_planillas_movimientos_ind02 ON vitalis_planillas_movimientos (pld_id)
;

-- Add keys for table vitalis_planillas_movimientos

ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT vitalis_planillas_movimientos_pk PRIMARY KEY (plm_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_planillas_movimientos.plm_id IS 'ID único del movimiento de planilla'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.tmo_id IS 'Referencia a vitalis_tipos_movimientos'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.pld_id IS 'Referencia a vitalis_planillas_detalle'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_concepto IS 'Concepto del movimiento, del porque se hizo'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_cantidad IS 'Cantidad (horas, turnos, etc.)
'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_valor_unitario IS 'Valor unitario'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_monto IS 'Monto total del movimiento'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_tipo IS 'INGRESO, DEDUCCION'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_origen IS 'TURNO, PROCEDIMIENTO, AUTOMATICO'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_origen_id IS 'ID del origen (turno o procedimiento)

'
;
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_version IS 'Version del registro'
;

-- Table vitalis_resumen_financiero

CREATE TABLE vitalis_resumen_financiero(
  ref_id Number NOT NULL,
  csa_id Number,
  ref_mes Number,
  ref_anio Number,
  ref_total_ingresos_turnos Number,
  ref_total_ingresos_procedimientos Number,
  ref_total_ingresos Number,
  ref_total_gastos_medicos Number,
  ref_total_gastos_administrativos Number,
  ref_total_gastos Number,
  ref_utilidad Varchar2(30 ),
  ref_fecha_generacion Date,
  ref_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_resumen_financiero

CREATE INDEX vitalis_resumen_financiero_ind01 ON vitalis_resumen_financiero (csa_id)
;

-- Add keys for table vitalis_resumen_financiero

ALTER TABLE vitalis_resumen_financiero ADD CONSTRAINT vitalis_resumen_financiero_pk PRIMARY KEY (ref_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_resumen_financiero.ref_id IS 'ID único del resumen financiero'
;
COMMENT ON COLUMN vitalis_resumen_financiero.csa_id IS 'Referencia a vitalis_centros_salud (NULL para general)'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_mes IS 'Mes del resumen
'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_anio IS 'Año del resumen'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_ingresos_turnos IS 'Total ingresos por turnos'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_ingresos_procedimientos IS 'Total ingresos por procedimientos'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_ingresos IS 'Total de ingresos
'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_gastos_medicos IS 'Total gastos médicos'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_gastos_administrativos IS 'Total gastos administrativos'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_total_gastos IS 'Total de gastos
'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_utilidad IS 'Utilidad (ingresos - gastos)
'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_fecha_generacion IS 'Fecha de generación

'
;
COMMENT ON COLUMN vitalis_resumen_financiero.ref_version IS 'Version del registro'
;

-- Table vitalis_parametros

CREATE TABLE vitalis_parametros(
  par_id Number NOT NULL,
  par_codigo Number,
  par_nombre Varchar2(30 ),
  par_valor Varchar2(30 ),
  par_descripcion Varchar2(500 ),
  par_tipo_dato Varchar2(30 ),
  par_encriptado Char(1 )
        CONSTRAINT chk_par_encriptado CHECK (activo IN ('S','N')),
  par_modulo Varchar2(30 ),
  par_estado Char(1 )
        CONSTRAINT chk_par_estado CHECK (ACTIVO IN('A','S')),
  par_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_parametros

ALTER TABLE vitalis_parametros ADD CONSTRAINT vitalis_parametros_pk PRIMARY KEY (par_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_parametros.par_id IS 'ID único del parámetro'
;
COMMENT ON COLUMN vitalis_parametros.par_codigo IS 'Código del parámetro'
;
COMMENT ON COLUMN vitalis_parametros.par_nombre IS 'Nombre del parámetro'
;
COMMENT ON COLUMN vitalis_parametros.par_valor IS 'Valor del parámetro
'
;
COMMENT ON COLUMN vitalis_parametros.par_descripcion IS 'Descripción del parámetro'
;
COMMENT ON COLUMN vitalis_parametros.par_tipo_dato IS 'STRING, NUMBER, DATE, BOOLEAN
'
;
COMMENT ON COLUMN vitalis_parametros.par_encriptado IS 'Valor encriptado (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_parametros.par_modulo IS 'Módulo al que pertenece'
;
COMMENT ON COLUMN vitalis_parametros.par_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_parametros.par_version IS 'Version del registro'
;

-- Table vitalis_bitacoras

CREATE TABLE vitalis_bitacoras(
  bit_id Number NOT NULL,
  bit_tabla Varchar2(30 ),
  bit_operacion Varchar2(30 ),
  bit_pk_tabla Number,
  bit_usu_id Number,
  bit_fecha Date,
  bit_valores_anteriores Varchar2(30 ),
  bit_valores_nuevos Varchar2(30 ),
  bit_ip_usuario Varchar2(12 ),
  bit_version Number DEFAULT 1,
  usu_id Number
)
;

-- Create indexes for table vitalis_bitacoras

CREATE INDEX IX_Relationship63 ON vitalis_bitacoras (usu_id)
;

-- Add keys for table vitalis_bitacoras

ALTER TABLE vitalis_bitacoras ADD CONSTRAINT vitalis_bitacoras_pk PRIMARY KEY (bit_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_bitacoras.bit_id IS ' ID único de la bitácora'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_tabla IS 'Nombre de la tabla
'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_operacion IS 'INSERT, UPDATE, DELETE'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_pk_tabla IS 'Clave primaria del registro'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_usu_id IS 'Usuario que realizó la operación
'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_fecha IS 'Fecha y hora de la operación'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_valores_anteriores IS 'Valores anteriores (para UPDATE y DELETE)
'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_valores_nuevos IS 'Valores nuevos (para INSERT y UPDATE)
'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_ip_usuario IS 'IP del usuario

'
;
COMMENT ON COLUMN vitalis_bitacoras.bit_version IS 'Version del registro'
;

-- Table vitalis_padron_nacional

CREATE TABLE vitalis_padron_nacional(
  pad_id Number NOT NULL,
  pad_cedula Varchar2(12 ) NOT NULL,
  pad_nombre Varchar2(30 ),
  pad_apellido1 Varchar2(30 ),
  pad_apellido2 Varchar2(30 ),
  pad_codigo_elec Varchar2(6 ),
  pad_fecha_cadu Date,
  pad_junta_recep Varchar2(5 ),
  pad_provincia Varchar2(15 ),
  pad_canton Varchar2(25 ),
  pad_distrito Varchar2(40 )
)
;

-- Add keys for table vitalis_padron_nacional

ALTER TABLE vitalis_padron_nacional ADD CONSTRAINT vitalis_padron_nacional_pk PRIMARY KEY (pad_id)
;

ALTER TABLE vitalis_padron_nacional ADD CONSTRAINT pad_cedula UNIQUE (pad_cedula)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_padron_nacional.pad_id IS 'ID único del padrón'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_cedula IS 'Cédula de identidad'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_nombre IS 'Nombre'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_apellido1 IS 'Primer apellido
'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_apellido2 IS 'Segundo apellido'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_codigo_elec IS 'Codigo electoral'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_fecha_cadu IS 'Fecha de caducidad o sea cuando se vence la cedula'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_junta_recep IS 'Junta receptora de la persona'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_provincia IS 'Provincia de la persona'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_canton IS 'Cantón de la persona'
;
COMMENT ON COLUMN vitalis_padron_nacional.pad_distrito IS 'Distrito de la persona'
;

-- Table vitalis_puestos_turnos

CREATE TABLE vitalis_puestos_turnos(
  pue_id Number NOT NULL,
  tur_id Number NOT NULL,
  put_id Number NOT NULL,
  put_dia_semana Number,
  put_monto_cobrar Number,
  put_monto_pagar Number,
  put_tipo_pago Varchar2(10 ),
  put_fecha_inicio Date,
  put_fecha_fin Date,
  put_max_personas Number,
  put_min_persona Number,
  put_version Varchar2(30 ) NOT NULL,
  CONSTRAINT vitalis_puestos_turnos_ck01 CHECK ( put_dia_semana in ('1', '2', '3', '4', '5', '6', '7'))
)
;

-- Add keys for table vitalis_puestos_turnos

ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT vitalis_puestos_turnos_pk PRIMARY KEY (put_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_puestos_turnos.pue_id IS 'Referencia a vitalis_puestos'
;
COMMENT ON COLUMN vitalis_puestos_turnos.tur_id IS 'Referencia a vitalis_turnos'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_id IS ' ID único de la relación puesto-turno'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_dia_semana IS 'Día de la semana (1=Lunes, 7=Domingo)
'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_monto_cobrar IS 'Monto a cobrar al centro'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_monto_pagar IS 'Monto a pagar al médico'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_tipo_pago IS 'HORAS, TURNO_COMPLETO'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_fecha_inicio IS 'Fecha de inicio de vigencia'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_fecha_fin IS 'Fecha de fin de vigencia'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_max_personas IS 'Maximo de personas por turno'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_min_persona IS 'Minimo de persona por turno'
;
COMMENT ON COLUMN vitalis_puestos_turnos.put_version IS 'Version del registro'
;

-- Table vitalis_perfiles_pantallas

CREATE TABLE vitalis_perfiles_pantallas(
  pan_id Number NOT NULL,
  prf_id Number NOT NULL,
  prp_id Number NOT NULL,
  prp_lectura Char(1 )
        CONSTRAINT chk_prp_lectura CHECK (activo IN ('S','N')),
  prp_escritura Char(1 )
        CONSTRAINT chk_prp_escritura CHECK (activo IN ('S','N')),
  prp_eliminacion Char(1 )
        CONSTRAINT chk_prp_eliminacion CHECK (activo IN ('S','N')),
  prp_estado Char(1 )
        CONSTRAINT chk_prp_estado CHECK (activo IN ('I','A')),
  prp_version Number DEFAULT 1
)
;

-- Add keys for table vitalis_perfiles_pantallas

ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_perfiles_pantallas_pk PRIMARY KEY (prp_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_perfiles_pantallas.pan_id IS 'Referencia a vitalis_pantallas'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prf_id IS 'Referencia a vitalis_perfiles'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_id IS 'ID único de la relación'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_lectura IS 'Permiso de lectura (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_escritura IS 'Permiso de escritura (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_eliminacion IS 'Permiso de eliminación (S=Sí, N=No)
'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_estado IS 'Estado (A=Activo, I=Inactivo)

'
;
COMMENT ON COLUMN vitalis_perfiles_pantallas.prp_version IS 'Version del registro'
;

-- Table vitalis_personal_tipos_planillas

CREATE TABLE vitalis_personal_tipos_planillas(
  per_id Number NOT NULL,
  tpl_id Number NOT NULL,
  ptp_id Number NOT NULL,
  ptp_salario_base Number,
  ptp_fecha_asignacion Varchar2(30 ),
  ptp_estado Char(1 )
        CONSTRAINT chk_ptp_estado CHECK (activo IN ('A','I')),
  ptp_version Number DEFAULT 1
)
;

-- Add keys for table vitalis_personal_tipos_planillas

ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_personal_tipos_plantillas_pk PRIMARY KEY (ptp_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_personal_tipos_planillas.per_id IS 'Referencia a vitalis_personas'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.tpl_id IS 'Referencia a vitalis_tipos_planillas'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.ptp_id IS 'ID único de la relación
'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.ptp_salario_base IS 'Salario base (para administrativos)'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.ptp_fecha_asignacion IS 'Fecha de asignación'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.ptp_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_personal_tipos_planillas.ptp_version IS 'Version del registro'
;

-- Table vitalis_estados

CREATE TABLE vitalis_estados(
  est_id Number NOT NULL,
  est_nombre Varchar2(1 ),
  CONSTRAINT vitalis_estados_ck01 CHECK (est_nombre in ('P', 'R', 'A'))
)
;

-- Add keys for table vitalis_estados

ALTER TABLE vitalis_estados ADD CONSTRAINT vitalis_estados_pk PRIMARY KEY (est_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_estados.est_id IS 'Id unico del estado'
;
COMMENT ON COLUMN vitalis_estados.est_nombre IS 'Estado (P= pendiente, R= rechazo, A= aprovado) '
;

-- Table vitalis_identificacion

CREATE TABLE vitalis_identificacion(
  ide_id Number NOT NULL,
  ide_numero Varchar2(30 ),
  ide_tipo Varchar2(30 ),
  ide_version Number DEFAULT 1 NOT NULL,
  per_id Number
)
;

-- Create indexes for table vitalis_identificacion

CREATE INDEX vitalis_identificacion_ind01 ON vitalis_identificacion (per_id)
;

-- Add keys for table vitalis_identificacion

ALTER TABLE vitalis_identificacion ADD CONSTRAINT vitalis_identificacion_pk PRIMARY KEY (ide_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_identificacion.ide_id IS 'Identificador de identificaccion'
;
COMMENT ON COLUMN vitalis_identificacion.ide_numero IS 'Numero de la identificacion'
;
COMMENT ON COLUMN vitalis_identificacion.ide_tipo IS 'Dimex, cedula de identidad, pasaporte, etc
'
;

-- Table vitalis_notificaciones

CREATE TABLE vitalis_notificaciones(
  not_id Number NOT NULL,
  not_tipo Varchar2(30 ),
  not_destinatario Varchar2(30 ),
  not_asunto Varchar2(30 ),
  not_mensaje Varchar2(500 ),
  not_fecha_envio Date,
  not_estado Char(1 )
        CONSTRAINT chk_not_estado CHECK (activo IN ('E','P','F')),
  not_intentos Number,
  not_version Number DEFAULT 1,
  pln_id Number
)
;

-- Create indexes for table vitalis_notificaciones

CREATE INDEX vitalis_notificaciones_ind01 ON vitalis_notificaciones (pln_id)
;

-- Add keys for table vitalis_notificaciones

ALTER TABLE vitalis_notificaciones ADD CONSTRAINT vitalis_notificaciones_pk PRIMARY KEY (not_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_notificaciones.not_tipo IS 'Tipo de notificación
'
;
COMMENT ON COLUMN vitalis_notificaciones.not_destinatario IS 'Email destinatario
'
;
COMMENT ON COLUMN vitalis_notificaciones.not_asunto IS 'Ansunto de la notificacion'
;
COMMENT ON COLUMN vitalis_notificaciones.not_mensaje IS 'Mensaje de la notificacion'
;
COMMENT ON COLUMN vitalis_notificaciones.not_fecha_envio IS 'Fecha de envio'
;
COMMENT ON COLUMN vitalis_notificaciones.not_estado IS 'E=Enviado, P=Pendiente, F=Fallido'
;
COMMENT ON COLUMN vitalis_notificaciones.not_intentos IS 'Intentos de envio'
;
COMMENT ON COLUMN vitalis_notificaciones.not_version IS 'Version del registro'
;

-- Table vitalis_contratos

CREATE TABLE vitalis_contratos(
  ctr_id Number NOT NULL,
  ctr_tipo Varchar2(500 ),
  ctr_fecha_inicio Date,
  ctr_fecha_fin Date,
  ctr_monto_base Number,
  ctr_estado Char(1 )
        CONSTRAINT chk_ctr_estado CHECK (activo IN ('A','I')),
  ctr_version Number,
  per_id Number
)
;

-- Create indexes for table vitalis_contratos

CREATE INDEX IX_Relationship49 ON vitalis_contratos (per_id)
;

-- Add keys for table vitalis_contratos

ALTER TABLE vitalis_contratos ADD CONSTRAINT vitalis_contratos_pk PRIMARY KEY (ctr_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_contratos.ctr_tipo IS 'Tipo del contrato que se va a realizar'
;
COMMENT ON COLUMN vitalis_contratos.ctr_fecha_inicio IS 'fecha de inicio del contrato'
;
COMMENT ON COLUMN vitalis_contratos.ctr_fecha_fin IS 'fecha final del contrato'
;
COMMENT ON COLUMN vitalis_contratos.ctr_monto_base IS 'El monto que estipula la legislación según el puesto'
;
COMMENT ON COLUMN vitalis_contratos.ctr_estado IS 'Estado A=activo I=Inactivo'
;
COMMENT ON COLUMN vitalis_contratos.ctr_version IS 'Version en la que se encuentra el contrato'
;

-- Table vitalis_incapacidades

CREATE TABLE vitalis_incapacidades(
  inc_id Number NOT NULL,
  inc_fecha_inicio Date,
  inc_fecha_fin Date,
  inc_tipo Varchar2(30 ),
  inc_certificado Blob,
  inc_version Number DEFAULT 1,
  per_id Number
)
;

-- Create indexes for table vitalis_incapacidades

CREATE INDEX vitalis_incapacidades_ind01 ON vitalis_incapacidades (per_id)
;

-- Add keys for table vitalis_incapacidades

ALTER TABLE vitalis_incapacidades ADD CONSTRAINT vitalis_incapacidades_pk PRIMARY KEY (inc_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_incapacidades.inc_fecha_inicio IS 'Fecha de inicio de la incapacidad'
;
COMMENT ON COLUMN vitalis_incapacidades.inc_fecha_fin IS 'Fecha final de incapacidad'
;
COMMENT ON COLUMN vitalis_incapacidades.inc_tipo IS 'Concepto de la incapacidad'
;
COMMENT ON COLUMN vitalis_incapacidades.inc_certificado IS 'Constancia o comprobante de la incapacidad
'
;

-- Table vitalis_vacaciones

CREATE TABLE vitalis_vacaciones(
  vac_id Number NOT NULL,
  vac_fecha_inicio Date NOT NULL,
  vac_fecha_fin Date NOT NULL,
  vac_dias Number NOT NULL,
  vac_estado Char(1 ) NOT NULL
        CONSTRAINT chk_vac_estado CHECK (activo IN ('A','I')),
  vac_version Number DEFAULT 1 NOT NULL,
  per_id Number
)
;

-- Create indexes for table vitalis_vacaciones

CREATE INDEX vitalis_vacaciones_ind01 ON vitalis_vacaciones (per_id)
;

-- Add keys for table vitalis_vacaciones

ALTER TABLE vitalis_vacaciones ADD CONSTRAINT vitalis_vacaciones_pk PRIMARY KEY (vac_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_vacaciones.vac_fecha_inicio IS 'Fecha de inicio de vaciones
'
;
COMMENT ON COLUMN vitalis_vacaciones.vac_fecha_fin IS 'Fecha final de vaciones'
;
COMMENT ON COLUMN vitalis_vacaciones.vac_dias IS 'Numero de dias de vaciones'
;
COMMENT ON COLUMN vitalis_vacaciones.vac_estado IS 'A=activo I=Inactivo'
;
COMMENT ON COLUMN vitalis_vacaciones.vac_version IS 'Version en la que se encuentra las vacaciones'
;

-- Table vitalis_feriados

CREATE TABLE vitalis_feriados(
  fer_id Number NOT NULL,
  fer_fecha Date,
  fer_nombre Varchar2(30 ),
  fer_tipo Varchar2(30 ),
  fer_estado Char(1 )
        CONSTRAINT chk_fer_estado CHECK (activo IN ('A','I')),
  fer_version Number DEFAULT 1 NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_feriados

CREATE INDEX vitalis_feriados_ind01 ON vitalis_feriados (csa_id)
;

-- Add keys for table vitalis_feriados

ALTER TABLE vitalis_feriados ADD CONSTRAINT vitalis_feriados_pk PRIMARY KEY (fer_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_feriados.fer_fecha IS 'Fecha de feriado'
;
COMMENT ON COLUMN vitalis_feriados.fer_nombre IS 'Nombre del feriado'
;
COMMENT ON COLUMN vitalis_feriados.fer_tipo IS 'Tipo del feriado'
;
COMMENT ON COLUMN vitalis_feriados.fer_estado IS 'A=activo I=inactivo'
;
COMMENT ON COLUMN vitalis_feriados.fer_version IS 'Version de cuando del feriado'
;

-- Table vitalis_consultorios

CREATE TABLE vitalis_consultorios(
  con_id Number NOT NULL,
  con_codigo Number NOT NULL,
  con_nombre Varchar2(20 ) NOT NULL,
  con_capacidad Number NOT NULL,
  con_estado Char(1 ) NOT NULL
        CONSTRAINT chk_con_estado CHECK (activo IN ('A','I')),
  con_version Number DEFAULT 1 NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_consultorios

CREATE INDEX vitalis_consultorios_ind01 ON vitalis_consultorios (csa_id)
;

-- Add keys for table vitalis_consultorios

ALTER TABLE vitalis_consultorios ADD CONSTRAINT vitalis_consultorios_pk PRIMARY KEY (con_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_consultorios.con_codigo IS 'Codigo de consultorio'
;
COMMENT ON COLUMN vitalis_consultorios.con_nombre IS 'Nombre del consultorio
'
;
COMMENT ON COLUMN vitalis_consultorios.con_capacidad IS 'Capacidad de personas que puede atender'
;
COMMENT ON COLUMN vitalis_consultorios.con_estado IS 'A=activo I=Inactivo'
;

-- Table vitalis_facturas_detalle

CREATE TABLE vitalis_facturas_detalle(
  fad_id Number NOT NULL,
  fad_origen Varchar2(30 ) NOT NULL,
  fad_origen_id Number NOT NULL,
  fad_descripcion Varchar2(200 ),
  fad_cantidad Number NOT NULL,
  fad_precio_unit Number NOT NULL,
  fad_monto Number NOT NULL,
  fad_version Number DEFAULT 1 NOT NULL,
  fac_id Number
)
;

-- Create indexes for table vitalis_facturas_detalle

CREATE INDEX vitalis_facturas_detalle_ind01 ON vitalis_facturas_detalle (fac_id)
;

-- Add keys for table vitalis_facturas_detalle

ALTER TABLE vitalis_facturas_detalle ADD CONSTRAINT vitalis_facturas_detalle_pk PRIMARY KEY (fad_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_facturas_detalle.fad_origen IS 'De donde se genero la factura ejemplo clinica Santa Marta...'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_origen_id IS 'Id del origen de la factura'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_descripcion IS 'Descripcion de la factura sus detalles agregados'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_cantidad IS 'Cantidad de suministros en la factura'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_precio_unit IS 'Precio de unitario del coste de lo que se realizo
'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_monto IS 'Precio total 
'
;
COMMENT ON COLUMN vitalis_facturas_detalle.fad_version IS 'Version de la factura'
;

-- Table vitalis_facturas_centros

CREATE TABLE vitalis_facturas_centros(
  fac_id Number NOT NULL,
  fac_mes Number,
  fac_anio Number,
  fac_numero Number,
  fac_fecha Date,
  fac_subtotal Number,
  fac_impuestos Number,
  fac_total Number,
  fac_estado Char(20 ),
  fac_version Number NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_facturas_centros

CREATE INDEX vitalis_facturas_centros_ind01 ON vitalis_facturas_centros (csa_id)
;

-- Add keys for table vitalis_facturas_centros

ALTER TABLE vitalis_facturas_centros ADD CONSTRAINT vitalis_facturas_centros_pk PRIMARY KEY (fac_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_facturas_centros.fac_mes IS 'mes de la factura'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_anio IS 'año de la factura'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_numero IS 'numero de la factura'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_fecha IS 'Fecha de la factura dada'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_subtotal IS 'subtotal de la factura'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_impuestos IS 'Impuestos de la factura que fueron colocados
'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_total IS 'Total de la factura'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_estado IS ' (EMITIDA/PAGADA/ANULADA)'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_version IS 'Version del registro'
;

-- Table vitalis_autoregistros

CREATE TABLE vitalis_autoregistros(
  aur_id Number NOT NULL,
  aur_cedula Varchar2(12 ) NOT NULL,
  aur_nombre Varchar2(30 ) NOT NULL,
  aur_apellido1 Varchar2(10 ) NOT NULL,
  aur_apellido2 Varchar2(10 ) NOT NULL,
  aur_email Varchar2(20 ),
  aur_telefono Varchar2(10 ),
  aur_tipo_personal Char(1 )
        CONSTRAINT chk_aur_tipo_personal CHECK (activo IN ('M','A')),
  aur_fecha_nacimiento Date,
  aur_estado Char(1 )
        CONSTRAINT chk_aur_estado CHECK (activo IN ('P','A','R')),
  aur_fecha_registro Date,
  aur_fecha_revision Date,
  aur_usu_revisor Varchar2(20 ),
  aur_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_autoregistros

ALTER TABLE vitalis_autoregistros ADD CONSTRAINT vitalis_autoregistros_pk PRIMARY KEY (aur_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_autoregistros.aur_id IS 'ID único del autoregistro'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_cedula IS 'Cédula de identidad'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_nombre IS 'Primer nombre'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_apellido1 IS 'Apellidos de la persona que se autoregistra'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_apellido2 IS 'Apellido numero 2 del autoregistro
'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_email IS 'Email del autoregistro'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_telefono IS 'Telefeno del que realizo el autoregistro'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_tipo_personal IS 'M=medico, A=Administrativo'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_fecha_nacimiento IS 'Fecha de nacimiento'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_estado IS 'P=Pendiente, A=Aprobado, R=Rechazado'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_fecha_registro IS 'Fecha del registro'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_fecha_revision IS 'Fecha en que se realizo la revisión'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_usu_revisor IS 'Usuario que reviso el autoregistro para aprobarlo'
;

-- Table vitalis_autoregistros_documentos

CREATE TABLE vitalis_autoregistros_documentos(
  aud_id Number NOT NULL,
  aud_nombre_archivo Varchar2(20 ) NOT NULL,
  aud_ruta_archivo Varchar2(30 ),
  aud_fecha_carga Date,
  aud_estado Char(1 ) NOT NULL
        CONSTRAINT chk_aud_estado CHECK (activo IN ('A','I')),
  aud_version Number DEFAULT 1 NOT NULL,
  aur_id Number,
  tdo_id Number
)
;

-- Create indexes for table vitalis_autoregistros_documentos

CREATE INDEX vitalis_documentos_personas_ind01 ON vitalis_autoregistros_documentos (aur_id)
;

CREATE INDEX vitalis_documentos_personas_ind02 ON vitalis_autoregistros_documentos (tdo_id)
;

-- Add keys for table vitalis_autoregistros_documentos

ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT vitalis_autoregistros_documentos_pk PRIMARY KEY (aud_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_nombre_archivo IS 'Nombre que va a poseer el archivo'
;
COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_ruta_archivo IS 'Ruta donde se encuentra el autoregistro'
;
COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_fecha_carga IS 'Fecha de registro'
;
COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_estado IS 'Estado (A=Activo, I=Inactivo)'
;
COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_version IS 'Version del registro'
;

-- Table vitalis_plantillas_notificacion

CREATE TABLE vitalis_plantillas_notificacion(
  pln_id Number NOT NULL,
  pln_codigo Number,
  pln_nombre Varchar2(30 ),
  pln_asunto Varchar2(500 ),
  pln_cuerpo Varchar2(2000 ),
  pln_tipo Varchar2(30 ),
  pln_estado Char(1 )
        CONSTRAINT chk_pln_estado CHECK (activo IN ('A','I')),
  pln_fecha_creacion Date,
  pln_version Number DEFAULT 1
)
;

-- Add keys for table vitalis_plantillas_notificacion

ALTER TABLE vitalis_plantillas_notificacion ADD CONSTRAINT vitalis_plantillas_notificacion_pk PRIMARY KEY (pln_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_codigo IS 'Codigo de la notificacion'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_nombre IS 'Nombre de la notificacion'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_asunto IS 'Descripcion o asunto de la notificacion dada
'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_cuerpo IS 'El HTML de las notificaciones'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_tipo IS 'Tipo de la notificacion si es general o etc'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_estado IS 'A=activa I=Inactiva'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_fecha_creacion IS 'Fecha de creacion de la plantilla'
;
COMMENT ON COLUMN vitalis_plantillas_notificacion.pln_version IS 'Version de la plantilla'
;

-- Table vitalis_tarifas_historial

CREATE TABLE vitalis_tarifas_historial(
  tah_id Number NOT NULL,
  tah_contexto Varchar2(30 ),
  tah_monto_cobrar Number,
  tah_monto_pagar Number,
  tah_vig_desde Date,
  tah_vig_hasta Date,
  tah_estado Char(1 )
        CONSTRAINT chk_tah_estado CHECK (activo IN ('A','I')),
  tah_fecha_registro Date,
  tah_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_tarifas_historial

ALTER TABLE vitalis_tarifas_historial ADD CONSTRAINT vitalis_tarifas_historial_pk PRIMARY KEY (tah_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_tarifas_historial.tah_monto_cobrar IS 'Monto a cobrar de la tarifa
'
;
COMMENT ON COLUMN vitalis_tarifas_historial.tah_monto_pagar IS 'Monto a pagar de la tarifa'
;
COMMENT ON COLUMN vitalis_tarifas_historial.tah_vig_desde IS 'Vigente desde que se inicio'
;
COMMENT ON COLUMN vitalis_tarifas_historial.tah_vig_hasta IS 'Vigente hasta fin de la tarifa'
;
COMMENT ON COLUMN vitalis_tarifas_historial.tah_estado IS 'A=activo I=Inactivo'
;
COMMENT ON COLUMN vitalis_tarifas_historial.tah_fecha_registro IS 'Fecha de registro de la tarifa'
;

-- Trigger for sequence vitalis_paises_seq01 for column pai_id in table vitalis_paises ---------
CREATE OR REPLACE TRIGGER ts_vitalis_paises_vitalis_paises_seq01 BEFORE INSERT
ON vitalis_paises FOR EACH ROW
BEGIN
  :new.pai_id := vitalis_paises_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_paises_vitalis_paises_seq01 AFTER UPDATE OF pai_id
ON vitalis_paises FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pai_id in table vitalis_paises as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_provincias_seq01 for column pro_id in table vitalis_provincia ---------
CREATE OR REPLACE TRIGGER ts_vitalis_provincia_vitalis_provincias_seq01 BEFORE INSERT
ON vitalis_provincia FOR EACH ROW
BEGIN
  :new.pro_id := vitalis_provincias_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_provincia_vitalis_provincias_seq01 AFTER UPDATE OF pro_id
ON vitalis_provincia FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pro_id in table vitalis_provincia as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_cantones_seq01 for column can_id in table vitalis_cantones ---------
CREATE OR REPLACE TRIGGER ts_vitalis_cantones_vitalis_cantones_seq01 BEFORE INSERT
ON vitalis_cantones FOR EACH ROW
BEGIN
  :new.can_id := vitalis_cantones_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_cantones_vitalis_cantones_seq01 AFTER UPDATE OF can_id
ON vitalis_cantones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column can_id in table vitalis_cantones as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_distritos_seq01 for column dis_id in table vitalis_distritos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_distritos_vitalis_distritos_seq01 BEFORE INSERT
ON vitalis_distritos FOR EACH ROW
BEGIN
  :new.dis_id := vitalis_distritos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_distritos_vitalis_distritos_seq01 AFTER UPDATE OF dis_id
ON vitalis_distritos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column dis_id in table vitalis_distritos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tipos_documentos_seq01 for column tdo_id in table vitalis_tipos_documentos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tipos_documentos_vitalis_tipos_documentos_seq01 BEFORE INSERT
ON vitalis_tipos_documentos FOR EACH ROW
BEGIN
  :new.tdo_id := vitalis_tipos_documentos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tipos_documentos_vitalis_tipos_documentos_seq01 AFTER UPDATE OF tdo_id
ON vitalis_tipos_documentos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tdo_id in table vitalis_tipos_documentos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_bancos_seq01 for column ban_id in table vitalis_bancos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_bancos_vitalis_bancos_seq01 BEFORE INSERT
ON vitalis_bancos FOR EACH ROW
BEGIN
  :new.ban_id := vitalis_bancos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_bancos_vitalis_bancos_seq01 AFTER UPDATE OF ban_id
ON vitalis_bancos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ban_id in table vitalis_bancos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tipos_cuenta_seq01 for column tcu_id in table vitalis_tipos_cuenta ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tipos_cuenta_vitalis_tipos_cuenta_seq01 BEFORE INSERT
ON vitalis_tipos_cuenta FOR EACH ROW
BEGIN
  :new.tcu_id := vitalis_tipos_cuenta_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tipos_cuenta_vitalis_tipos_cuenta_seq01 AFTER UPDATE OF tcu_id
ON vitalis_tipos_cuenta FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tcu_id in table vitalis_tipos_cuenta as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_personas_seq01 for column per_id in table vitalis_personas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_personas_vitalis_personas_seq01 BEFORE INSERT
ON vitalis_personas FOR EACH ROW
BEGIN
  :new.per_id := vitalis_personas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_personas_vitalis_personas_seq01 AFTER UPDATE OF per_id
ON vitalis_personas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column per_id in table vitalis_personas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_direcciones_seq01 for column dpe_id in table vitalis_direcciones_personas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_direcciones_personas_vitalis_direcciones_seq01 BEFORE INSERT
ON vitalis_direcciones_personas FOR EACH ROW
BEGIN
  :new.dpe_id := vitalis_direcciones_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_direcciones_personas_vitalis_direcciones_seq01 AFTER UPDATE OF dpe_id
ON vitalis_direcciones_personas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column dpe_id in table vitalis_direcciones_personas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_telefonos_personas_seq01 for column tpe_id in table vitalis_telefonos_personas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_telefonos_personas_vitalis_telefonos_personas_seq01 BEFORE INSERT
ON vitalis_telefonos_personas FOR EACH ROW
BEGIN
  :new.tpe_id := vitalis_telefonos_personas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_telefonos_personas_vitalis_telefonos_personas_seq01 AFTER UPDATE OF tpe_id
ON vitalis_telefonos_personas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpe_id in table vitalis_telefonos_personas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_cuentas_bancarias_seq01 for column cba_id in table vitalis_cuentas_bancarias ---------
CREATE OR REPLACE TRIGGER ts_vitalis_cuentas_bancarias_vitalis_cuentas_bancarias_seq01 BEFORE INSERT
ON vitalis_cuentas_bancarias FOR EACH ROW
BEGIN
  :new.cba_id := vitalis_cuentas_bancarias_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_cuentas_bancarias_vitalis_cuentas_bancarias_seq01 AFTER UPDATE OF cba_id
ON vitalis_cuentas_bancarias FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column cba_id in table vitalis_cuentas_bancarias as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_documentos_personas_seq01 for column dop_id in table vitalis_documentos_personas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_documentos_personas_vitalis_documentos_personas_seq01 BEFORE INSERT
ON vitalis_documentos_personas FOR EACH ROW
BEGIN
  :new.dop_id := vitalis_documentos_personas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_documentos_personas_vitalis_documentos_personas_seq01 AFTER UPDATE OF dop_id
ON vitalis_documentos_personas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column dop_id in table vitalis_documentos_personas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_perfiles_seq01 for column prf_id in table vitalis_perfiles ---------
CREATE OR REPLACE TRIGGER ts_vitalis_perfiles_vitalis_perfiles_seq01 BEFORE INSERT
ON vitalis_perfiles FOR EACH ROW
BEGIN
  :new.prf_id := vitalis_perfiles_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_perfiles_vitalis_perfiles_seq01 AFTER UPDATE OF prf_id
ON vitalis_perfiles FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column prf_id in table vitalis_perfiles as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_pantallas_seq01 for column pan_id in table vitalis_pantallas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_pantallas_vitalis_pantallas_seq01 BEFORE INSERT
ON vitalis_pantallas FOR EACH ROW
BEGIN
  :new.pan_id := vitalis_pantallas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_pantallas_vitalis_pantallas_seq01 AFTER UPDATE OF pan_id
ON vitalis_pantallas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pan_id in table vitalis_pantallas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_usuarios_seq01 for column usu_id in table vitalis_usuarios ---------
CREATE OR REPLACE TRIGGER ts_vitalis_usuarios_vitalis_usuarios_seq01 BEFORE INSERT
ON vitalis_usuarios FOR EACH ROW
BEGIN
  :new.usu_id := vitalis_usuarios_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_usuarios_vitalis_usuarios_seq01 AFTER UPDATE OF usu_id
ON vitalis_usuarios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column usu_id in table vitalis_usuarios as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_centros_salud_seq01 for column csa_id in table vitalis_centros_salud ---------
CREATE OR REPLACE TRIGGER ts_vitalis_centros_salud_vitalis_centros_salud_seq01 BEFORE INSERT
ON vitalis_centros_salud FOR EACH ROW
BEGIN
  :new.csa_id := vitalis_centros_salud_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_centros_salud_vitalis_centros_salud_seq01 AFTER UPDATE OF csa_id
ON vitalis_centros_salud FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column csa_id in table vitalis_centros_salud as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_puestos_seq01 for column pue_id in table vitalis_puestos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_puestos_vitalis_puestos_seq01 BEFORE INSERT
ON vitalis_puestos FOR EACH ROW
BEGIN
  :new.pue_id := vitalis_puestos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_puestos_vitalis_puestos_seq01 AFTER UPDATE OF pue_id
ON vitalis_puestos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pue_id in table vitalis_puestos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_turnos_seq01 for column tur_id in table vitalis_turnos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_turnos_vitalis_turnos_seq01 BEFORE INSERT
ON vitalis_turnos FOR EACH ROW
BEGIN
  :new.tur_id := vitalis_turnos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_turnos_vitalis_turnos_seq01 AFTER UPDATE OF tur_id
ON vitalis_turnos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tur_id in table vitalis_turnos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tipos_procedimientos_seq01 for column tpr_id in table vitalis_tipos_procedimientos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tipos_procedimientos_vitalis_tipos_procedimientos_seq01 BEFORE INSERT
ON vitalis_tipos_procedimientos FOR EACH ROW
BEGIN
  :new.tpr_id := vitalis_tipos_procedimientos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tipos_procedimientos_vitalis_tipos_procedimientos_seq01 AFTER UPDATE OF tpr_id
ON vitalis_tipos_procedimientos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpr_id in table vitalis_tipos_procedimientos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_procedimientos_medicos_seq01 for column prm_id in table vitalis_procedimientos_medicos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_procedimientos_medicos_vitalis_procedimientos_medicos_seq01 BEFORE INSERT
ON vitalis_procedimientos_medicos FOR EACH ROW
BEGIN
  :new.prm_id := vitalis_procedimientos_medicos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_procedimientos_medicos_vitalis_procedimientos_medicos_seq01 AFTER UPDATE OF prm_id
ON vitalis_procedimientos_medicos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column prm_id in table vitalis_procedimientos_medicos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_escalas_base_seq01 for column esb_id in table vitalis_escalas_base ---------
CREATE OR REPLACE TRIGGER ts_vitalis_escalas_base_vitalis_escalas_base_seq01 BEFORE INSERT
ON vitalis_escalas_base FOR EACH ROW
BEGIN
  :new.esb_id := vitalis_escalas_base_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_escalas_base_vitalis_escalas_base_seq01 AFTER UPDATE OF esb_id
ON vitalis_escalas_base FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column esb_id in table vitalis_escalas_base as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_escalas_base_detalle_seq01 for column esd_id in table vitalis_escalas_base_detalle ---------
CREATE OR REPLACE TRIGGER ts_vitalis_escalas_base_detalle_vitalis_escalas_base_detalle_seq01 BEFORE INSERT
ON vitalis_escalas_base_detalle FOR EACH ROW
BEGIN
  :new.esd_id := vitalis_escalas_base_detalle_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_escalas_base_detalle_vitalis_escalas_base_detalle_seq01 AFTER UPDATE OF esd_id
ON vitalis_escalas_base_detalle FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column esd_id in table vitalis_escalas_base_detalle as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_escalas_mensuales_seq01 for column esm_id in table vitalis_escalas_mensuales ---------
CREATE OR REPLACE TRIGGER ts_vitalis_escalas_mensuales_vitalis_escalas_mensuales_seq01 BEFORE INSERT
ON vitalis_escalas_mensuales FOR EACH ROW
BEGIN
  :new.esm_id := vitalis_escalas_mensuales_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_escalas_mensuales_vitalis_escalas_mensuales_seq01 AFTER UPDATE OF esm_id
ON vitalis_escalas_mensuales FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column esm_id in table vitalis_escalas_mensuales as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_escalas_mensuales_detalle_seq01 for column emd_id in table vitalis_escalas_mensuales_detalle ---------
CREATE OR REPLACE TRIGGER ts_vitalis_escalas_mensuales_detalle_vitalis_escalas_mensuales_detalle_seq01 BEFORE INSERT
ON vitalis_escalas_mensuales_detalle FOR EACH ROW
BEGIN
  :new.emd_id := vitalis_escalas_mensuales_detalle_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_escalas_mensuales_detalle_vitalis_escalas_mensuales_detalle_seq01 AFTER UPDATE OF emd_id
ON vitalis_escalas_mensuales_detalle FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column emd_id in table vitalis_escalas_mensuales_detalle as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tipos_planillas_seq01 for column tpl_id in table vitalis_tipos_planillas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tipos_planillas_vitalis_tipos_planillas_seq01 BEFORE INSERT
ON vitalis_tipos_planillas FOR EACH ROW
BEGIN
  :new.tpl_id := vitalis_tipos_planillas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tipos_planillas_vitalis_tipos_planillas_seq01 AFTER UPDATE OF tpl_id
ON vitalis_tipos_planillas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tpl_id in table vitalis_tipos_planillas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tipos_movimientos_seq01 for column tmo_id in table vitalis_tipos_movimientos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tipos_movimientos_vitalis_tipos_movimientos_seq01 BEFORE INSERT
ON vitalis_tipos_movimientos FOR EACH ROW
BEGIN
  :new.tmo_id := vitalis_tipos_movimientos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tipos_movimientos_vitalis_tipos_movimientos_seq01 AFTER UPDATE OF tmo_id
ON vitalis_tipos_movimientos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tmo_id in table vitalis_tipos_movimientos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_planillas_seq01 for column pla_id in table vitalis_planillas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_planillas_vitalis_planillas_seq01 BEFORE INSERT
ON vitalis_planillas FOR EACH ROW
BEGIN
  :new.pla_id := vitalis_planillas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_planillas_vitalis_planillas_seq01 AFTER UPDATE OF pla_id
ON vitalis_planillas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pla_id in table vitalis_planillas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_planillas_detalle_seq01 for column pld_id in table vitalis_planillas_detalle ---------
CREATE OR REPLACE TRIGGER ts_vitalis_planillas_detalle_vitalis_planillas_detalle_seq01 BEFORE INSERT
ON vitalis_planillas_detalle FOR EACH ROW
BEGIN
  :new.pld_id := vitalis_planillas_detalle_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_planillas_detalle_vitalis_planillas_detalle_seq01 AFTER UPDATE OF pld_id
ON vitalis_planillas_detalle FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pld_id in table vitalis_planillas_detalle as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_planillas_movimientos_seq01 for column plm_id in table vitalis_planillas_movimientos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_planillas_movimientos_vitalis_planillas_movimientos_seq01 BEFORE INSERT
ON vitalis_planillas_movimientos FOR EACH ROW
BEGIN
  :new.plm_id := vitalis_planillas_movimientos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_planillas_movimientos_vitalis_planillas_movimientos_seq01 AFTER UPDATE OF plm_id
ON vitalis_planillas_movimientos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column plm_id in table vitalis_planillas_movimientos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_resumen_financiero_seq01 for column ref_id in table vitalis_resumen_financiero ---------
CREATE OR REPLACE TRIGGER ts_vitalis_resumen_financiero_vitalis_resumen_financiero_seq01 BEFORE INSERT
ON vitalis_resumen_financiero FOR EACH ROW
BEGIN
  :new.ref_id := vitalis_resumen_financiero_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_resumen_financiero_vitalis_resumen_financiero_seq01 AFTER UPDATE OF ref_id
ON vitalis_resumen_financiero FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ref_id in table vitalis_resumen_financiero as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_parametros_seq01 for column par_id in table vitalis_parametros ---------
CREATE OR REPLACE TRIGGER ts_vitalis_parametros_vitalis_parametros_seq01 BEFORE INSERT
ON vitalis_parametros FOR EACH ROW
BEGIN
  :new.par_id := vitalis_parametros_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_parametros_vitalis_parametros_seq01 AFTER UPDATE OF par_id
ON vitalis_parametros FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column par_id in table vitalis_parametros as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_bitacoras_seq01 for column bit_id in table vitalis_bitacoras ---------
CREATE OR REPLACE TRIGGER ts_vitalis_bitacoras_vitalis_bitacoras_seq01 BEFORE INSERT
ON vitalis_bitacoras FOR EACH ROW
BEGIN
  :new.bit_id := vitalis_bitacoras_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_bitacoras_vitalis_bitacoras_seq01 AFTER UPDATE OF bit_id
ON vitalis_bitacoras FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column bit_id in table vitalis_bitacoras as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_padron_nacional_seq01 for column pad_id in table vitalis_padron_nacional ---------
CREATE OR REPLACE TRIGGER ts_vitalis_padron_nacional_vitalis_padron_nacional_seq01 BEFORE INSERT
ON vitalis_padron_nacional FOR EACH ROW
BEGIN
  :new.pad_id := vitalis_padron_nacional_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_padron_nacional_vitalis_padron_nacional_seq01 AFTER UPDATE OF pad_id
ON vitalis_padron_nacional FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pad_id in table vitalis_padron_nacional as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_puestos_turno_seq01 for column put_id in table vitalis_puestos_turnos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_puestos_turnos_vitalis_puestos_turno_seq01 BEFORE INSERT
ON vitalis_puestos_turnos FOR EACH ROW
BEGIN
  :new.put_id := vitalis_puestos_turno_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_puestos_turnos_vitalis_puestos_turno_seq01 AFTER UPDATE OF put_id
ON vitalis_puestos_turnos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column put_id in table vitalis_puestos_turnos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_perfiles_pantallas_seq01 for column prp_id in table vitalis_perfiles_pantallas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_perfiles_pantallas_vitalis_perfiles_pantallas_seq01 BEFORE INSERT
ON vitalis_perfiles_pantallas FOR EACH ROW
BEGIN
  :new.prp_id := vitalis_perfiles_pantallas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_perfiles_pantallas_vitalis_perfiles_pantallas_seq01 AFTER UPDATE OF prp_id
ON vitalis_perfiles_pantallas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column prp_id in table vitalis_perfiles_pantallas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_personal_tipos_planillas_seq01 for column ptp_id in table vitalis_personal_tipos_planillas ---------
CREATE OR REPLACE TRIGGER ts_vitalis_personal_tipos_planillas_vitalis_personal_tipos_planillas_seq01 BEFORE INSERT
ON vitalis_personal_tipos_planillas FOR EACH ROW
BEGIN
  :new.ptp_id := vitalis_personal_tipos_planillas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_personal_tipos_planillas_vitalis_personal_tipos_planillas_seq01 AFTER UPDATE OF ptp_id
ON vitalis_personal_tipos_planillas FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ptp_id in table vitalis_personal_tipos_planillas as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_estados_seq01 for column est_id in table vitalis_estados ---------
CREATE OR REPLACE TRIGGER ts_vitalis_estados_vitalis_estados_seq01 BEFORE INSERT
ON vitalis_estados FOR EACH ROW
BEGIN
  :new.est_id := vitalis_estados_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_estados_vitalis_estados_seq01 AFTER UPDATE OF est_id
ON vitalis_estados FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column est_id in table vitalis_estados as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_identificacion_seq01 for column ide_id in table vitalis_identificacion ---------
CREATE OR REPLACE TRIGGER ts_vitalis_identificacion_vitalis_identificacion_seq01 BEFORE INSERT
ON vitalis_identificacion FOR EACH ROW
BEGIN
  :new.ide_id := vitalis_identificacion_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_identificacion_vitalis_identificacion_seq01 AFTER UPDATE OF ide_id
ON vitalis_identificacion FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ide_id in table vitalis_identificacion as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_notificaciones_seq01 for column not_id in table vitalis_notificaciones ---------
CREATE OR REPLACE TRIGGER ts_vitalis_notificaciones_vitalis_notificaciones_seq01 BEFORE INSERT
ON vitalis_notificaciones FOR EACH ROW
BEGIN
  :new.not_id := vitalis_notificaciones_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_notificaciones_vitalis_notificaciones_seq01 AFTER UPDATE OF not_id
ON vitalis_notificaciones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column not_id in table vitalis_notificaciones as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_contratos_seq01 for column ctr_id in table vitalis_contratos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_contratos_vitalis_contratos_seq01 BEFORE INSERT
ON vitalis_contratos FOR EACH ROW
BEGIN
  :new.ctr_id := vitalis_contratos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_contratos_vitalis_contratos_seq01 AFTER UPDATE OF ctr_id
ON vitalis_contratos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column ctr_id in table vitalis_contratos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_incapacidades_seq01 for column inc_id in table vitalis_incapacidades ---------
CREATE OR REPLACE TRIGGER ts_vitalis_incapacidades_vitalis_incapacidades_seq01 BEFORE INSERT
ON vitalis_incapacidades FOR EACH ROW
BEGIN
  :new.inc_id := vitalis_incapacidades_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_incapacidades_vitalis_incapacidades_seq01 AFTER UPDATE OF inc_id
ON vitalis_incapacidades FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column inc_id in table vitalis_incapacidades as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_vacaciones_seq01 for column vac_id in table vitalis_vacaciones ---------
CREATE OR REPLACE TRIGGER ts_vitalis_vacaciones_vitalis_vacaciones_seq01 BEFORE INSERT
ON vitalis_vacaciones FOR EACH ROW
BEGIN
  :new.vac_id := vitalis_vacaciones_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_vacaciones_vitalis_vacaciones_seq01 AFTER UPDATE OF vac_id
ON vitalis_vacaciones FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column vac_id in table vitalis_vacaciones as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_feriados_seq01 for column fer_id in table vitalis_feriados ---------
CREATE OR REPLACE TRIGGER ts_vitalis_feriados_vitalis_feriados_seq01 BEFORE INSERT
ON vitalis_feriados FOR EACH ROW
BEGIN
  :new.fer_id := vitalis_feriados_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_feriados_vitalis_feriados_seq01 AFTER UPDATE OF fer_id
ON vitalis_feriados FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column fer_id in table vitalis_feriados as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_consultorios_seq01 for column con_id in table vitalis_consultorios ---------
CREATE OR REPLACE TRIGGER ts_vitalis_consultorios_vitalis_consultorios_seq01 BEFORE INSERT
ON vitalis_consultorios FOR EACH ROW
BEGIN
  :new.con_id := vitalis_consultorios_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_consultorios_vitalis_consultorios_seq01 AFTER UPDATE OF con_id
ON vitalis_consultorios FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column con_id in table vitalis_consultorios as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_facturas_detalle_seq01 for column fad_id in table vitalis_facturas_detalle ---------
CREATE OR REPLACE TRIGGER ts_vitalis_facturas_detalle_vitalis_facturas_detalle_seq01 BEFORE INSERT
ON vitalis_facturas_detalle FOR EACH ROW
BEGIN
  :new.fad_id := vitalis_facturas_detalle_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_facturas_detalle_vitalis_facturas_detalle_seq01 AFTER UPDATE OF fad_id
ON vitalis_facturas_detalle FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column fad_id in table vitalis_facturas_detalle as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_facturas_seq01 for column fac_id in table vitalis_facturas_centros ---------
CREATE OR REPLACE TRIGGER ts_vitalis_facturas_centros_vitalis_facturas_seq01 BEFORE INSERT
ON vitalis_facturas_centros FOR EACH ROW
BEGIN
  :new.fac_id := vitalis_facturas_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_facturas_centros_vitalis_facturas_seq01 AFTER UPDATE OF fac_id
ON vitalis_facturas_centros FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column fac_id in table vitalis_facturas_centros as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_autoregistros_seq01 for column aur_id in table vitalis_autoregistros ---------
CREATE OR REPLACE TRIGGER ts_vitalis_autoregistros_vitalis_autoregistros_seq01 BEFORE INSERT
ON vitalis_autoregistros FOR EACH ROW
BEGIN
  :new.aur_id := vitalis_autoregistros_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_autoregistros_vitalis_autoregistros_seq01 AFTER UPDATE OF aur_id
ON vitalis_autoregistros FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column aur_id in table vitalis_autoregistros as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_autoregistros_documentos_seq01 for column aud_id in table vitalis_autoregistros_documentos ---------
CREATE OR REPLACE TRIGGER ts_vitalis_autoregistros_documentos_vitalis_autoregistros_documentos_seq01 BEFORE INSERT
ON vitalis_autoregistros_documentos FOR EACH ROW
BEGIN
  :new.aud_id := vitalis_autoregistros_documentos_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_autoregistros_documentos_vitalis_autoregistros_documentos_seq01 AFTER UPDATE OF aud_id
ON vitalis_autoregistros_documentos FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column aud_id in table vitalis_autoregistros_documentos as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_planillas_notificaciones_seq01 for column pln_id in table vitalis_plantillas_notificacion ---------
CREATE OR REPLACE TRIGGER ts_vitalis_plantillas_notificacion_vitalis_planillas_notificaciones_seq01 BEFORE INSERT
ON vitalis_plantillas_notificacion FOR EACH ROW
BEGIN
  :new.pln_id := vitalis_planillas_notificaciones_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_plantillas_notificacion_vitalis_planillas_notificaciones_seq01 AFTER UPDATE OF pln_id
ON vitalis_plantillas_notificacion FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column pln_id in table vitalis_plantillas_notificacion as it uses sequence.');
END;
;

-- Trigger for sequence vitalis_tarifas_historial_seq01 for column tah_id in table vitalis_tarifas_historial ---------
CREATE OR REPLACE TRIGGER ts_vitalis_tarifas_historial_vitalis_tarifas_historial_seq01 BEFORE INSERT
ON vitalis_tarifas_historial FOR EACH ROW
BEGIN
  :new.tah_id := vitalis_tarifas_historial_seq01.nextval;
END;
;
CREATE OR REPLACE TRIGGER tsu_vitalis_tarifas_historial_vitalis_tarifas_historial_seq01 AFTER UPDATE OF tah_id
ON vitalis_tarifas_historial FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column tah_id in table vitalis_tarifas_historial as it uses sequence.');
END;
;


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE vitalis_provincia ADD CONSTRAINT vitalis_pasisesprovincia_fk01 FOREIGN KEY (pai_id) REFERENCES vitalis_paises (pai_id)
;



ALTER TABLE vitalis_cantones ADD CONSTRAINT vitalis_provinciacantones_fk01 FOREIGN KEY (pro_id) REFERENCES vitalis_provincia (pro_id)
;



ALTER TABLE vitalis_distritos ADD CONSTRAINT vitalis_cantonesdistritos_fk01 FOREIGN KEY (can_id) REFERENCES vitalis_cantones (can_id)
;



ALTER TABLE vitalis_direcciones_personas ADD CONSTRAINT vitalis_personasdireccionesper_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_telefonos_personas ADD CONSTRAINT vitalis_personastelefonos_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_personascuentabancaria_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_documentos_personas ADD CONSTRAINT vitalis_personasdocumentospersona_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_usuarios ADD CONSTRAINT vitalis_personasusuario_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_puestos ADD CONSTRAINT vitalis_centrossaludpuestos_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_base ADD CONSTRAINT vitalis_centrossaludescalabase_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT vitalis_escalasbaseescalasmensuales_fk01 FOREIGN KEY (esb_id) REFERENCES vitalis_escalas_base (esb_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_escalasmensualesescalasmensualesdetalle_fk01 FOREIGN KEY (esm_id) REFERENCES vitalis_escalas_mensuales (esm_id)
;



ALTER TABLE vitalis_planillas ADD CONSTRAINT vitalis_tiposplanillasplanillas_fk01 FOREIGN KEY (tpl_id) REFERENCES vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT vitalis_planillasplanillasdetalle_fk01 FOREIGN KEY (pla_id) REFERENCES vitalis_planillas (pla_id)
;



ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT vitalis_puestospuestosturnos_fk01 FOREIGN KEY (pue_id) REFERENCES vitalis_puestos (pue_id)
;



ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT vitalis_turnospuestosturnos_fk01 FOREIGN KEY (tur_id) REFERENCES vitalis_turnos (tur_id)
;



ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_pantallasperfilespantallas_fk01 FOREIGN KEY (pan_id) REFERENCES vitalis_pantallas (pan_id)
;



ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_perfilesperfilespantalla_fk01 FOREIGN KEY (prf_id) REFERENCES vitalis_perfiles (prf_id)
;



ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_personaspersonaltiposplanilla_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT vitalis_tiposplanillaspersonaltiposplanillas_fk01 FOREIGN KEY (tpl_id) REFERENCES vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE vitalis_centros_salud ADD CONSTRAINT vitalis_distritoscentrossalud_fk01 FOREIGN KEY (dis_id) REFERENCES vitalis_distritos (dis_id)
;



ALTER TABLE vitalis_direcciones_personas ADD CONSTRAINT vitalis_distritosdireccionesper_fk01 FOREIGN KEY (dis_id) REFERENCES vitalis_distritos (dis_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_bancoscuentasbancarias_fk01 FOREIGN KEY (ban_id) REFERENCES vitalis_bancos (ban_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT vitalis_tiposcuentacuentasbancarias_fk01 FOREIGN KEY (tcu_id) REFERENCES vitalis_tipos_cuenta (tcu_id)
;



ALTER TABLE vitalis_documentos_personas ADD CONSTRAINT vitalis_tiposdocumentosdocumentospersonas_fk01 FOREIGN KEY (tdo_id) REFERENCES vitalis_tipos_documentos (tdo_id)
;



ALTER TABLE vitalis_usuarios ADD CONSTRAINT vitalis_perfilesusuarios_fk01 FOREIGN KEY (prf_id) REFERENCES vitalis_perfiles (prf_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT vitalis_personasescalasbasedetalle_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_personasescalasmensualesdetalle_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_personasprocedimientosmedicos_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_tiposprocedimientosprocedimientosmedicos_fk01 FOREIGN KEY (tpr_id) REFERENCES vitalis_tipos_procedimientos (tpr_id)
;



ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT vitalis_tiposmovimientosplanillasmovimientos_fk01 FOREIGN KEY (tmo_id) REFERENCES vitalis_tipos_movimientos (tmo_id)
;



ALTER TABLE vitalis_tipos_documentos ADD CONSTRAINT vitalis_estadostiposdocumentos_fk01 FOREIGN KEY (est_id) REFERENCES vitalis_estados (est_id)
;



ALTER TABLE vitalis_perfiles ADD CONSTRAINT vitalis_estadosperfiles_fk01 FOREIGN KEY (est_id) REFERENCES vitalis_estados (est_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_centrossaludprocedimientosmedicos_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT vitalis_escalasbaseescalasbasedetalle_fk01 FOREIGN KEY (esb_id) REFERENCES vitalis_escalas_base (esb_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT vitalis_puestosturnosescalasbasedetalle_fk01 FOREIGN KEY (put_id) REFERENCES vitalis_puestos_turnos (put_id)
;



ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT vitalis_centrossaludescalasmensuales_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_puestosturnosescalasmensualesdetalle_fk01 FOREIGN KEY (put_id) REFERENCES vitalis_puestos_turnos (put_id)
;



ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT vitalis_personasplanillasdetalle_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT vitalis_planillasdetalleplanillasmovimientos_fk01 FOREIGN KEY (pld_id) REFERENCES vitalis_planillas_detalle (pld_id)
;



ALTER TABLE vitalis_resumen_financiero ADD CONSTRAINT vitalis_centrossaludresumenfinanciero_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_identificacion ADD CONSTRAINT vitalis_personasidentificacion_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_contratos ADD CONSTRAINT vitalis_personascontratos_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_incapacidades ADD CONSTRAINT vitalis_personasincapacidades_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_consultorios ADD CONSTRAINT vitalis_centrossaludconsultorios_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_facturas_centros ADD CONSTRAINT vitalis_centrossaludfacturascentros_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_facturas_detalle ADD CONSTRAINT vitalis_facturasdetallefacturascentro_fk01 FOREIGN KEY (fac_id) REFERENCES vitalis_facturas_centros (fac_id)
;



ALTER TABLE vitalis_vacaciones ADD CONSTRAINT vitalis_personasvaciones_fk01 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT vitalis_autoregistrosautorregistrosdocumentos_fk01 FOREIGN KEY (aur_id) REFERENCES vitalis_autoregistros (aur_id)
;



ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT vitalis_tiposdocumentosautoregistrosdocumentos_fk01 FOREIGN KEY (tdo_id) REFERENCES vitalis_tipos_documentos (tdo_id)
;



ALTER TABLE vitalis_feriados ADD CONSTRAINT vitalis_centrossaludferiados_fk01 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_notificaciones ADD CONSTRAINT vitalis_planillasnotificacionnotificaciones_fk01 FOREIGN KEY (pln_id) REFERENCES vitalis_plantillas_notificacion (pln_id)
;



ALTER TABLE vitalis_bitacoras ADD CONSTRAINT vitalis_usuariosbitacoras_fk01 FOREIGN KEY (usu_id) REFERENCES vitalis_usuarios (usu_id)
;





