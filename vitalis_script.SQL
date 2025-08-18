/*
Created: 16/8/2025
Modified: 17/8/2025
Model: Vitalis
Database: Oracle 19c
*/


-- Drop relationships section -------------------------------------------------

ALTER TABLE vitalis_bitacoras DROP CONSTRAINT Relationship63
;
ALTER TABLE vitalis_notificaciones DROP CONSTRAINT Relationship62
;
ALTER TABLE vitalis_feriados DROP CONSTRAINT Relationship60
;
ALTER TABLE vitalis_monitor_eventos DROP CONSTRAINT Relationship59
;
ALTER TABLE vitalis_jobs_ejecuciones DROP CONSTRAINT Relationship58
;
ALTER TABLE vitalis_autoregistros_documentos DROP CONSTRAINT Relationship57
;
ALTER TABLE vitalis_autoregistros_documentos DROP CONSTRAINT Relationship56
;
ALTER TABLE vitalis_vacaciones DROP CONSTRAINT Relationship55
;
ALTER TABLE vitalis_facturas_detalle DROP CONSTRAINT Relationship54
;
ALTER TABLE vitalis_facturas_centros DROP CONSTRAINT Relationship53
;
ALTER TABLE vitalis_consultorios DROP CONSTRAINT Relationship52
;
ALTER TABLE vitalis_incapacidades DROP CONSTRAINT Relationship50
;
ALTER TABLE vitalis_contratos DROP CONSTRAINT Relationship49
;
ALTER TABLE vitalis_identificacion DROP CONSTRAINT Relationship48
;
ALTER TABLE vitalis_resumen_financiero DROP CONSTRAINT Relationship47
;
ALTER TABLE vitalis_planillas_movimientos DROP CONSTRAINT Relationship46
;
ALTER TABLE vitalis_planillas_detalle DROP CONSTRAINT Relationship45
;
ALTER TABLE vitalis_escalas_mensuales_detalle DROP CONSTRAINT Relationship44
;
ALTER TABLE vitalis_escalas_mensuales DROP CONSTRAINT Relationship43
;
ALTER TABLE vitalis_escalas_base_detalle DROP CONSTRAINT Relationship42
;
ALTER TABLE vitalis_escalas_base_detalle DROP CONSTRAINT Relationship41
;
ALTER TABLE vitalis_procedimientos_medicos DROP CONSTRAINT Relationship40
;
ALTER TABLE vitalis_perfiles DROP CONSTRAINT Relationship38
;
ALTER TABLE vitalis_tipos_documentos DROP CONSTRAINT Relationship37
;
ALTER TABLE vitalis_planillas_movimientos DROP CONSTRAINT Relationship36
;
ALTER TABLE vitalis_procedimientos_medicos DROP CONSTRAINT Relationship34
;
ALTER TABLE vitalis_procedimientos_medicos DROP CONSTRAINT Relationship33
;
ALTER TABLE vitalis_escalas_mensuales_detalle DROP CONSTRAINT Relationship32
;
ALTER TABLE vitalis_escalas_base_detalle DROP CONSTRAINT Relationship29
;
ALTER TABLE vitalis_usuarios DROP CONSTRAINT Relationship27
;
ALTER TABLE vitalis_documentos_personas DROP CONSTRAINT Relationship26
;
ALTER TABLE vitalis_cuentas_bancarias DROP CONSTRAINT Relationship25
;
ALTER TABLE vitalis_cuentas_bancarias DROP CONSTRAINT Relationship24
;
ALTER TABLE vitalis_direcciones_personas DROP CONSTRAINT Relationship23
;
ALTER TABLE vitalis_centros_salud DROP CONSTRAINT Relationship22
;
ALTER TABLE vitalis_personal_tipos_planillas DROP CONSTRAINT Relationship21
;
ALTER TABLE vitalis_personal_tipos_planillas DROP CONSTRAINT Relationship20
;
ALTER TABLE vitalis_perfiles_pantallas DROP CONSTRAINT Relationship19
;
ALTER TABLE vitalis_perfiles_pantallas DROP CONSTRAINT Relationship18
;
ALTER TABLE vitalis_puestos_turnos DROP CONSTRAINT Relationship17
;
ALTER TABLE vitalis_puestos_turnos DROP CONSTRAINT Relationship16
;
ALTER TABLE vitalis_planillas_detalle DROP CONSTRAINT Relationship15
;
ALTER TABLE vitalis_planillas DROP CONSTRAINT Relationship14
;
ALTER TABLE vitalis_escalas_mensuales_detalle DROP CONSTRAINT Relationship13
;
ALTER TABLE vitalis_escalas_mensuales DROP CONSTRAINT Relationship12
;
ALTER TABLE vitalis_escalas_base DROP CONSTRAINT Relationship11
;
ALTER TABLE vitalis_puestos DROP CONSTRAINT Relationship10
;
ALTER TABLE vitalis_usuarios DROP CONSTRAINT Relationship9
;
ALTER TABLE vitalis_documentos_personas DROP CONSTRAINT Relationship8
;
ALTER TABLE vitalis_cuentas_bancarias DROP CONSTRAINT Relationship7
;
ALTER TABLE vitalis_telefonos_personas DROP CONSTRAINT Relationship6
;
ALTER TABLE vitalis_direcciones_personas DROP CONSTRAINT Relationship5
;
ALTER TABLE vitalis_distritos DROP CONSTRAINT Relationship4
;
ALTER TABLE vitalis_cantones DROP CONSTRAINT Relationship3
;
ALTER TABLE vitalis_provincia DROP CONSTRAINT Relationship2
;




-- Drop keys for tables section -------------------------------------------------

