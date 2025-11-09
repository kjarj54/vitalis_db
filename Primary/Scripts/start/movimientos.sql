-- BONO POR ANTIGUEDAD (aplica a ambos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (10, 1001, 'Bono Antiguedad', 'Reconocimiento por anos de servicio',
        'INGRESO', 'ABSOLUTO', 20000, 0, 9999999, 'S', 'S', 'S', 'A', 1);

-- INCENTIVO POR PRODUCTIVIDAD (solo medicos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (11, 1002, 'Incentivo Productivi', 'Bono adicional por rendimiento',
        'INGRESO', 'PORCENTUAL', 5, 0, 9999999, 'S', 'S', 'N', 'A', 1);

-- BONO ADMINISTRATIVO ESPECIAL (solo administrativos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (12, 1003, 'Bono Administrati', 'Bono por eficiencia y asistencia',
        'INGRESO', 'PORCENTUAL', 3, 0, 9999999, 'S', 'N', 'S', 'A', 1);



-- SEGURO SOCIAL CCSS (aplica a ambos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (13, 2001, 'CCSS', 'Aporte al seguro social',
        'DEDUCCION', 'PORCENTUAL', 9, 0, 9999999, 'S', 'S', 'S', 'A', 1);

-- IMPUESTO DE RENTA (por rangos salariales)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (14, 2002, 'Impuesto Renta', 'Retencion de impuesto sobre salario',
        'DEDUCCION', 'PORCENTUAL', 10, 500000, 9999999, 'S', 'S', 'S', 'A', 1);

-- COOPERATIVA MEDICA (solo medicos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (15, 2003, 'Cooperativa Medica', 'Aporte mensual a la cooperativa medica',
        'DEDUCCION', 'PORCENTUAL', 2, 0, 9999999, 'S', 'S', 'N', 'A', 1);

-- CUOTA DE AHORRO (solo administrativos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (16, 2004, 'Cuota Ahorro', 'Deduccion voluntaria de ahorro personal',
        'DEDUCCION', 'ABSOLUTO', 10000, 0, 9999999, 'S', 'N', 'S', 'A', 1);

-- POLIZA DE VIDA (ambos tipos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_movimientos
(tmo_id, tmo_codigo, tmo_nombre, tmo_descripcion, tmo_tipo,
 tmo_calculo, tmo_valor, tmo_rango_salarial_min, tmo_rango_salarial_max,
 tmo_automatico, tmo_aplica_medicos, tmo_aplica_administrativos,
 tmo_estado, tmo_version)
VALUES (17, 2005, 'Poliza Vida', 'Deduccion por seguro de vida institucional',
        'DEDUCCION', 'ABSOLUTO', 5000, 0, 9999999, 'S', 'S', 'S', 'A', 1);
