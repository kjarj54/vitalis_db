-- Verificar estado de sincronización antes de abrir READ ONLY
-- Ejecutar en STANDBY como: sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba

-- 1. Verificar que no hay recovery activo
SELECT process, status, client_process, sequence# 
FROM v$managed_standby 
WHERE process LIKE 'MRP%' OR process LIKE 'RFS%';

-- 2. Verificar último log aplicado
SELECT max(sequence#) as "Last Applied Sequence" 
FROM v$archived_log 
WHERE applied='YES' AND dest_id=1;

-- 3. Verificar último log recibido
SELECT max(sequence#) as "Last Received Sequence" 
FROM v$archived_log 
WHERE dest_id=1;

-- 4. Verificar si hay gaps
SELECT * FROM v$archive_gap;

-- 5. Solo si NO hay recovery activo, intentar abrir READ ONLY
-- ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
-- ALTER DATABASE OPEN READ ONLY;