ALTER TABLE vitalis_tarifas_historial DROP CONSTRAINT vitalis_tarifas_historial_pk
;
ALTER TABLE vitalis_monitor_eventos DROP CONSTRAINT vitalis_monitor_eventos_pk
;
ALTER TABLE vitalis_monitor_bd DROP CONSTRAINT vitalis_monitor_bd_pk
;
ALTER TABLE vitalis_jobs_ejecuciones DROP CONSTRAINT vitalis_jobs_ejecuciones_pk
;
ALTER TABLE vitalis_jobs DROP CONSTRAINT vitalis_jobs_pk
;
ALTER TABLE vitalis_plantillas_notificacion DROP CONSTRAINT vitalis_plantillas_notificacion_pk
;
ALTER TABLE vitalis_autoregistros_documentos DROP CONSTRAINT vitalis_autoregistros_documentos_pk
;
ALTER TABLE vitalis_autoregistros DROP CONSTRAINT vitalis_autoregistros_pk
;
ALTER TABLE vitalis_facturas_centros DROP CONSTRAINT vitalis_facturas_centros _pk
;
ALTER TABLE vitalis_facturas_detalle DROP CONSTRAINT vitalis_facturas_detalle_pk
;
ALTER TABLE vitalis_consultorios DROP CONSTRAINT vitalis_consultorios_pk
;
ALTER TABLE vitalis_feriados DROP CONSTRAINT vitalis_feriados_pk
;
ALTER TABLE vitalis_vacaciones DROP CONSTRAINT vitalis_vacaciones_pk
;
ALTER TABLE vitalis_incapacidades DROP CONSTRAINT vitalis_incapacidades_pk
;
ALTER TABLE vitalis_contratos DROP CONSTRAINT vitalis_contratos_pk
;
ALTER TABLE vitalis_notificaciones DROP CONSTRAINT vitalis_notificaciones_pk
;
ALTER TABLE vitalis_identificacion DROP CONSTRAINT vitalis_identificacion_pk
;
ALTER TABLE vitalis_estados DROP CONSTRAINT vitalis_estados_pk
;
ALTER TABLE vitalis_personal_tipos_planillas DROP CONSTRAINT vitalis_personal_tipos_plantillas_pk
;
ALTER TABLE vitalis_perfiles_pantallas DROP CONSTRAINT vitalis_perfiles_pantallas_pk
;
ALTER TABLE vitalis_puestos_turnos DROP CONSTRAINT vitalis_puestos_turnos_pk
;
ALTER TABLE vitalis_padron_nacional DROP CONSTRAINT vitalis_padron_nacional_pk
;
ALTER TABLE vitalis_bitacoras DROP CONSTRAINT vitalis_bitacoras_pk
;
ALTER TABLE vitalis_parametros DROP CONSTRAINT vitalis_parametros_pk
;
ALTER TABLE vitalis_resumen_financiero DROP CONSTRAINT vitalis_resumen_financiero_pk
;
ALTER TABLE vitalis_planillas_movimientos DROP CONSTRAINT vitalis_planillas_movimientos_pk
;
ALTER TABLE vitalis_planillas_detalle DROP CONSTRAINT vitalis_planillas_detalle_pk
;
ALTER TABLE vitalis_planillas DROP CONSTRAINT vitalis_planillas_pk
;
ALTER TABLE vitalis_tipos_movimientos DROP CONSTRAINT vitalis_tipos_movimientos_pk
;
ALTER TABLE vitalis_tipos_planillas DROP CONSTRAINT vitalis_tipos_planillas_pk
;
ALTER TABLE vitalis_escalas_mensuales_detalle DROP CONSTRAINT vitalis_escalas_mensuales_detalle_pk
;
ALTER TABLE vitalis_escalas_mensuales DROP CONSTRAINT vitalis_escalas_mensuales_pk
;
ALTER TABLE vitalis_escalas_base_detalle DROP CONSTRAINT vitalis_escalas_base_detalle_pk
;
ALTER TABLE vitalis_escalas_base DROP CONSTRAINT vitalis_escalas_base_pk
;
ALTER TABLE vitalis_procedimientos_medicos DROP CONSTRAINT vitalis_procedimientos_medicos_pk
;
ALTER TABLE vitalis_tipos_procedimientos DROP CONSTRAINT vitalis_tipos_procedimientos_pk
;
ALTER TABLE vitalis_turnos DROP CONSTRAINT vitalis_turnos_pk
;
ALTER TABLE vitalis_puestos DROP CONSTRAINT vitalis_puestos_pk
;
ALTER TABLE vitalis_centros_salud DROP CONSTRAINT vitalis_centros_salud_pk
;
ALTER TABLE vitalis_usuarios DROP CONSTRAINT vitalis_usuarios_pk
;
ALTER TABLE vitalis_pantallas DROP CONSTRAINT vitalis_pantallas_pk
;
ALTER TABLE vitalis_perfiles DROP CONSTRAINT vitalis_perfiles_pk
;
ALTER TABLE vitalis_documentos_personas DROP CONSTRAINT vitalis_documentos_personas_pk
;
ALTER TABLE vitalis_cuentas_bancarias DROP CONSTRAINT vitalis_cuentas_bancarias_pk
;
ALTER TABLE vitalis_telefonos_personas DROP CONSTRAINT vitalis_telefonos_personas_pk
;
ALTER TABLE vitalis_direcciones_personas DROP CONSTRAINT vitalis_direcciones_personas_pk
;
ALTER TABLE vitalis_personas DROP CONSTRAINT vitalis_personas_pk
;
ALTER TABLE vitalis_tipos_cuenta DROP CONSTRAINT vitalis_tipos_cuenta_pk
;
ALTER TABLE vitalis_bancos DROP CONSTRAINT vitalis_bancos_pk
;
ALTER TABLE vitalis_tipos_documentos DROP CONSTRAINT vitalis_tipos_documentos_pk
;
ALTER TABLE vitalis_distritos DROP CONSTRAINT vitalis_distritos_pk
;
ALTER TABLE vitalis_cantones DROP CONSTRAINT vitalis_cantones_pk
;
ALTER TABLE vitalis_provincia DROP CONSTRAINT vitalis_provincia_pk
;
ALTER TABLE vitalis_paises DROP CONSTRAINT vitalis_paises_pk
;


-- Drop indexes section -------------------------------------------------

