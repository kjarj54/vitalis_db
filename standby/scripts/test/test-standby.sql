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