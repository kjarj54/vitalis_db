-- Tipos de procedimientos base
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_procedimientos
(tpr_id, tpr_codigo, tpr_nombre, tpr_descripcion, 
 tpr_monto_base_cobrar, tpr_monto_base_pagar, 
 tpr_estado, tpr_version)
VALUES (1, 101, 'Consulta General', 'Atencion medica general',
        80000, 50000, 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_procedimientos
(tpr_id, tpr_codigo, tpr_nombre, tpr_descripcion, 
 tpr_monto_base_cobrar, tpr_monto_base_pagar, 
 tpr_estado, tpr_version)
VALUES (2, 102, 'Cirugia Menor', 'Procedimientos quirurgicos simples',
        150000, 100000, 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_procedimientos
(tpr_id, tpr_codigo, tpr_nombre, tpr_descripcion, 
 tpr_monto_base_cobrar, tpr_monto_base_pagar, 
 tpr_estado, tpr_version)
VALUES (3, 103, 'Emergencia', 'Atencion de emergencias leves o moderadas',
        120000, 80000, 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_procedimientos
(tpr_id, tpr_codigo, tpr_nombre, tpr_descripcion, 
 tpr_monto_base_cobrar, tpr_monto_base_pagar, 
 tpr_estado, tpr_version)
VALUES (4, 104, 'Chequeo Pediatrico', 'Revision medica infantil general',
        70000, 45000, 'A', 1);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_procedimientos
(tpr_id, tpr_codigo, tpr_nombre, tpr_descripcion, 
 tpr_monto_base_cobrar, tpr_monto_base_pagar, 
 tpr_estado, tpr_version)
VALUES (5, 105, 'Ultrasonido', 'Estudio por imagen de diagnostico basico',
        100000, 65000, 'A', 1);
