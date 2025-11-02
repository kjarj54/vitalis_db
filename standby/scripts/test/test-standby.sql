-- Script de prueba para verificar el funcionamiento del servidor standby
-- Conectarse como: sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba


-- Verificar el estado de la base de datos standby
SELECT name, database_role, open_mode FROM v$database;

-- Verificar el estado de recovery
SELECT process, status, client_process, sequence# FROM v$managed_standby;

-- Verificar los archivos aplicados
SELECT max(sequence#) as "Last Applied" FROM v$archived_log WHERE applied='YES';

-- Verificar gap en la aplicación de logs
SELECT * FROM v$archive_gap;

-- Verificar el estado de Data Guard
SELECT dest_name, status, destination FROM v$archive_dest WHERE dest_name = 'LOG_ARCHIVE_DEST_1';

-- Verificar los archivos de log standby
SELECT group#, status, type, member FROM v$logfile ORDER BY group#;

-- NOTA: Para conectarse desde fuera del contenedor usar puerto 1522:
-- sqlplus sys/VITALIS-VITALISSB-1@localhost:1522/VITALISSB as sysdba
-- docker exec vitalis-standby cat /opt/oracle/product/19c/dbhome_1/network/admin/tnsnames.ora
-- docker exec vitalis-standby lsnrctl status
-- Verificar servicios disponibles en standby
SELECT name, database_role, open_mode FROM v$database;
EXIT;

-- Script para conectarse al PDB en el standby
-- 1. Conectarse al CDB standby
-- sqlplus sys/VITALIS-VITALISSB-1@localhost:1522/VITALISSB as sysdba

-- 2. Una vez conectado, cambiar al PDB
ALTER SESSION SET CONTAINER = VITALISPDB1;

-- 3. Verificar el estado del PDB
SELECT name, open_mode FROM v$pdbs WHERE name = 'VITALISPDB1';

-- 4. Si el PDB está cerrado, abrirlo (solo si es el primary)
-- ALTER PLUGGABLE DATABASE VITALISPDB1 OPEN READ ONLY;



-- Verificar servicios disponibles en standby
SELECT name, database_role, open_mode FROM v$database;

-- Verificar PDBs disponibles
SELECT name, open_mode FROM v$pdbs;

-- Verificar servicios registrados
SELECT name, network_name FROM v$services ORDER BY name;