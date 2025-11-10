/*
SCRIPT DE DATOS DE PRUEBA
Para probar el sistema de bitácoras
Fecha: 09/11/2025
*/

-- ============================================================================
-- PASO 1: INSERTAR DATOS BÁSICOS NECESARIOS
-- ============================================================================

-- 1. Insertar un Perfil
INSERT INTO VITALIS_SCHEMA.vitalis_perfiles (
    prf_nombre, prf_descripcion, prf_estado
) VALUES (
    'Administrador', 'Perfil de administrador del sistema', 'A'
);

-- 2. Insertar una Persona
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_nombre, per_apellido1, per_apellido2, 
    per_estado_civil, per_fecha_nacimiento, per_sexo, 
    per_email, per_estado, per_tipo_personal
) VALUES (
    'Juan', 'Perez', 'Lopez',
    'Soltero', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'M',
    'juan.perez@vitalis.com', 'A', 'ADMINISTRATIVO'
);

-- 3. Insertar Usuario (usando el perfil y persona recién creados)
INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_login, usu_password, usu_fecha_creacion, 
    usu_fecha_ultimo_acceso, usu_intentos_fallidos, 
    usu_bloqueado, usu_estado, 
    usu_per_id, usu_prf_id
) VALUES (
    'admin', 'admin123', SYSDATE,
    SYSDATE, 0,
    'N', 'A',
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com'),
    (SELECT prf_id FROM VITALIS_SCHEMA.vitalis_perfiles WHERE prf_nombre = 'Administrador')
);

-- 4. Insertar Tipo de Planilla
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas (
    tpl_codigo, tpl_nombre, tpl_descripcion, 
    tpl_tipo_personal, tpl_estado
) VALUES (
    1, 'Planilla Médica', 'Planilla para personal médico', 'M', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas (
    tpl_codigo, tpl_nombre, tpl_descripcion, 
    tpl_tipo_personal, tpl_estado
) VALUES (
    2, 'Planilla Admin', 'Planilla para personal administrativo', 'A', 'A'
);

-- 5. Insertar datos geográficos básicos
INSERT INTO VITALIS_SCHEMA.vitalis_paises (
    pai_codigo, pai_nombre, pai_estado
) VALUES (
    'CR', 'Costa Rica', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia (
    pai_id, pro_codigo, pro_nombre, pro_estado, pro_version
) VALUES (
    (SELECT pai_id FROM VITALIS_SCHEMA.vitalis_paises WHERE pai_codigo = 'CR'),
    '1', 'San José', 'A', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones (
    can_codigo, can_nombre, can_estado, can_pro_id
) VALUES (
    1, 'Central', 'A',
    (SELECT pro_id FROM VITALIS_SCHEMA.vitalis_provincia WHERE pro_nombre = 'San José')
);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos (
    dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id
) VALUES (
    1, 'Carmen', 'A', 1,
    (SELECT can_id FROM VITALIS_SCHEMA.vitalis_cantones WHERE can_nombre = 'Central')
);

-- 6. Insertar Centro de Salud
INSERT INTO VITALIS_SCHEMA.vitalis_centros_salud (
    csa_codigo, csa_nombre, csa_direccion_exacta, 
    csa_telefono, csa_email, csa_contacto_principal, 
    csa_telefono_contacto, csa_estado, csa_dis_id
) VALUES (
    1, 'Centro Vitalis', '100m norte del parque central',
    '2222-3333', 'info@vitalis.com', 'Dr. Rodriguez',
    '8888-9999', 'A',
    (SELECT dis_id FROM VITALIS_SCHEMA.vitalis_distritos WHERE dis_nombre = 'Carmen')
);

-- 7. Insertar Puesto Turno
INSERT INTO VITALIS_SCHEMA.vitalis_puestos_turnos (
    put_dia_semana, put_monto_cobrar, put_monto_pagar, 
    put_tipo_pago, put_fecha_inicio, put_fecha_fin, 
    put_max_personas, put_min_persona, put_nombre, 
    put_hora_inicio, put_hora_fin, put_especialidad, 
    put_salario, put_csa_id, put_per_id
) VALUES (
    1, 5000, 4000,
    'TURNO', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'),
    3, 1, 'Turno Mañana',
    TIMESTAMP '2025-01-01 08:00:00', TIMESTAMP '2025-01-01 16:00:00', 'Medicina General',
    450000,
    (SELECT csa_id FROM VITALIS_SCHEMA.vitalis_centros_salud WHERE csa_nombre = 'Centro Vitalis'),
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com')
);

-- 8. Insertar Escala Base
INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base (
    esd_dia_semana, esd_estado, esd_fecha_creacion, 
    esd_nombre, esd_dia_inicio, esd_dia_fin, 
    esd_per_id, esd_put_id
) VALUES (
    1, 'A', SYSDATE,
    'Escala Base Prueba', TO_DATE('2025-11-01', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'),
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com'),
    (SELECT put_id FROM VITALIS_SCHEMA.vitalis_puestos_turnos WHERE put_nombre = 'Turno Mañana')
);

COMMIT;
