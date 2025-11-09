INSERT INTO VITALIS_SCHEMA.vitalis_puestos_turnos (
    put_id, put_dia_semana, put_monto_cobrar, put_monto_pagar, put_tipo_pago,
    put_fecha_inicio, put_fecha_fin, put_max_personas, put_min_persona,
    put_version, put_nombre, put_hora_inicio, put_hora_fin,
    put_especialidad, put_salario, put_csa_id, put_per_id
) VALUES (
    1, 1, 80000, 60000, 'HORAS',
    TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
    3, 1, '1.0', 'Turno Nocturno',
    TO_TIMESTAMP('20:00','HH24:MI'), TO_TIMESTAMP('08:00','HH24:MI'),
    'Medicina General', 60000, 1, 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_puestos_turnos (
    put_id, put_dia_semana, put_monto_cobrar, put_monto_pagar, put_tipo_pago,
    put_fecha_inicio, put_fecha_fin, put_max_personas, put_min_persona,
    put_version, put_nombre, put_hora_inicio, put_hora_fin,
    put_especialidad, put_salario, put_csa_id, put_per_id
) VALUES (
    2, 2, 50000, 40000, 'HORAS',
    TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
    3, 1, '1.0', 'Diurno Admin',
    TO_TIMESTAMP('08:00','HH24:MI'), TO_TIMESTAMP('16:00','HH24:MI'),
    'Administracion', 40000, 1, 2
);
