/*
Created: 16/8/2025
Modified: 17/8/2025
Model: Vitalis
Database: Oracle 19c
*/


-- Create tables section -------------------------------------------------

-- Table vitalis_paises

CREATE TABLE vitalis_paises(
  pai_id Number NOT NULL
)
;

-- Add keys for table vitalis_paises

ALTER TABLE vitalis_paises ADD CONSTRAINT vitalis_paises_pk PRIMARY KEY (pai_id)
;

-- Table vitalis_provincia

CREATE TABLE vitalis_provincia(
  pro_id Number NOT NULL,
  pai_id Number
)
;

-- Create indexes for table vitalis_provincia

CREATE INDEX IX_Relationship2 ON vitalis_provincia (pai_id)
;

-- Add keys for table vitalis_provincia

ALTER TABLE vitalis_provincia ADD CONSTRAINT vitalis_provincia_pk PRIMARY KEY (pro_id)
;

-- Table vitalis_cantones

CREATE TABLE vitalis_cantones(
  can_id Number NOT NULL,
  pro_id Number
)
;

-- Create indexes for table vitalis_cantones

CREATE INDEX IX_Relationship3 ON vitalis_cantones (pro_id)
;

-- Add keys for table vitalis_cantones

ALTER TABLE vitalis_cantones ADD CONSTRAINT vitalis_cantones_pk PRIMARY KEY (can_id)
;

-- Table vitalis_distritos

CREATE TABLE vitalis_distritos(
  dis_id Number NOT NULL,
  can_id Number
)
;

-- Create indexes for table vitalis_distritos

CREATE INDEX IX_Relationship4 ON vitalis_distritos (can_id)
;

-- Add keys for table vitalis_distritos

ALTER TABLE vitalis_distritos ADD CONSTRAINT vitalis_distritos_pk PRIMARY KEY (dis_id)
;

-- Table vitalis_tipos_documentos