DROP INDEX IX_Relationship59
;
DROP INDEX IX_Relationship58
;
DROP INDEX IX_Relationship56
;
DROP INDEX IX_Relationship57
;
DROP INDEX IX_Relationship53
;
DROP INDEX IX_Relationship54
;
DROP INDEX IX_Relationship52
;
DROP INDEX IX_Relationship60
;
DROP INDEX IX_Relationship55
;
DROP INDEX IX_Relationship50
;
DROP INDEX IX_Relationship49
;
DROP INDEX IX_Relationship62
;
DROP INDEX IX_Relationship48
;
DROP INDEX IX_Relationship63
;
DROP INDEX IX_Relationship47
;
DROP INDEX IX_Relationship36
;
DROP INDEX IX_Relationship46
;
DROP INDEX IX_Relationship15
;
DROP INDEX IX_Relationship45
;
DROP INDEX IX_Relationship14
;
DROP INDEX IX_Relationship13
;
DROP INDEX IX_Relationship32
;
DROP INDEX IX_Relationship44
;
DROP INDEX IX_Relationship12
;
DROP INDEX IX_Relationship43
;
DROP INDEX IX_Relationship29
;
DROP INDEX IX_Relationship41
;
DROP INDEX IX_Relationship42
;
DROP INDEX IX_Relationship11
;
DROP INDEX IX_Relationship33
;
DROP INDEX IX_Relationship34
;
DROP INDEX IX_Relationship40
;
DROP INDEX IX_Relationship10
;
DROP INDEX IX_Relationship22
;
DROP INDEX IX_Relationship9
;
DROP INDEX IX_Relationship27
;
DROP INDEX IX_Relationship38
;
DROP INDEX IX_Relationship8
;
DROP INDEX IX_Relationship26
;
DROP INDEX IX_Relationship7
;
DROP INDEX IX_Relationship24
;
DROP INDEX IX_Relationship25
;
DROP INDEX IX_Relationship6
;
DROP INDEX IX_Relationship5
;
DROP INDEX IX_Relationship23
;
DROP INDEX IX_Relationship37
;
DROP INDEX IX_Relationship4
;
DROP INDEX vitalis_cantones_ind01
;
DROP INDEX vitalis_provincia_ind01
;


-- Drop tables section ---------------------------------------------------

DROP TABLE vitalis_tarifas_historial
;
DROP TABLE vitalis_monitor_eventos
;
DROP TABLE vitalis_monitor_bd
;
DROP TABLE vitalis_jobs_ejecuciones
;
DROP TABLE vitalis_jobs
;
DROP TABLE vitalis_plantillas_notificacion
;
DROP TABLE vitalis_autoregistros_documentos
;
DROP TABLE vitalis_autoregistros
;
DROP TABLE vitalis_facturas_centros
;
DROP TABLE vitalis_facturas_detalle
;
DROP TABLE vitalis_consultorios
;
DROP TABLE vitalis_feriados
;
DROP TABLE vitalis_vacaciones
;
DROP TABLE vitalis_incapacidades
;
DROP TABLE vitalis_contratos
;
DROP TABLE vitalis_notificaciones
;
DROP TABLE vitalis_identificacion
;
DROP TABLE vitalis_estados
;
DROP TABLE vitalis_personal_tipos_planillas
;
DROP TABLE vitalis_perfiles_pantallas
;
DROP TABLE vitalis_puestos_turnos
;
DROP TABLE vitalis_padron_nacional
;
DROP TABLE vitalis_bitacoras
;
DROP TABLE vitalis_parametros
;
DROP TABLE vitalis_resumen_financiero
;
DROP TABLE vitalis_planillas_movimientos
;
DROP TABLE vitalis_planillas_detalle
;
DROP TABLE vitalis_planillas
;
DROP TABLE vitalis_tipos_movimientos
;
DROP TABLE vitalis_tipos_planillas
;
DROP TABLE vitalis_escalas_mensuales_detalle
;
DROP TABLE vitalis_escalas_mensuales
;
DROP TABLE vitalis_escalas_base_detalle
;
DROP TABLE vitalis_escalas_base
;
DROP TABLE vitalis_procedimientos_medicos
;
DROP TABLE vitalis_tipos_procedimientos
;
DROP TABLE vitalis_turnos
;
DROP TABLE vitalis_puestos
;
DROP TABLE vitalis_centros_salud
;
DROP TABLE vitalis_usuarios
;
DROP TABLE vitalis_pantallas
;
DROP TABLE vitalis_perfiles
;
DROP TABLE vitalis_documentos_personas
;
DROP TABLE vitalis_cuentas_bancarias
;
DROP TABLE vitalis_telefonos_personas
;
DROP TABLE vitalis_direcciones_personas
;
DROP TABLE vitalis_personas
;
DROP TABLE vitalis_tipos_cuenta
;
DROP TABLE vitalis_bancos
;
DROP TABLE vitalis_tipos_documentos
;
DROP TABLE vitalis_distritos
;
DROP TABLE vitalis_cantones
;
DROP TABLE vitalis_provincia
;
DROP TABLE vitalis_paises
;

-- Create tables section -------------------------------------------------

-- Table vitalis_paises

CREATE TABLE vitalis_paises(
  pai_id Number NOT NULL,
  pai_codigo Varchar2(4 ),
  pai_nombre Varchar2(100 ),
  pai_estado Varchar2(1 ),
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
  can_codigo Varchar2(10 ),
  can_nombre Varchar2(100 ),
  can_estado Varchar2(1 ),
  can_version Number DEFAULT 1,
  CONSTRAINT vitalis_cantones_ck01 CHECK (can_estado in ('A','I'))
)
;

-- Create indexes for table vitalis_cantones

CREATE INDEX vitalis_cantones_ind01 ON vitalis_cantones (pro_id)
;

-- Add keys for table vitalis_cantones

ALTER TABLE vitalis_cantones ADD CONSTRAINT vitalis_cantones_pk PRIMARY KEY (can_id)
;

-- Table vitalis_distritos

CREATE TABLE vitalis_distritos(
  dis_id Number NOT NULL,
  can_id Number,
  dis_codigo Char(10 ),
  dis_nombre Varchar2(100 ),
  dis_estado Varchar2(1 ),
  dis_version Number,
  CONSTRAINT vitalis_distritos_ck01 CHECK (dis_estado in ('A','I'))
)
;

-- Create indexes for table vitalis_distritos

CREATE INDEX IX_Relationship4 ON vitalis_distritos (can_id)
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
  tdo_estado Varchar2(1 ),
  tdo_version Number,
  est_id Number
)
;

