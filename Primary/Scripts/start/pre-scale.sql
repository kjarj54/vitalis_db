-- País
INSERT INTO VITALIS_SCHEMA.vitalis_paises (pai_id, pai_codigo, pai_nombre, pai_estado)
VALUES (VITALIS_SCHEMA.vitalis_paises_seq01.NEXTVAL, '506', 'Costa Rica', 'A');

-- Provincia
INSERT INTO VITALIS_SCHEMA.vitalis_provincia (pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (VITALIS_SCHEMA.vitalis_provincias_seq01.NEXTVAL, 1, 'SJ', 'San Jose', 'A', 1);

-- Canton
INSERT INTO VITALIS_SCHEMA.vitalis_cantones (can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (VITALIS_SCHEMA.vitalis_cantones_seq01.NEXTVAL, 101, 'Central', 'A', 1, 1);

-- Distrito
INSERT INTO VITALIS_SCHEMA.vitalis_distritos (dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (VITALIS_SCHEMA.vitalis_distritos_seq01.NEXTVAL, 1, 'Catedral', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_centros_salud (
    csa_id,
    csa_codigo,
    csa_nombre,
    csa_direccion_exacta,
    csa_telefono,
    csa_email,
    csa_contacto_principal,
    csa_telefono_contacto,
    csa_estado,
    csa_version,
    csa_dis_id
)
VALUES (
    VITALIS_SCHEMA.vitalis_centros_salud_seq01.NEXTVAL,
    101,
    'Clinica Central',
    'Avenida Principal 123',
    '2222-3333',
    'contacto@clinica.com',
    'Maria Lopez',
    '8888-7777',
    'A',
    1,
    1
);

INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id,
    per_nombre,
    per_apellido1,
    per_apellido2,
    per_estado_civil,
    per_fecha_nacimiento,
    per_sexo,
    per_email,
    per_estado,
    per_tipo_personal,
    per_version
)
VALUES (
    VITALIS_SCHEMA.vitalis_personas_seq01.NEXTVAL,
    'Juan',
    'Perez',
    'Rodriguez',
    'SOLTERO',
    TO_DATE('1985-06-10','YYYY-MM-DD'),
    'M',
    'juan.perez@example.com',
    'A',
    'MEDICO',
    1
);


INSERT INTO VITALIS_SCHEMA.vitalis_puestos_turnos (
    put_id,
    put_dia_semana,
    put_monto_cobrar,
    put_monto_pagar,
    put_tipo_pago,
    put_fecha_inicio,
    put_fecha_fin,
    put_max_personas,
    put_min_persona,
    put_nombre,
    put_hora_inicio,
    put_hora_fin,
    put_especialidad,
    put_salario,
    put_csa_id,   -- 👈 aquí debe existir ese ID
    put_per_id,
    put_version
)
VALUES (
    VITALIS_SCHEMA.vitalis_puestos_turno_seq01.NEXTVAL,
    2,
    50000,
    30000,
    'HORAS',
    TO_DATE('2025-01-01','YYYY-MM-DD'),
    TO_DATE('2025-12-31','YYYY-MM-DD'),
    3,
    1,
    'Turno Manana',
    TO_TIMESTAMP('07:00:00','HH24:MI:SS'),
    TO_TIMESTAMP('15:00:00','HH24:MI:SS'),
    'Medicina General',
    30000,
    1,   -- 👈 usa el CSA_ID que ya existe
    1,
    1
);

INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base (
    esd_id,
    esd_dia_semana,
    esd_estado,
    esd_version,
    esd_fecha_creacion,
    esd_nombre,
    esd_dia_inicio,
    esd_dia_fin,
    esd_per_id,
    esd_put_id
)
VALUES (
    VITALIS_SCHEMA.vitalis_escalas_base_seq01.NEXTVAL,
    1,  -- Lunes
    'A',
    1,
    SYSDATE,
    'Escala Base Lunes',
    TO_DATE('2025-01-01','YYYY-MM-DD'),
    TO_DATE('2025-12-31','YYYY-MM-DD'),
    1,   -- 👈 usa el PER_ID REAL que existe (según tu SELECT)
    2    -- 👈 usa el PUT_ID REAL
);


BEGIN
    VITALIS_SCHEMA.generar_escala_mensual(
        p_esd_id => 3,
        p_mes    => 11,
        p_anio   => 2025,
        p_csa_id => 1
    );
END;