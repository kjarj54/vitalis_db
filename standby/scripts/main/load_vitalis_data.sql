-- Script SQL para cargar datos iniciales de Vitalis
-- Este script carga el esquema básico de la base de datos Vitalis

-- Verificar conexión
SELECT 'Vitalis Database - Carga de datos inicial iniciada' as STATUS FROM DUAL;

-- Crear usuario VITALIS si no existe
DECLARE
    user_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO user_count FROM dba_users WHERE username = 'VITALIS';
    
    IF user_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE USER vitalis IDENTIFIED BY VitalisUser123';
        EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE, DBA TO vitalis';
        EXECUTE IMMEDIATE 'ALTER USER vitalis DEFAULT TABLESPACE USERS';
        EXECUTE IMMEDIATE 'ALTER USER vitalis QUOTA UNLIMITED ON USERS';
        DBMS_OUTPUT.PUT_LINE('Usuario VITALIS creado exitosamente');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Usuario VITALIS ya existe');
    END IF;
END;
/

-- Conectar como usuario VITALIS
CONNECT vitalis/VitalisUser123@VITALIS;

-- Ejecutar el script principal de Vitalis
-- Nota: Este comando asumiría que el archivo vitalis_script.SQL está disponible
-- En el entorno de contenedor, se podría copiar desde el volumen compartido

SELECT 'Configuración inicial de Vitalis completada' as STATUS FROM DUAL;

-- Verificar tablespaces
SELECT tablespace_name, status, contents 
FROM user_tablespaces 
ORDER BY tablespace_name;

-- Verificar objetos creados
SELECT object_type, COUNT(*) as cantidad
FROM user_objects
WHERE status = 'VALID'
GROUP BY object_type
ORDER BY object_type;