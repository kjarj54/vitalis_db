-- ======= MEDICOS =======
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    1, 'Carlos', 'Mora', 'Jimenez', 'Soltero',
    TO_DATE('1988-05-12','YYYY-MM-DD'), 'M', 'carlos.mora@correo.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    2, 'Maria', 'Rojas', 'Campos', 'Casada',
    TO_DATE('1985-03-09','YYYY-MM-DD'), 'F', 'maria.rojas@correo.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    3, 'Jorge', 'Lopez', 'Rodriguez', 'Soltero',
    TO_DATE('1990-11-15','YYYY-MM-DD'), 'M', 'jorge.lopez@correo.com', 'A',
    'MEDICO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    4, 'Laura', 'Solano', 'Vega', 'Divorciada',
    TO_DATE('1992-07-01','YYYY-MM-DD'), 'F', 'laura.solano@correo.com', 'A',
    'MEDICO', 1
);

-- ======= ADMINISTRATIVOS =======
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    5, 'Ana', 'Jimenez', 'Vargas', 'Casada',
    TO_DATE('1990-07-08','YYYY-MM-DD'), 'F', 'ana.jimenez@correo.com', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    6, 'Diego', 'Ramirez', 'Castro', 'Soltero',
    TO_DATE('1993-02-20','YYYY-MM-DD'), 'M', 'diego.ramirez@correo.com', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    7, 'Elena', 'Mendez', 'Porras', 'Soltera',
    TO_DATE('1996-09-10','YYYY-MM-DD'), 'F', 'elena.mendez@correo.com', 'A',
    'ADMINISTRATIVO', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2, per_estado_civil,
    per_fecha_nacimiento, per_sexo, per_email, per_estado,
    per_tipo_personal, per_version
) VALUES (
    8, 'Luis', 'Gonzalez', 'Hernandez', 'Casado',
    TO_DATE('1987-12-02','YYYY-MM-DD'), 'M', 'luis.gonzalez@correo.com', 'A',
    'ADMINISTRATIVO', 1
);