CREATE TABLE vitalis_tipos_documentos(
  tdo_id Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_documentos

ALTER TABLE vitalis_tipos_documentos ADD CONSTRAINT vitalis_tipos_documentos_pk PRIMARY KEY (tdo_id)
;

-- Table vitalis_bancos

CREATE TABLE vitalis_bancos(
  ban_id Number NOT NULL
)
;

-- Add keys for table vitalis_bancos

ALTER TABLE vitalis_bancos ADD CONSTRAINT vitalis_bancos_pk PRIMARY KEY (ban_id)
;

-- Table vitalis_tipos_cuenta

CREATE TABLE vitalis_tipos_cuenta(
  tcu_id Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_cuenta

ALTER TABLE vitalis_tipos_cuenta ADD CONSTRAINT vitalis_tipos_cuenta_pk PRIMARY KEY (tcu_id)
;

-- Table vitalis_personas

CREATE TABLE vitalis_personas(
  per_id Number NOT NULL
)
;

-- Add keys for table vitalis_personas

ALTER TABLE vitalis_personas ADD CONSTRAINT vitalis_personas_pk PRIMARY KEY (per_id)
;

-- Table vitalis_direcciones_personas

CREATE TABLE vitalis_direcciones_personas(
  dpe_id Number NOT NULL,
  per_id Number,
  dis_id Number
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

-- Table vitalis_telefonos_personas

CREATE TABLE vitalis_telefonos_personas(
  tpe_id Number NOT NULL,
  per_id Number
)
;

-- Create indexes for table vitalis_telefonos_personas

CREATE INDEX IX_Relationship6 ON vitalis_telefonos_personas (per_id)
;

-- Add keys for table vitalis_telefonos_personas

ALTER TABLE vitalis_telefonos_personas ADD CONSTRAINT vitalis_telefonos_personas_pk PRIMARY KEY (tpe_id)
;

-- Table vitalis_cuentas_bancarias

CREATE TABLE vitalis_cuentas_bancarias(
  cba_id Number NOT NULL,
  per_id Number,
  ban_id Number,
  tcu_id Number
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

-- Table vitalis_documentos_personas

CREATE TABLE vitalis_documentos_personas(
  dop_id Number NOT NULL,
  per_id Number,
  tdo_id Number
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

-- Table vitalis_perfiles

CREATE TABLE vitalis_perfiles(
  prf_id Number NOT NULL
)
;

-- Add keys for table vitalis_perfiles

ALTER TABLE vitalis_perfiles ADD CONSTRAINT vitalis_perfiles_pk PRIMARY KEY (prf_id)
;

-- Table vitalis_pantallas

CREATE TABLE vitalis_pantallas(
  pan_id Number NOT NULL
)
;

-- Add keys for table vitalis_pantallas

ALTER TABLE vitalis_pantallas ADD CONSTRAINT vitalis_pantallas_pk PRIMARY KEY (pan_id)
;

-- Table vitalis_usuarios

CREATE TABLE vitalis_usuarios(
  usu_id Number NOT NULL,
  per_id Number,
  prf_id Number
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

-- Table vitalis_centros_salud

CREATE TABLE vitalis_centros_salud(
  csa_id Number NOT NULL,
  dis_id Number
)
;

-- Create indexes for table vitalis_centros_salud

CREATE INDEX IX_Relationship22 ON vitalis_centros_salud (dis_id)
;

-- Add keys for table vitalis_centros_salud

ALTER TABLE vitalis_centros_salud ADD CONSTRAINT vitalis_centros_salud_pk PRIMARY KEY (csa_id)
;

-- Table vitalis_puestos

CREATE TABLE vitalis_puestos(
  pue_id Number NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_puestos

CREATE INDEX IX_Relationship10 ON vitalis_puestos (csa_id)
;

-- Add keys for table vitalis_puestos

ALTER TABLE vitalis_puestos ADD CONSTRAINT vitalis_puestos_pk PRIMARY KEY (pue_id)
;

-- Table vitalis_turnos

CREATE TABLE vitalis_turnos(
  tur_id Number NOT NULL
)
;

-- Add keys for table vitalis_turnos

ALTER TABLE vitalis_turnos ADD CONSTRAINT vitalis_turnos_pk PRIMARY KEY (tur_id)
;

-- Table vitalis_tipos_procedimientos

CREATE TABLE vitalis_tipos_procedimientos(
  tpr_id Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_procedimientos

ALTER TABLE vitalis_tipos_procedimientos ADD CONSTRAINT vitalis_tipos_procedimientos_pk PRIMARY KEY (tpr_id)
;

-- Table vitalis_procedimientos_medicos

CREATE TABLE vitalis_procedimientos_medicos(
  prm_id Number NOT NULL,
  per_id Number,
  tpr_id Number
)
;

-- Create indexes for table vitalis_procedimientos_medicos

CREATE INDEX IX_Relationship33 ON vitalis_procedimientos_medicos (per_id)
;

CREATE INDEX IX_Relationship34 ON vitalis_procedimientos_medicos (tpr_id)
;

-- Add keys for table vitalis_procedimientos_medicos

ALTER TABLE vitalis_procedimientos_medicos ADD CONSTRAINT vitalis_procedimientos_medicos_pk PRIMARY KEY (prm_id)
;

-- Table vitalis_escalas_base

CREATE TABLE vitalis_escalas_base(
  esb_id Number NOT NULL,
  csa_id Number
)
;

-- Create indexes for table vitalis_escalas_base

CREATE INDEX IX_Relationship11 ON vitalis_escalas_base (csa_id)
;

-- Add keys for table vitalis_escalas_base

ALTER TABLE vitalis_escalas_base ADD CONSTRAINT vitalis_escalas_base_pk PRIMARY KEY (esb_id)
;

-- Table vitalis_escalas_base_detalle

CREATE TABLE vitalis_escalas_base_detalle(
  esd_id Number NOT NULL,
  per_id Number
)
;

-- Create indexes for table vitalis_escalas_base_detalle

CREATE INDEX IX_Relationship29 ON vitalis_escalas_base_detalle (per_id)
;

-- Add keys for table vitalis_escalas_base_detalle

ALTER TABLE vitalis_escalas_base_detalle ADD CONSTRAINT vitalis_escalas_base_detalle_pk PRIMARY KEY (esd_id)
;

-- Table vitalis_escalas_mensuales

CREATE TABLE vitalis_escalas_mensuales(
  esm_id Number NOT NULL,
  esb_id Number
)
;

-- Create indexes for table vitalis_escalas_mensuales

CREATE INDEX IX_Relationship12 ON vitalis_escalas_mensuales (esb_id)
;

-- Add keys for table vitalis_escalas_mensuales

ALTER TABLE vitalis_escalas_mensuales ADD CONSTRAINT vitalis_escalas_mensuales_pk PRIMARY KEY (esm_id)
;

-- Table vitalis_escalas_mensuales_detalle

CREATE TABLE vitalis_escalas_mensuales_detalle(
  emd_id Number NOT NULL,
  esm_id Number,
  per_id Number
)
;

-- Create indexes for table vitalis_escalas_mensuales_detalle

CREATE INDEX IX_Relationship13 ON vitalis_escalas_mensuales_detalle (esm_id)
;

CREATE INDEX IX_Relationship32 ON vitalis_escalas_mensuales_detalle (per_id)
;

-- Add keys for table vitalis_escalas_mensuales_detalle

ALTER TABLE vitalis_escalas_mensuales_detalle ADD CONSTRAINT vitalis_escalas_mensuales_detalle_pk PRIMARY KEY (emd_id)
;

-- Table vitalis_tipos_planillas

CREATE TABLE vitalis_tipos_planillas(
  tpl_id Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_planillas

ALTER TABLE vitalis_tipos_planillas ADD CONSTRAINT vitalis_tipos_planillas_pk PRIMARY KEY (tpl_id)
;

-- Table vitalis_tipos_movimientos

CREATE TABLE vitalis_tipos_movimientos(
  tmo_id Number NOT NULL
)
;

-- Add keys for table vitalis_tipos_movimientos

ALTER TABLE vitalis_tipos_movimientos ADD CONSTRAINT vitalis_tipos_movimientos_pk PRIMARY KEY (tmo_id)
;

-- Table vitalis_planillas

CREATE TABLE vitalis_planillas(
  pla_id Number NOT NULL,
  tpl_id Number
)
;

-- Create indexes for table vitalis_planillas

CREATE INDEX IX_Relationship14 ON vitalis_planillas (tpl_id)
;

-- Add keys for table vitalis_planillas

ALTER TABLE vitalis_planillas ADD CONSTRAINT vitalis_planillas_pk PRIMARY KEY (pla_id)
;

-- Table vitalis_planillas_detalle

CREATE TABLE vitalis_planillas_detalle(
  pld_id Number NOT NULL,
  pla_id Number
)
;

-- Create indexes for table vitalis_planillas_detalle

CREATE INDEX IX_Relationship15 ON vitalis_planillas_detalle (pla_id)
;

-- Add keys for table vitalis_planillas_detalle

ALTER TABLE vitalis_planillas_detalle ADD CONSTRAINT vitalis_planillas_detalle_pk PRIMARY KEY (pld_id)
;

-- Table vitalis_planillas_movimientos

CREATE TABLE vitalis_planillas_movimientos(
  plm_id Number NOT NULL,
  tmo_id Number
)
;

-- Create indexes for table vitalis_planillas_movimientos

CREATE INDEX IX_Relationship36 ON vitalis_planillas_movimientos (tmo_id)
;

-- Add keys for table vitalis_planillas_movimientos

ALTER TABLE vitalis_planillas_movimientos ADD CONSTRAINT vitalis_planillas_movimientos_pk PRIMARY KEY (plm_id)
;

-- Table vitalis_resumen_financiero

CREATE TABLE vitalis_resumen_financiero(
  ref_id Number NOT NULL
)
;

-- Add keys for table vitalis_resumen_financiero

ALTER TABLE vitalis_resumen_financiero ADD CONSTRAINT vitalis_resumen_financiero_pk PRIMARY KEY (ref_id)
;

-- Table vitalis_parametros

CREATE TABLE vitalis_parametros(
  par_id Number NOT NULL
)
;

-- Add keys for table vitalis_parametros

ALTER TABLE vitalis_parametros ADD CONSTRAINT vitalis_parametros_pk PRIMARY KEY (par_id)
;

-- Table vitalis_bitacoras

CREATE TABLE vitalis_bitacoras(
  bit_id Number NOT NULL
)
;

-- Add keys for table vitalis_bitacoras

ALTER TABLE vitalis_bitacoras ADD CONSTRAINT vitalis_bitacoras_pk PRIMARY KEY (bit_id)
;

-- Table vitalis_padron_nacional

CREATE TABLE vitalis_padron_nacional(
  pad_id Number NOT NULL
)
;

-- Add keys for table vitalis_padron_nacional

ALTER TABLE vitalis_padron_nacional ADD CONSTRAINT PK_vitalis_padron_nacional PRIMARY KEY (pad_id)
;

-- Table vitalis_puestos_turnos

CREATE TABLE vitalis_puestos_turnos(
  pue_id Number NOT NULL,
  tur_id Number NOT NULL
)
;

-- Add keys for table vitalis_puestos_turnos

ALTER TABLE vitalis_puestos_turnos ADD CONSTRAINT PK_vitalis_puestos_turnos PRIMARY KEY (pue_id,tur_id)
;

-- Table vitalis_perfiles_pantallas

CREATE TABLE vitalis_perfiles_pantallas(
  pan_id Number NOT NULL,
  prf_id Number NOT NULL
)
;

-- Add keys for table vitalis_perfiles_pantallas

ALTER TABLE vitalis_perfiles_pantallas ADD CONSTRAINT PK_vitalis_perfiles_pantallas PRIMARY KEY (pan_id,prf_id)
;

-- Table vitalis_personal_tipos_planillas

CREATE TABLE vitalis_personal_tipos_planillas(
  per_id Number NOT NULL,
  tpl_id Number NOT NULL
)
;

-- Add keys for table vitalis_personal_tipos_planillas

ALTER TABLE vitalis_personal_tipos_planillas ADD CONSTRAINT PK_vitalis_personal_tipos_planillas PRIMARY KEY (per_id,tpl_id)
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





