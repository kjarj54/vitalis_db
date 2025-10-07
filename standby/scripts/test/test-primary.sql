-- Script de prueba para verificar el funcionamiento del servidor principal
-- Conectarse como: sqlplus sys/VITALIS-VITALISSB-1@VITALIS as sysdba

-- Verificar el estado de la base de datos
SELECT name, database_role, open_mode FROM v$database;

-- Verificar el estado de Data Guard
SELECT dest_name, status, destination FROM v$archive_dest WHERE dest_name IN ('LOG_ARCHIVE_DEST_1','LOG_ARCHIVE_DEST_2');

-- Verificar los archivos de log
SELECT group#, status, type, member FROM v$logfile ORDER BY group#;

-- Generar switch de logfile para prueba
ALTER SYSTEM SWITCH LOGFILE;

-- Verificar que se están generando archive logs
SELECT name, dest_id, status FROM v$archived_log WHERE completion_time > SYSDATE - 1/24 ORDER BY completion_time DESC;

-- Verificar la sincronización con standby
SELECT dest_id, status, error FROM v$archive_dest WHERE dest_id = 2;