-- Create indexes for table vitalis_tipos_documentos

CREATE INDEX IX_Relationship37 ON vitalis_tipos_documentos (est_id)
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
COMMENT ON COLUMN vitalis_tipos_documentos.tdo_version IS 'Version del registro'
;

-- Table vitalis_bancos

CREATE TABLE vitalis_bancos(
  ban_id Number NOT NULL,
  ban_ced_juridica Varchar2(10 ),
  ban_nombre Varchar2(70 ),
  ban_estado Char(20 ),
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
  tcu_estado Varchar2(1 ),
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
  per_nombre Varchar2(20 ),
  per_apellido1 Varchar2(15 ),
  per_apellido2 Varchar2(15 ),
  per_estado_civil Varchar2(10 ),
  per_fecha_nacimiento Date,
  per_sexo Varchar2(1 ),
  per_email Varchar2(200 ),
  per_estado Varchar2(1 ),
  per_tipo_personal Char(20 ),
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
  dpe_tipo_direccion Varchar2(10 ),
  dpe_direccion_exacta Varchar2(250 ),
  dpe_principal Varchar2(1 ),
  dpe_codigo_postal Varchar2(30 ),
  dpe_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_direcciones_personas

CREATE INDEX IX_Relationship5 ON vitalis_direcciones_personas (per_id)
;

CREATE INDEX IX_Relationship23 ON vitalis_direcciones_personas (dis_id)
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

CREATE INDEX IX_Relationship6 ON vitalis_telefonos_personas (per_id)
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
  cba_numero_cuenta Varchar2(50 ),
  cba_iban Varchar2(50 ),
  cba_principal Varchar2(1 ),
  cba_estado Varchar2(1 ),
  cba_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_cuentas_bancarias

CREATE INDEX IX_Relationship7 ON vitalis_cuentas_bancarias (per_id)
;

CREATE INDEX IX_Relationship24 ON vitalis_cuentas_bancarias (ban_id)
;

CREATE INDEX IX_Relationship25 ON vitalis_cuentas_bancarias (tcu_id)
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

CREATE INDEX IX_Relationship8 ON vitalis_documentos_personas (per_id)
;

CREATE INDEX IX_Relationship26 ON vitalis_documentos_personas (tdo_id)
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
  prf_nombre Char(20 ),
  prf_descripcion Char(20 ),
  prf_estado Char(20 ),
  prf_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_perfiles

CREATE INDEX IX_Relationship38 ON vitalis_perfiles (est_id)
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
  pan_codigo Char(20 ),
  pan_nombre Char(20 ),
  pan_descripcion Char(20 ),
  pan_modulo Char(20 ),
  pan_estado Char(20 ),
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
  usu_login Char(20 ),
  usu_password Char(20 ),
  usu_fecha_creacion Char(20 ),
  usu_fecha_ultimo_acceso Char(20 ),
  usu_intentos_fallidos Char(20 ),
  usu_bloqueado Char(20 ),
  usu_estado Char(20 ),
  usu_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_usuarios

CREATE INDEX IX_Relationship9 ON vitalis_usuarios (per_id)
;

CREATE INDEX IX_Relationship27 ON vitalis_usuarios (prf_id)
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
  csa_codigo Varchar2(30 ),
  csa_nombre Char(20 ),
  csa_direccion_exacta Char(20 ),
  csa_telefono Char(20 ),
  csa_email Char(20 ),
  csa_contacto_principal Char(20 ),
  csa_telefono_contacto Char(20 ),
  csa_estado Char(20 ),
  csa_version Number
)
;

-- Create indexes for table vitalis_centros_salud

CREATE INDEX IX_Relationship22 ON vitalis_centros_salud (dis_id)
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

-- Table vitalis_puestos

CREATE TABLE vitalis_puestos(
  pue_id Number NOT NULL,
  csa_id Number,
  pue_codigo Varchar2(30 ),
  pue_nombre Varchar2(30 ),
  pue_descripcion Varchar2(30 ),
  pue_especialidad Varchar2(30 ),
  pue_estado Varchar2(1 ),
  pue_nivel Varchar2(10 ),
  pue_salario Number,
  pue_version Number NOT NULL
)
;

-- Create indexes for table vitalis_puestos

CREATE INDEX IX_Relationship10 ON vitalis_puestos (csa_id)
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
  tur_hora_inicio Timestamp(6),
  tur_hora_fin Timestamp(6),
  tur_horas_laborales Number,
  tur_estado Varchar2(1 ),
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
  tpr_codigo Char(20 ),
  tpr_nombre Char(20 ),
  tpr_descripcion Char(20 ),
  tpr_monto_base_cobrar Char(20 ),
  tpr_monto_base_pagar Char(20 ),
  tpr_estado Char(20 ),
  tpr_version Number
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
  prm_fecha_procedimiento Char(20 ),
  prm_hora_inicio Char(20 ),
  prm_hora_fin Char(20 ),
  prm_paciente_nombre Char(20 ),
  prm_paciente_cedula Char(20 ),
  prm_observaciones Char(20 ),
  prm_monto_cobrar Char(20 ),
  prm_monto_pagar Char(20 ),
  prm_procesado Char(20 ),
  prm_estado Char(20 ),
  prm_version Number NOT NULL
)
;

-- Create indexes for table vitalis_procedimientos_medicos

CREATE INDEX IX_Relationship33 ON vitalis_procedimientos_medicos (per_id)
;

CREATE INDEX IX_Relationship34 ON vitalis_procedimientos_medicos (tpr_id)
;

CREATE INDEX IX_Relationship40 ON vitalis_procedimientos_medicos (csa_id)
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
  esb_nombre Char(20 ),
  esb_semana_inicio Char(20 ),
  esb_semana_fin Char(20 ),
  esb_fecha_creacion Char(20 ),
  esb_estado Char(20 ),
  esb_version Number DEFAULT 1
 NOT NULL
)
;

-- Create indexes for table vitalis_escalas_base

CREATE INDEX IX_Relationship11 ON vitalis_escalas_base (csa_id)
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
  esd_dia_semana Varchar2(1 ),
  esd_estado Char(20 ),
  esd_version Number
)
;

-- Create indexes for table vitalis_escalas_base_detalle

