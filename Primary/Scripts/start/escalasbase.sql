-- MEDICOS (4 personas: per_id 1–4)
INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (3, 3, 'A', 1, SYSDATE, 'Escala Base Medico Maria Rojas',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        2, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (4, 4, 'A', 1, SYSDATE, 'Escala Base Medico Jorge Lopez',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        3, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (5, 5, 'A', 1, SYSDATE, 'Escala Base Medico Laura Solan',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        4, 1);

-- ADMINISTRATIVOS (4 personas: per_id 5–8)
INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (6, 1, 'A', 1, SYSDATE, 'Escala Base Admin Diego Ramire',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        6, 2);

INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (7, 3, 'A', 1, SYSDATE, 'Escala Base Admin Elena Mende',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        7, 2);

INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base
(esd_id, esd_dia_semana, esd_estado, esd_version, esd_fecha_creacion,
 esd_nombre, esd_dia_inicio, esd_dia_fin, esd_per_id, esd_put_id)
VALUES (8, 5, 'A', 1, SYSDATE, 'Escala Base Admin Luis Gonzale',
        TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD'),
        8, 2);
