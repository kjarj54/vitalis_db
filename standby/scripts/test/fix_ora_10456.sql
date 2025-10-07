-- Script para resolver el error ORA-10456 y abrir standby READ only
-- Ejecutar en STANDBY como: sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba

-- PASO 1: Cancelar la sesión de recovery activa
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

-- PASO 2: Esperar 10-15 segundos para que termine completamente

-- PASO 3: Verificar que no hay procesos de recovery activos
SELECT process, status, client_process, sequence# 
FROM v$managed_standby 
WHERE status IN ('APPLYING_LOG', 'RECEIVING');

-- PASO 4: Si no hay procesos activos, abrir READ ONLY
ALTER DATABASE OPEN READ ONLY;

-- PASO 5: Verificar que se abrió correctamente
SELECT name, database_role, open_mode FROM v$database;

-- PASO 6: Realizar la prueba de sincronización
SELECT * FROM test_sync;

-- PASO 7: Cerrar y volver a modo recovery
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;