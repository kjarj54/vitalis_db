-- ======= MEDICOS =======
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    1, 'Carlos', 'Mora', 'Jimenez', 'Soltero',
    TO_DATE('1988-05-12','YYYY-MM-DD'), 'M', 'james.rivera.nunez@gmail.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    2, 'Maria', 'Rojas', 'Campos', 'Casada',
    TO_DATE('1985-03-09','YYYY-MM-DD'), 'F', 'james.rivera.nunez@gmail.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    3, 'Jorge', 'Lopez', 'Rodriguez', 'Soltero',
    TO_DATE('1990-11-15','YYYY-MM-DD'), 'M', 'james.rivera.nunez@gmail.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    4, 'Laura', 'Solano', 'Vega', 'Divorciada',
    TO_DATE('1992-07-01','YYYY-MM-DD'), 'F', 'Kjarj54@gmail.com', 'A',
    'MEDICO', 1
);

-- ======= ADMINISTRATIVOS =======
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    5, 'Ana', 'Jimenez', 'Vargas', 'Casada',
    TO_DATE('1990-07-08','YYYY-MM-DD'), 'F', 'kevin.fallas.chavarria@est.una.ac.cr', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    6, 'Diego', 'Ramirez', 'Castro', 'Soltero',
    TO_DATE('1993-02-20','YYYY-MM-DD'), 'M', 'kevin.fallas.chavarria@est.una.ac.cr', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    7, 'Elena', 'Mendez', 'Porras', 'Soltera',
    TO_DATE('1996-09-10','YYYY-MM-DD'), 'F', 'Kjarj54@gmail.com', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    8, 'Luis', 'Gonzalez', 'Hernandez', 'Casado',
    TO_DATE('1987-12-02','YYYY-MM-DD'), 'M', 'Kjarj54@gmail.com', 'A',
    'ADMINISTRATIVO', 1
);


-- ============================================================================
-- Crear un perfil base si no existe (por ejemplo "ADMIN" o "DEFAULT")
-- ============================================================================
INSERT INTO VITALIS_SCHEMA.vitalis_perfiles (
    prf_id,
    prf_nombre,
    prf_descripcion,
    prf_estado
) VALUES (
    1,
    'ADMIN',
    'Perfil administrador general del sistema',
    'A'
);

COMMIT;


-- ============================================================================
--  CREACIÓN DE USUARIOS CON FECHAS DE ÚLTIMO ACCESO DIFERENTES
-- ============================================================================

-- Usuario con acceso hace 15 días
INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id,
    usu_login,
    usu_password,
    usu_fecha_creacion,
    usu_fecha_ultimo_acceso,
    usu_intentos_fallidos,
    usu_bloqueado,
    usu_estado,
    usu_per_id,
    usu_prf_id
) VALUES (
    101,
    'cmora',                      -- login
    '1234',                       -- password dummy
    SYSDATE - 120,                -- creado hace 120 días
    SYSDATE - 15,                 -- último acceso hace 15 días
    0,
    'N',                          -- no bloqueado
    'A',                          -- activo
    1,                            -- persona: Carlos Mora (MEDICO)
    1                             -- perfil genérico
);

-- Usuario con acceso hace 95 días
INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id,
    usu_login,
    usu_password,
    usu_fecha_creacion,
    usu_fecha_ultimo_acceso,
    usu_intentos_fallidos,
    usu_bloqueado,
    usu_estado,
    usu_per_id,
    usu_prf_id
) VALUES (
    102,
    'mrojas',
    '1234',
    SYSDATE - 150,
    SYSDATE - 95,                 -- último acceso hace 95 días
    1,
    'N',
    'A',
    2,                            -- persona: María Rojas
    1
);

-- Usuario con acceso hace 120 días
INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id,
    usu_login,
    usu_password,
    usu_fecha_creacion,
    usu_fecha_ultimo_acceso,
    usu_intentos_fallidos,
    usu_bloqueado,
    usu_estado,
    usu_per_id,
    usu_prf_id
) VALUES (
    103,
    'jlopez',
    '1234',
    SYSDATE - 180,
    SYSDATE - 120,                -- último acceso hace 120 días
    0,
    'N',
    'A',
    3,                            -- persona: Jorge López
    1
);

COMMIT;
