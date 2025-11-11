INSERT INTO VITALIS_SCHEMA.vitalis_paises
(pai_id, pai_codigo, pai_nombre, pai_estado, pai_version)
VALUES (1, 'CR', 'Costa Rica', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_paises
(pai_id, pai_codigo, pai_nombre, pai_estado, pai_version)
VALUES (2, 'PA', 'Panama', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_paises
(pai_id, pai_codigo, pai_nombre, pai_estado, pai_version)
VALUES (3, 'NI', 'Nicaragua', 'A', 1);


-- ====== PROVINCIAS DE COSTA RICA ======
INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (1, 1, 'SJ', 'San Jose', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (2, 1, 'AL', 'Alajuela', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (3, 1, 'CA', 'Cartago', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (4, 1, 'HE', 'Heredia', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (5, 1, 'GU', 'Guanacaste', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (6, 1, 'PU', 'Puntarenas', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia
(pro_id, pai_id, pro_codigo, pro_nombre, pro_estado, pro_version)
VALUES (7, 1, 'LI', 'Limon', 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones
(can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (1, 101, 'San Jose', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones
(can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (2, 102, 'Alajuela', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones
(can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (3, 103, 'Cartago', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones
(can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (4, 104, 'Heredia', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones
(can_id, can_codigo, can_nombre, can_estado, can_version, can_pro_id)
VALUES (5, 105, 'Puntarenas', 'A', 1, 1);


-- Cantón: San Jose
INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (1, 10101, 'Carmen', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (2, 10102, 'Merced', 'A', 1, 1);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (3, 10103, 'Hospital', 'A', 1, 1);

-- Cantón: Alajuela
INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (4, 10201, 'San Josecito', 'A', 1, 2);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (5, 10202, 'Desamparados', 'A', 1, 2);

-- Cantón: Cartago
INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (6, 10301, 'Oriental', 'A', 1, 3);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (7, 10302, 'Occidental', 'A', 1, 3);

-- Cantón: Heredia
INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (8, 10401, 'Heredia Centro', 'A', 1, 4);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (9, 10402, 'San Francisco', 'A', 1, 4);

-- Cantón: Puntarenas
INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (10, 10501, 'Puntarenas Centro', 'A', 1, 5);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos
(dis_id, dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id)
VALUES (11, 10502, 'Barranca', 'A', 1, 5);


