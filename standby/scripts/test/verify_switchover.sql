-- Script de verificación post-switch over
-- Ejecutar después de completar el switch over para verificar el funcionamiento

SET PAGESIZE 50
SET LINESIZE 120
COLUMN name FORMAT A12
COLUMN database_role FORMAT A16
COLUMN open_mode FORMAT A12
COLUMN switchover_status FORMAT A20
COLUMN dest_name FORMAT A20
COLUMN status FORMAT A10
COLUMN destination FORMAT A30

PROMPT =========================================
PROMPT   VERIFICACIÓN POST-SWITCH OVER
PROMPT =========================================
PROMPT

PROMPT 1. ESTADO DE LA BASE DE DATOS:
SELECT 
    name,
    database_role,
    open_mode,
    switchover_status
FROM v$database;

PROMPT
PROMPT 2. ESTADO DE LOS DESTINOS DE ARCHIVE LOG:
SELECT 
    dest_name,
    status,
    destination
FROM v$archive_dest 
WHERE dest_name IN ('LOG_ARCHIVE_DEST_1','LOG_ARCHIVE_DEST_2');

PROMPT
PROMPT 3. ESTADO DE LAS PDBs:
SHOW PDBS;

PROMPT
PROMPT 4. ÚLTIMOS ARCHIVE LOGS GENERADOS:
SELECT 
    name,
    completion_time,
    dest_id
FROM v$archived_log 
WHERE completion_time > SYSDATE - 1/24 
ORDER BY completion_time DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT
PROMPT 5. VERIFICACIÓN DE CONECTIVIDAD A PDB:
ALTER SESSION SET CONTAINER=VITALISBPDB1;

PROMPT    - Creando tabla de prueba en PDB...
CREATE TABLE pdb_switchover_test (
    id NUMBER,
    test_date DATE DEFAULT SYSDATE,
    mensaje VARCHAR2(100)
) ;

INSERT INTO pdb_switchover_test VALUES (1, SYSDATE, 'Conexión a PDB exitosa post-switch over');
COMMIT;

SELECT * FROM pdb_switchover_test;

PROMPT
PROMPT 6. INFORMACIÓN DE CONEXIÓN PARA DBEAVER:
PROMPT    Host: localhost
PROMPT    Puerto: 1522
PROMPT    SID: VITALISSB (para CDB)
PROMPT    Service Name: VITALISBPDB1 (para PDB)
PROMPT    Usuario: sys as sysdba
PROMPT    Contraseña: VITALIS-VITALISSB-1

-- Volver al CDB
ALTER SESSION SET CONTAINER=CDB$ROOT;

PROMPT
PROMPT =========================================
PROMPT   VERIFICACIÓN COMPLETADA
PROMPT =========================================