CREATE INDEX IX_Relationship29 ON vitalis_escalas_base_detalle (per_id)
;

CREATE INDEX IX_Relationship41 ON vitalis_escalas_base_detalle (esb_id)
;

CREATE INDEX IX_Relationship42 ON vitalis_escalas_base_detalle (put_id)
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

-- Table vitalis_escalas_mensuales

CREATE TABLE vitalis_escalas_mensuales(
  esm_id Number NOT NULL,
  esb_id Number,
  csa_id Number,
  esm_mes Char(20 ),
  esm_anio Char(20 ),
  esm_nombre Char(20 ),
  esm_fecha_creacion Char(20 ),
  esm_estado Char(20 ),
  esm_procesado Char(20 ),
  esm_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_escalas_mensuales

CREATE INDEX IX_Relationship12 ON vitalis_escalas_mensuales (esb_id)
;

CREATE INDEX IX_Relationship43 ON vitalis_escalas_mensuales (csa_id)
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
  emd_fecha Char(20 ),
  emd_trabajado Char(20 ),
  emd_hora_inicio_real Char(20 ),
  emd_hora_fin_real Char(20 ),
  emd_horas_trabajadas Char(20 ),
  emd_observaciones Char(20 ),
  emd_procesado Char(20 ),
  emd_estado Char(20 )
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
  tpl_codigo Char(20 ),
  tpl_nombre Char(20 ),
  tpl_descripcion Char(20 ),
  tpl_tipo_personal Char(20 ),
  tpl_estado Char(20 ),
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
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_tipo_personal IS 'MEDICO, ADMINISTRATIVO'
;
COMMENT ON COLUMN vitalis_tipos_planillas.tpl_estado IS 'Estado (A=Activo, I=Inactivo)'
;

-- Table vitalis_tipos_movimientos

CREATE TABLE vitalis_tipos_movimientos(
  tmo_id Number NOT NULL,
  tmo_codigo Char(20 ),
  tmo_nombre Char(20 ),
  tmo_descripcion Char(20 ),
  tmo_tipo Char(20 ),
  tmo_calculo Char(20 ),
  tmo_valor Char(20 ),
  tmo_rango_salarial_min Char(20 ),
  tmo_rango_salarial_max Char(20 ),
  tmo_automatico Char(20 ),
  tmo_aplica_medicos Char(20 ),
  tmo_aplica_administrativos Char(20 ),
  tmo_estado Char(20 ),
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
  pla_mes Char(20 ),
  pla_anio Char(20 ),
  pla_nombre Char(20 ),
  pla_fecha_generacion Char(20 ),
  pla_fecha_aprobacion Char(20 ),
  pla_usu_aprobador Char(20 ),
  pla_total_ingresos Char(20 ),
  pla_total_deducciones Char(20 ),
  pla_total_neto Char(20 ),
  pla_estado Char(20 ),
  pla_notificada Char(20 ),
  pla_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_planillas

CREATE INDEX IX_Relationship14 ON vitalis_planillas (tpl_id)
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
COMMENT ON COLUMN vitalis_planillas.pla_estado IS 'GENERADA, APROBADA, PAGADA
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
  pld_salario_base Char(20 ),
  pld_total_ingresos Char(20 ),
  pld_total_deducciones Char(20 ),
  pld_total_neto Char(20 ),
  pld_notificado Char(20 ),
  pld_fecha_notificacion Char(20 ),
  pld_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_planillas_detalle

CREATE INDEX IX_Relationship15 ON vitalis_planillas_detalle (pla_id)
;

CREATE INDEX IX_Relationship45 ON vitalis_planillas_detalle (per_id)
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
  plm_concepto Char(20 ),
  plm_cantidad Char(20 ),
  plm_valor_unitario Char(20 ),
  plm_monto Char(20 ),
  plm_tipo Char(20 ),
  plm_origen Char(20 ),
  plm_origen_id Char(20 ),
  plm_version Number DEFAULT 1
)
;

-- Create indexes for table vitalis_planillas_movimientos

CREATE INDEX IX_Relationship36 ON vitalis_planillas_movimientos (tmo_id)
;

CREATE INDEX IX_Relationship46 ON vitalis_planillas_movimientos (pld_id)
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
COMMENT ON COLUMN vitalis_planillas_movimientos.plm_concepto IS 'Concepto del movimiento'
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
  ref_mes Char(20 ),
  ref_anio Char(20 ),
  ref_total_ingresos_turnos Char(20 ),
  ref_total_ingresos_procedimientos Char(20 ),
  ref_total_ingresos Char(20 ),
  ref_total_gastos_medicos Char(20 ),
  ref_total_gastos_administrativos Char(20 ),
  ref_total_gastos Char(20 ),
  ref_utilidad Char(20 ),
  ref_fecha_generacion Char(20 ),
  ref_version Number DEFAULT 1 NOT NULL
)
;

-- Create indexes for table vitalis_resumen_financiero

CREATE INDEX IX_Relationship47 ON vitalis_resumen_financiero (csa_id)
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
  par_codigo Char(20 ),
  par_nombre Char(20 ),
  par_valor Char(20 ),
  par_descripcion Char(20 ),
  par_tipo_dato Char(20 ),
  par_encriptado Char(20 ),
  par_modulo Char(20 ),
  par_estado Char(20 ),
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
  bit_tabla Char(20 ),
  bit_operacion Char(20 ),
  bit_pk_tabla Char(20 ),
  bit_usu_id Char(20 ),
  bit_fecha Char(20 ),
  bit_valores_anteriores Char(20 ),
  bit_valores_nuevos Char(20 ),
  bit_ip_usuario Char(20 ),
  bit_version Char(20 ) DEFAULT 1,
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
  pad_cedula Char(20 ),
  pad_nombre Char(20 ),
  pad_apellido1 Char(20 ),
  pad_apellido2 Char(20 ),
  pad_fecha_carga Char(20 )
)
;

-- Add keys for table vitalis_padron_nacional

ALTER TABLE vitalis_padron_nacional ADD CONSTRAINT vitalis_padron_nacional_pk PRIMARY KEY (pad_id)
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
COMMENT ON COLUMN vitalis_padron_nacional.pad_fecha_carga IS 'Fecha de carga al sistema

