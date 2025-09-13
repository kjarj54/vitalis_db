-- ================================================================
-- SCRIPT DE CREACIÓN DE TABLESPACES PARA VITALIS - LINUX
-- Base de Datos: Oracle 19c
-- Sistema Operativo: Linux
-- Descripción: Creación de tablespaces para datos e índices
-- ================================================================

-- Conectar como SYSDBA
-- CONNECT SYS AS SYSDBA

-- ================================================================
-- TABLESPACE PARA DATOS
-- ================================================================
CREATE TABLESPACE VITALIS_DATOS_TBS
    DATAFILE '/u01/app/oracle/oradata/ORCL/vitalis_datos01.dbf' 
    SIZE 500M
    AUTOEXTEND ON 
    NEXT 50M 
    MAXSIZE 2G
    EXTENT MANAGEMENT LOCAL 
    AUTOALLOCATE
    SEGMENT SPACE MANAGEMENT AUTO
    LOGGING;

-- Agregar archivo adicional para datos (opcional)
ALTER TABLESPACE VITALIS_DATOS_TBS 
    ADD DATAFILE '/u01/app/oracle/oradata/ORCL/vitalis_datos02.dbf' 
    SIZE 500M
    AUTOEXTEND ON 
    NEXT 50M 
    MAXSIZE 2G;

-- ================================================================
-- TABLESPACE PARA ÍNDICES
-- ================================================================
CREATE TABLESPACE VITALIS_INDEXES_TBS
    DATAFILE '/u01/app/oracle/oradata/ORCL/vitalis_indexes01.dbf' 
    SIZE 300M
    AUTOEXTEND ON 
    NEXT 30M 
    MAXSIZE 1G
    EXTENT MANAGEMENT LOCAL 
    AUTOALLOCATE
    SEGMENT SPACE MANAGEMENT AUTO
    LOGGING;

-- Agregar archivo adicional para índices (opcional)
ALTER TABLESPACE VITALIS_INDEXES_TBS 
    ADD DATAFILE '/u01/app/oracle/oradata/ORCL/vitalis_indexes02.dbf' 
    SIZE 300M
    AUTOEXTEND ON 
    NEXT 30M 
    MAXSIZE 1G;

-- ================================================================
-- VERIFICACIÓN DE TABLESPACES CREADOS
-- ================================================================
SELECT 
    tablespace_name,
    file_name,
    bytes/1024/1024 AS size_mb,
    maxbytes/1024/1024 AS max_size_mb,
    autoextensible,
    status
FROM dba_data_files 
WHERE tablespace_name IN ('VITALIS_DATOS_TBS', 'VITALIS_INDEXES_TBS')
ORDER BY tablespace_name, file_name;

-- ================================================================
-- CONSULTA PARA VERIFICAR ESPACIO DISPONIBLE
-- ================================================================
SELECT 
    tablespace_name,
    ROUND(SUM(bytes)/1024/1024, 2) AS total_mb,
    ROUND(SUM(maxbytes)/1024/1024, 2) AS max_total_mb
FROM dba_data_files 
WHERE tablespace_name IN ('VITALIS_DATOS_TBS', 'VITALIS_INDEXES_TBS')
GROUP BY tablespace_name
ORDER BY tablespace_name;

-- ================================================================
-- NOTAS DE CONFIGURACIÓN
-- ================================================================
/*
NOTAS IMPORTANTES:
1. Asegúrese de que el directorio /u01/app/oracle/oradata/ORCL/ exista
2. Modifique las rutas según su instalación específica de Oracle
3. Los tamaños pueden ajustarse según los requerimientos del proyecto
4. Verifique que el usuario oracle tenga permisos de escritura en el directorio
5. Ejecute este script conectado como SYSDBA

RUTAS ALTERNATIVAS COMUNES EN LINUX:
- Oracle Standard: /u01/app/oracle/oradata/ORCL/
- Oracle con SID personalizado: /u01/app/oracle/oradata/[SID]/
- Oracle en directorio personalizado: /opt/oracle/oradata/[SID]/

COMANDOS LINUX PREVIOS (ejecutar como root o usuario oracle):
# Crear directorio si no existe
mkdir -p /u01/app/oracle/oradata/ORCL
# Cambiar propietario
chown oracle:oinstall /u01/app/oracle/oradata/ORCL
# Dar permisos
chmod 755 /u01/app/oracle/oradata/ORCL

RECOMENDACIONES:
- Monitorear el crecimiento de los tablespaces regularmente
- Configurar alertas cuando el tablespace alcance el 85% de capacidad
- Considerar la distribución en diferentes discos para mejor rendimiento
- Implementar monitoreo de espacio en disco del sistema operativo
*/
