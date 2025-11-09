-- ===== TIPOS DE PLANILLAS BASE =====

-- Planilla Médicos
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas
(tpl_id, tpl_codigo, tpl_nombre, tpl_descripcion,
 tpl_tipo_personal, tpl_estado, tpl_version)
VALUES (1, 101, 'Planilla Medicos', 
        'Planilla mensual para personal medico, incluye pagos por turnos y procedimientos',
        'M', 'A', 1);

-- Planilla Administrativos
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas
(tpl_id, tpl_codigo, tpl_nombre, tpl_descripcion,
 tpl_tipo_personal, tpl_estado, tpl_version)
VALUES (2, 102, 'Planilla Administra', 
        'Planilla mensual para personal administrativo, incluye salarios base y bonos',
        'A', 'A', 1);

-- ===== TIPOS DE PLANILLAS ADICIONALES (OPCIONALES) =====

-- Planilla Extraordinaria (Medicos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas
(tpl_id, tpl_codigo, tpl_nombre, tpl_descripcion,
 tpl_tipo_personal, tpl_estado, tpl_version)
VALUES (3, 103, 'Plani Extra Medicos', 
        'Planilla para pagos extraordinarios de medicos (guardias, suplencias, vacaciones, etc.)',
        'M', 'A', 1);

-- Planilla Extraordinaria (Administrativos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas
(tpl_id, tpl_codigo, tpl_nombre, tpl_descripcion,
 tpl_tipo_personal, tpl_estado, tpl_version)
VALUES (4, 104, 'Plani Extrao Admin', 
        'Planilla para pagos extraordinarios de administrativos (horas extra, viaticos, etc.)',
        'A', 'A', 1);

-- Planilla de Aguinaldo (Ambos tipos)
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas
(tpl_id, tpl_codigo, tpl_nombre, tpl_descripcion,
 tpl_tipo_personal, tpl_estado, tpl_version)
VALUES (5, 105, 'Planilla Aguinaldo', 
        'Planilla especial de aguinaldo calculada en diciembre',
        'M', 'A', 1);