'
;

-- Table vitalis_puestos_turnos

CREATE TABLE vitalis_puestos_turnos(
  pue_id Number NOT NULL,
  tur_id Number NOT NULL,
  put_id Number NOT NULL,
  put_dia_semana Varchar2(1 ),
  put_monto_cobrar Number,
  put_monto_pagar Number,
  put_tipo_pago Varchar2(10 ),
  put_fecha_inicio Date,
  put_fecha_fin Date,
  put_max_personas Varchar2(30 ),
  put_min_persona Varchar2(30 ),
  put_version Varchar2(30 ),
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
  prp_lectura Char(20 ),
  prp_escritura Char(20 ),
  prp_eliminacion Char(20 ),
  prp_estado Char(20 ),
  prp_version Number DEFAULT 1
)
;

-- Add keys for table vitalis_perfiles_pantallas

ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT vitalis_perfiles_pantallas_pk PRIMARY KEY (pan_id,prf_id,prp_id)
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
  ptp_salario_base Varchar2(30 ),
  ptp_fecha_asignacion Varchar2(30 ),
  ptp_estado Varchar2(30 ),
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

CREATE INDEX IX_Relationship48 ON vitalis_identificacion (per_id)
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
  not_tipo Char(20 ),
  not_destinatario Char(20 ),
  not_asunto Char(20 ),
  not_mensaje Char(20 ),
  not_fecha_envio Char(20 ),
  not_estado Char(20 ),
  not_intentos Char(20 ),
  not_version Number DEFAULT 1,
  pln_id Number
)
;

-- Create indexes for table vitalis_notificaciones

CREATE INDEX IX_Relationship62 ON vitalis_notificaciones (pln_id)
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
  ctr_tipo Char(20 ),
  ctr_fecha_inicio Char(20 ),
  ctr_fecha_fin Char(20 ),
  ctr_monto_base Char(20 ),
  ctr_estado Char(20 ),
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

-- Table vitalis_incapacidades

CREATE TABLE vitalis_incapacidades(
  inc_id Number NOT NULL,
  inc_fecha_inicio Char(20 ),
  inc_fecha_fin Char(20 ),
  inc_tipo Char(20 ),
  inc_certificado Char(20 ),
  inc_version Number DEFAULT 1,
  per_id Number
)
;

-- Create indexes for table vitalis_incapacidades

CREATE INDEX IX_Relationship50 ON vitalis_incapacidades (per_id)
;

-- Add keys for table vitalis_incapacidades

ALTER TABLE vitalis_incapacidades ADD CONSTRAINT vitalis_incapacidades_pk PRIMARY KEY (inc_id)
;

-- Table vitalis_vacaciones

CREATE TABLE vitalis_vacaciones(
  vac_id Number NOT NULL,
  vac_fecha_inicio Char(20 ),
  vac_fecha_fin Char(20 ),
  vac_dias Char(20 ),
  vac_estado Char(20 ),
  vac_version Number DEFAULT 1 NOT NULL,
  per_id Number
)
;

-- Create indexes for table vitalis_vacaciones

CREATE INDEX IX_Relationship55 ON vitalis_vacaciones (per_id)
;

-- Add keys for table vitalis_vacaciones

ALTER TABLE vitalis_vacaciones ADD CONSTRAINT vitalis_vacaciones_pk PRIMARY KEY (vac_id)
;

-- Table vitalis_feriados

