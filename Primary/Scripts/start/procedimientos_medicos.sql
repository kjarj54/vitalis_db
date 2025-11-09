-- =======================
--  Carlos Mora (per_id 1)
-- =======================
INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (10, TO_DATE('2025-10-03','YYYY-MM-DD'), TO_TIMESTAMP('08:00','HH24:MI'), TO_TIMESTAMP('08:30','HH24:MI'),
 'Rosa Vargas', '115670233', 'Consulta general de control',
 80000, 50000, 'A', 'N', 1, 1, 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (11, TO_DATE('2025-10-12','YYYY-MM-DD'), TO_TIMESTAMP('09:00','HH24:MI'), TO_TIMESTAMP('10:00','HH24:MI'),
 'Luis Acuna', '116890112', 'Emergencia nocturna leve',
 120000, 80000, 'A', 'N', 1, 1, 1, 3);

-- =======================
--  Maria Rojas (per_id 2)
-- =======================
INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (12, TO_DATE('2025-10-05','YYYY-MM-DD'), TO_TIMESTAMP('10:30','HH24:MI'), TO_TIMESTAMP('11:00','HH24:MI'),
 'Pedro Salas', '119003450', 'Chequeo pediatrico de rutina',
 70000, 45000, 'A', 'N', 1, 2, 1, 4);

INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (13, TO_DATE('2025-10-20','YYYY-MM-DD'), TO_TIMESTAMP('14:00','HH24:MI'), TO_TIMESTAMP('15:00','HH24:MI'),
 'Carolina Castro', '118002911', 'Ultrasonido abdominal',
 100000, 65000, 'A', 'N', 1, 2, 1, 5);

-- =======================
--  Jorge Lopez (per_id 3)
-- =======================
INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (14, TO_DATE('2025-10-09','YYYY-MM-DD'), TO_TIMESTAMP('08:45','HH24:MI'), TO_TIMESTAMP('09:45','HH24:MI'),
 'Roberto Vargas', '114560233', 'Cirugia menor de apendice superficial',
 150000, 100000, 'A', 'N', 1, 3, 1, 2);

INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (15, TO_DATE('2025-10-25','YYYY-MM-DD'), TO_TIMESTAMP('11:15','HH24:MI'), TO_TIMESTAMP('12:00','HH24:MI'),
 'Sofia Herrera', '119870991', 'Consulta general de control',
 80000, 50000, 'A', 'N', 1, 3, 1, 1);

-- =======================
--  Laura Solano (per_id 4)
-- =======================
INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (16, TO_DATE('2025-10-07','YYYY-MM-DD'), TO_TIMESTAMP('09:00','HH24:MI'), TO_TIMESTAMP('09:40','HH24:MI'),
 'Paola Rojas', '118902345', 'Chequeo pediatrico general',
 70000, 45000, 'A', 'N', 1, 4, 1, 4);

INSERT INTO VITALIS_SCHEMA.vitalis_procedimientos_medicos
(prm_id, prm_fecha_procedimiento, prm_hora_inicio, prm_hora_fin,
 prm_paciente_nombre, prm_paciente_cedula, prm_observaciones,
 prm_monto_cobrar, prm_monto_pagar, prm_estado, prm_procesado,
 prm_version, prm_per_id, prm_csa_id, prm_tpr_id)
VALUES (17, TO_DATE('2025-10-28','YYYY-MM-DD'), TO_TIMESTAMP('13:00','HH24:MI'), TO_TIMESTAMP('14:00','HH24:MI'),
 'Andres Castro', '116782244', 'Ultrasonido de abdomen',
 100000, 65000, 'A', 'N', 1, 4, 1, 5);
