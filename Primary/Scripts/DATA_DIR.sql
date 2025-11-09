-- 1. Primero, conéctate como SYSDBA
--En PL/SQL Developer, crea una nueva conexión:

--Username: SYS
--Password: VITALIS (o VITALIS-VITALISSB-1)
--Database: localhost:1521/VITALISPDB1
--Connect as: SYSDBA ⚠️ (esto es crítico)

CREATE OR REPLACE DIRECTORY DATA_DIR AS '/home/oracle/scripts';


GRANT READ ON DIRECTORY DATA_DIR TO VITALIS_SCHEMA;
GRANT WRITE ON DIRECTORY DATA_DIR TO VITALIS_SCHEMA;


SELECT * FROM dba_tab_privs 
WHERE grantee = 'VITALIS_SCHEMA' 
AND table_name = 'DATA_DIR';



-- 2. Luego, ejecuta el procedimiento para cargar los datos

SET SERVEROUTPUT ON SIZE UNLIMITED

BEGIN
    PRC_LOAD_REGISTER('DATA_DIR', 'PADRON_COMPLETO.txt');
END;
/




-- O si quieres eliminar y reiniciar la secuencia:
TRUNCATE TABLE vitalis_padron_nacional;
DELETE FROM vitalis_padron_nacional;
COMMIT;