CREATE TABLE vitalis_feriados(
  fer_id Number NOT NULL,
  fer_fecha Char(20 ),
  fer_nombre Char(20 ),
  fer_tipo Char(20 ),
  fer_estado Char(20 ),
  fer_version Number DEFAULT 1 NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_feriados

CREATE INDEX IX_Relationship60 ON vitalis_feriados (csa_id)
;

-- Add keys for table vitalis_feriados

ALTER TABLE vitalis_feriados ADD CONSTRAINT vitalis_feriados_pk PRIMARY KEY (fer_id)
;

-- Table vitalis_consultorios

CREATE TABLE vitalis_consultorios(
  con_id Number NOT NULL,
  con_codigo Char(20 ),
  con_nombre Char(20 ),
  con_capacidad Char(20 ),
  con_estado Char(20 ),
  con_version Number DEFAULT 1 NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_consultorios

CREATE INDEX IX_Relationship52 ON vitalis_consultorios (csa_id)
;

-- Add keys for table vitalis_consultorios

ALTER TABLE vitalis_consultorios ADD CONSTRAINT vitalis_consultorios_pk PRIMARY KEY (con_id)
;

-- Table vitalis_facturas_detalle

CREATE TABLE vitalis_facturas_detalle(
  fad_id Number NOT NULL,
  fad_origen Char(20 ),
  fad_origen_id Char(20 ),
  fad_descripcion Char(20 ),
  fad_cantidad Char(20 ),
  fad_precio_unit Char(20 ),
  fad_monto Char(20 ),
  fad_version Number DEFAULT 1,
  fac_id Number
)
;

-- Create indexes for table vitalis_facturas_detalle

CREATE INDEX IX_Relationship54 ON vitalis_facturas_detalle (fac_id)
;

-- Add keys for table vitalis_facturas_detalle

ALTER TABLE vitalis_facturas_detalle ADD CONSTRAINT vitalis_facturas_detalle_pk PRIMARY KEY (fad_id)
;

-- Table vitalis_facturas_centros

CREATE TABLE vitalis_facturas_centros(
  fac_id Number NOT NULL,
  fac_mes Char(20 ),
  fac_anio Char(20 ),
  fac_numero Char(20 ),
  fac_fecha Char(20 ),
  fac_subtotal Char(20 ),
  fac_impuestos Char(20 ),
  fac_total Char(20 ),
  fac_estado Char(20 ),
  fac_version Number NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_facturas_centros

CREATE INDEX IX_Relationship53 ON vitalis_facturas_centros (csa_id)
;

-- Add keys for table vitalis_facturas_centros

ALTER TABLE vitalis_facturas_centros ADD CONSTRAINT vitalis_facturas_centros _pk PRIMARY KEY (fac_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_facturas_centros.fac_estado IS ' (EMITIDA/PAGADA/ANULADA)'
;
COMMENT ON COLUMN vitalis_facturas_centros.fac_version IS 'Version del registro'
;

-- Table vitalis_autoregistros

CREATE TABLE vitalis_autoregistros(
  aur_id Number NOT NULL,
  aur_cedula Char(20 ),
  aur_nombre Char(20 ),
  aur_apellido1 Char(20 ),
  aur_apellido2 Char(20 ),
  aur_email Char(20 ),
  aur_telefono Char(20 ),
  aur_tipo_personal Char(20 ),
  aur_fecha_nacimiento Char(20 ),
  aur_estado Char(20 ),
  aur_fecha_registro Char(20 ),
  aur_fecha_revision Char(20 ),
  aur_usu_revisor Char(20 ),
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
COMMENT ON COLUMN vitalis_autoregistros.aur_tipo_personal IS 'MEDICO, ADMINISTRATIVO'
;
COMMENT ON COLUMN vitalis_autoregistros.aur_estado IS 'P=Pendiente, A=Aprobado, R=Rechazado'
;

-- Table vitalis_autoregistros_documentos

CREATE TABLE vitalis_autoregistros_documentos(
  aud_id Number NOT NULL,
  aud_nombre_archivo Char(20 ),
  aud_ruta_archivo Char(20 ),
  aud_fecha_carga Char(20 ),
  aud_estado Char(20 ),
  aud_version Number DEFAULT 1 NOT NULL,
  aur_id Number,
  tdo_id Number
)
;

-- Create indexes for table vitalis_autoregistros_documentos

CREATE INDEX IX_Relationship56 ON vitalis_autoregistros_documentos (aur_id)
;

CREATE INDEX IX_Relationship57 ON vitalis_autoregistros_documentos (tdo_id)
;

-- Add keys for table vitalis_autoregistros_documentos

ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT vitalis_autoregistros_documentos_pk PRIMARY KEY (aud_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_autoregistros_documentos.aud_version IS 'Version del registro'
;

-- Table vitalis_plantillas_notificacion

CREATE TABLE vitalis_plantillas_notificacion(
  pln_id Number NOT NULL,
  pln_codigo Char(20 ),
  pln_nombre Char(20 ),
  pln_asunto Char(20 ),
  pln_cuerpo Char(20 ),
  pln_tipo Char(20 ),
  pln_estado Char(20 ),
  pln_fecha_creacion Char(20 ),
  pln_version Number DEFAULT 1
)
;

-- Add keys for table vitalis_plantillas_notificacion

ALTER TABLE vitalis_plantillas_notificacion ADD CONSTRAINT vitalis_plantillas_notificacion_pk PRIMARY KEY (pln_id)
;

-- Table vitalis_jobs

CREATE TABLE vitalis_jobs(
  job_id Number NOT NULL,
  job_codigo Char(20 ),
  job_nombre Char(20 ),
  job_descripcion Char(20 ),
  job_cron Char(20 ),
  job_activo Char(20 ),
  job_fecha_creacion Char(20 ),
  job_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_jobs

ALTER TABLE vitalis_jobs ADD CONSTRAINT vitalis_jobs_pk PRIMARY KEY (job_id)
;

-- Table and Columns comments section

COMMENT ON COLUMN vitalis_jobs.job_version IS 'Version del registro'
;

-- Table vitalis_jobs_ejecuciones

CREATE TABLE vitalis_jobs_ejecuciones(
  joe_id Number NOT NULL,
  joe_fecha_inicio Char(20 ),
  joe_fecha_fin Char(20 ),
  joe_estado Char(20 ),
  joe_log Char(20 ),
  joe_version Number DEFAULT 1 NOT NULL,
  job_id Number
)
;

-- Create indexes for table vitalis_jobs_ejecuciones

CREATE INDEX IX_Relationship58 ON vitalis_jobs_ejecuciones (job_id)
;

-- Add keys for table vitalis_jobs_ejecuciones

ALTER TABLE vitalis_jobs_ejecuciones ADD CONSTRAINT vitalis_jobs_ejecuciones_pk PRIMARY KEY (joe_id)
;

-- Table vitalis_monitor_bd

CREATE TABLE vitalis_monitor_bd(
  mbd_id Number NOT NULL,
  mbd_tipo Char(20 ),
  mbd_descripcion Char(20 ),
  mbd_valor Char(20 ),
  mbd_fecha Char(20 ),
  mbd_estado Char(20 ),
  mbd_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_monitor_bd

ALTER TABLE vitalis_monitor_bd ADD CONSTRAINT vitalis_monitor_bd_pk PRIMARY KEY (mbd_id)
;

-- Table vitalis_monitor_eventos

CREATE TABLE vitalis_monitor_eventos(
  mve_id Number NOT NULL,
  mve_fecha Char(20 ),
  mve_notificado Char(20 ),
  mve_destinatario Char(20 ),
  mve_resultado Char(20 ),
  mve_estado Char(20 ),
  mve_version Number DEFAULT 1 NOT NULL,
  mbd_id Number
)
;

-- Create indexes for table vitalis_monitor_eventos

CREATE INDEX IX_Relationship59 ON vitalis_monitor_eventos (mbd_id)
;

-- Add keys for table vitalis_monitor_eventos

ALTER TABLE vitalis_monitor_eventos ADD CONSTRAINT vitalis_monitor_eventos_pk PRIMARY KEY (mve_id)
;

-- Table vitalis_tarifas_historial

CREATE TABLE vitalis_tarifas_historial(
  tah_id Number NOT NULL,
  tah_contexto Char(20 ),
  tah_monto_cobrar Char(20 ),
  tah_monto_pagar Char(20 ),
  tah_vig_desde Char(20 ),
  tah_vig_hasta Char(20 ),
  tah_estado Char(20 ),
  tah_fecha_registro Char(20 ),
  tah_version Number DEFAULT 1 NOT NULL
)
;

-- Add keys for table vitalis_tarifas_historial

ALTER TABLE vitalis_tarifas_historial ADD CONSTRAINT vitalis_tarifas_historial_pk PRIMARY KEY (tah_id)
;


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE vitalis_provincia ADD CONSTRAINT Relationship2 FOREIGN KEY (pai_id) REFERENCES vitalis_paises (pai_id)
;



ALTER TABLE vitalis_cantones ADD CONSTRAINT Relationship3 FOREIGN KEY (pro_id) REFERENCES vitalis_provincia (pro_id)
;



ALTER TABLE vitalis_distritos ADD CONSTRAINT Relationship4 FOREIGN KEY (can_id) REFERENCES vitalis_cantones (can_id)
;



ALTER TABLE vitalis_direcciones_personas ADD CONSTRAINT Relationship5 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_telefonos_personas ADD CONSTRAINT Relationship6 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT Relationship7 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_documentos_personas ADD CONSTRAINT Relationship8 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_usuarios ADD CONSTRAINT Relationship9 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_puestos ADD CONSTRAINT Relationship10 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_base ADD CONSTRAINT Relationship11 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT Relationship12 FOREIGN KEY (esb_id) REFERENCES vitalis_escalas_base (esb_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT Relationship13 FOREIGN KEY (esm_id) REFERENCES vitalis_escalas_mensuales (esm_id)
;



ALTER TABLE vitalis_planillas ADD CONSTRAINT Relationship14 FOREIGN KEY (tpl_id) REFERENCES vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT Relationship15 FOREIGN KEY (pla_id) REFERENCES vitalis_planillas (pla_id)
;



ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT Relationship16 FOREIGN KEY (pue_id) REFERENCES vitalis_puestos (pue_id)
;



ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT Relationship17 FOREIGN KEY (tur_id) REFERENCES vitalis_turnos (tur_id)
;



ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT Relationship18 FOREIGN KEY (pan_id) REFERENCES vitalis_pantallas (pan_id)
;



ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT Relationship19 FOREIGN KEY (prf_id) REFERENCES vitalis_perfiles (prf_id)
;



ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT Relationship20 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT Relationship21 FOREIGN KEY (tpl_id) REFERENCES vitalis_tipos_planillas (tpl_id)
;



ALTER TABLE vitalis_centros_salud ADD CONSTRAINT Relationship22 FOREIGN KEY (dis_id) REFERENCES vitalis_distritos (dis_id)
;



ALTER TABLE vitalis_direcciones_personas ADD CONSTRAINT Relationship23 FOREIGN KEY (dis_id) REFERENCES vitalis_distritos (dis_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT Relationship24 FOREIGN KEY (ban_id) REFERENCES vitalis_bancos (ban_id)
;



ALTER TABLE vitalis_cuentas_bancarias ADD CONSTRAINT Relationship25 FOREIGN KEY (tcu_id) REFERENCES vitalis_tipos_cuenta (tcu_id)
;



ALTER TABLE vitalis_documentos_personas ADD CONSTRAINT Relationship26 FOREIGN KEY (tdo_id) REFERENCES vitalis_tipos_documentos (tdo_id)
;



ALTER TABLE vitalis_usuarios ADD CONSTRAINT Relationship27 FOREIGN KEY (prf_id) REFERENCES vitalis_perfiles (prf_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT Relationship29 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT Relationship32 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT Relationship33 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT Relationship34 FOREIGN KEY (tpr_id) REFERENCES vitalis_tipos_procedimientos (tpr_id)
;



ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT Relationship36 FOREIGN KEY (tmo_id) REFERENCES vitalis_tipos_movimientos (tmo_id)
;



ALTER TABLE vitalis_tipos_documentos ADD CONSTRAINT Relationship37 FOREIGN KEY (est_id) REFERENCES vitalis_estados (est_id)
;



ALTER TABLE vitalis_perfiles ADD CONSTRAINT Relationship38 FOREIGN KEY (est_id) REFERENCES vitalis_estados (est_id)
;



ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT Relationship40 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT Relationship41 FOREIGN KEY (esb_id) REFERENCES vitalis_escalas_base (esb_id)
;



ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT Relationship42 FOREIGN KEY (put_id) REFERENCES vitalis_puestos_turnos (put_id)
;



ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT Relationship43 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT Relationship44 FOREIGN KEY (put_id) REFERENCES vitalis_puestos_turnos (put_id)
;



ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT Relationship45 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT Relationship46 FOREIGN KEY (pld_id) REFERENCES vitalis_planillas_detalle (pld_id)
;



ALTER TABLE vitalis_resumen_financiero ADD CONSTRAINT Relationship47 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_identificacion ADD CONSTRAINT Relationship48 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_contratos ADD CONSTRAINT Relationship49 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_incapacidades ADD CONSTRAINT Relationship50 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_consultorios ADD CONSTRAINT Relationship52 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_facturas_centros ADD CONSTRAINT Relationship53 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_facturas_detalle ADD CONSTRAINT Relationship54 FOREIGN KEY (fac_id) REFERENCES vitalis_facturas_centros (fac_id)
;



ALTER TABLE vitalis_vacaciones ADD CONSTRAINT Relationship55 FOREIGN KEY (per_id) REFERENCES vitalis_personas (per_id)
;



ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT Relationship56 FOREIGN KEY (aur_id) REFERENCES vitalis_autoregistros (aur_id)
;



ALTER TABLE vitalis_autoregistros_documentos ADD CONSTRAINT Relationship57 FOREIGN KEY (tdo_id) REFERENCES vitalis_tipos_documentos (tdo_id)
;



ALTER TABLE vitalis_jobs_ejecuciones ADD CONSTRAINT Relationship58 FOREIGN KEY (job_id) REFERENCES vitalis_jobs (job_id)
;



ALTER TABLE vitalis_monitor_eventos ADD CONSTRAINT Relationship59 FOREIGN KEY (mbd_id) REFERENCES vitalis_monitor_bd (mbd_id)
;



ALTER TABLE vitalis_feriados ADD CONSTRAINT Relationship60 FOREIGN KEY (csa_id) REFERENCES vitalis_centros_salud (csa_id)
;



ALTER TABLE vitalis_notificaciones ADD CONSTRAINT Relationship62 FOREIGN KEY (pln_id) REFERENCES vitalis_plantillas_notificacion (pln_id)
;



ALTER TABLE vitalis_bitacoras ADD CONSTRAINT Relationship63 FOREIGN KEY (usu_id) REFERENCES vitalis_usuarios (usu_id)
;





