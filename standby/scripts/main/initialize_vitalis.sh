#!/bin/bash
# Script de inicialización para Vitalis Primary Database
# Adaptado para el proyecto Vitalis

echo "=== Iniciando configuración de Vitalis Primary Database ==="
echo "Creando directorios necesarios..."
mkdir -p /opt/oracle/oradata/$ORACLE_SID/recovery_files
mkdir -p /home/oracle/scp/
mkdir -p /home/oracle/scp/recovery_files/

echo "Directorios creados exitosamente"
echo "Configurando parámetros de Oracle Data Guard para Vitalis..."

sqlplus sys/$ORACLE_PWD as sysdba <<EOF
    -- Configuración básica de Data Guard
    ALTER SYSTEM SET DB_UNIQUE_NAME=$ORACLE_SID SCOPE=SPFILE;
    ALTER SYSTEM SET DB_RECOVERY_FILE_DEST_SIZE=10G SCOPE=BOTH;
    ALTER SYSTEM SET DB_RECOVERY_FILE_DEST='/opt/oracle/oradata/$ORACLE_SID/recovery_files' SCOPE=BOTH;
    
    -- Configuración de destinos de log archive
    ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=($ORACLE_SID,$ORACLE_STANDBY_SID)';
    ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=$ORACLE_SID MANDATORY REOPEN=60' SCOPE=BOTH;
    ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=$ORACLE_STANDBY_SID ASYNC VALID_FOR=(ONLINE_LOGFILES, PRIMARY_ROLE) DB_UNIQUE_NAME=$ORACLE_STANDBY_SID DELAY=10' SCOPE=BOTH;
    
    -- Habilitar destinos de archive log
    ALTER SYSTEM SET log_archive_dest_state_1=ENABLE SCOPE=BOTH;
    ALTER SYSTEM SET log_archive_dest_state_2=ENABLE SCOPE=BOTH;
    
    -- Configuración adicional de Data Guard
    ALTER SYSTEM SET standby_file_management=AUTO SCOPE=BOTH;
    ALTER SYSTEM SET ARCHIVE_LAG_TARGET=300 SCOPE=BOTH;
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE SCOPE=SPFILE;
    ALTER SYSTEM SET LOG_ARCHIVE_FORMAT='%t_%s_%r.arc' SCOPE=SPFILE;
    
    -- Configurar FAL (Fetch Archive Log) servers
    ALTER SYSTEM SET FAL_SERVER=$ORACLE_STANDBY_SID;
    ALTER SYSTEM SET FAL_CLIENT=$ORACLE_SID;
    
    -- Configurar conversión de nombres de archivos
    ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/' SCOPE=SPFILE;
    ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/' SCOPE=SPFILE;
    ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO;
    
    -- Configuración de listener
    ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS = (PROTOCOL=TCP)(HOST=vitalis-primary)(PORT=1521))';
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = 'EXCLUSIVE' scope = spfile;
    ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE scope = spfile;

    -- Agregar grupos de redo log adicionales
    ALTER DATABASE ADD LOGFILE GROUP 4 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo04.log') SIZE 50M;
    ALTER DATABASE ADD LOGFILE GROUP 5 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo05.log') SIZE 50M;
    ALTER DATABASE ADD LOGFILE GROUP 6 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo06.log') SIZE 50M;

    -- Realizar switch de logfiles para aplicar cambios
    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM CHECKPOINT;

    -- Eliminar grupos de redo log originales
    ALTER DATABASE DROP LOGFILE GROUP 1;
    ALTER DATABASE DROP LOGFILE GROUP 2;
    ALTER DATABASE DROP LOGFILE GROUP 3;

    EXIT;
EOF

echo "Parámetros configurados. Eliminando archivos de redo log físicos antiguos..."
rm -f $ORACLE_BASE/oradata/$ORACLE_SID/redo01.log
rm -f $ORACLE_BASE/oradata/$ORACLE_SID/redo02.log
rm -f $ORACLE_BASE/oradata/$ORACLE_SID/redo03.log

echo "Creando archivo de contraseñas Oracle..."
orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass entries=10 force=y

echo "Configurando tnsnames.ora y listener.ora..."

cat <<EOF > $ORACLE_HOME/network/admin/tnsnames.ora
$ORACLE_SID=localhost:1521/$ORACLE_PWD
$ORACLE_PDB=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_PDB)
  )
)

$ORACLE_SID=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_SID)
  )
)

$ORACLE_STANDBY_PDB=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_STANDBY_PDB)
  )
)

$ORACLE_STANDBY_SID=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_STANDBY_SID)
  )
)
EOF

cat <<EOF > $ORACLE_HOME/network/admin/listener.ora
LISTENER = 
(DESCRIPTION_LIST = 
  (DESCRIPTION = 
    (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1)) 
    (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521)) 
  ) 
) 

SID_LIST_LISTENER = 
   (SID_LIST = 
      (SID_DESC = (GLOBAL_DBNAME =  $ORACLE_SID) 
                  (ORACLE_HOME = $ORACLE_HOME) 
                  (SID_NAME =  $ORACLE_SID) 
       ) 
    )
EOF

echo "Archivos de red configurados exitosamente"
echo "Creando PFILE para la base de datos standby..."

sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass as sysdba <<EOF
  CREATE PFILE='/home/oracle/scp/init$ORACLE_STANDBY_SID.ora' FROM SPFILE;
  EXIT;
EOF

echo "PFILE creado. Modificando parámetros para standby..."
sed -i "
    s|*.audit_file_dest='/opt/oracle/admin/$ORACLE_SID/adump'|*.audit_file_dest='/opt/oracle/admin/$ORACLE_STANDBY_SID/adump'|g;
    s|*.control_files='/opt/oracle/oradata/$ORACLE_SID/control01.ctl'|*.control_files='/opt/oracle/oradata/$ORACLE_STANDBY_SID/control01.ctl'|g;
    s|*.db_file_name_convert='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/'|*.db_file_name_convert='/$ORACLE_SID/','/$ORACLE_STANDBY_SID/'|g;
    s|*.db_recovery_file_dest='/opt/oracle/oradata/$ORACLE_SID/recovery_files'|*.db_recovery_file_dest='/opt/oracle/oradata/$ORACLE_STANDBY_SID/recovery_files'|g;
    s|*.db_unique_name='$ORACLE_SID'|*.db_unique_name='$ORACLE_STANDBY_SID'|g;
    s|*.dispatchers='(PROTOCOL=TCP) (SERVICE=${ORACLE_SID}XDB)'|*.dispatchers='(PROTOCOL=TCP) (SERVICE=${ORACLE_STANDBY_SID}XDB)'|g;
    s|*.fal_server='$ORACLE_SID'|*.fal_server='$ORACLE_SID'|g;
    s|*.fal_client='$ORACLE_STANDBY_SID'|*.fal_client='$ORACLE_STANDBY_SID'|g;
    s|*.log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=$ORACLE_SID MANDATORY REOPEN=60'|*.log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=$ORACLE_STANDBY_SID MANDATORY REOPEN=60'|g;
    s|*.log_archive_dest_2='service=$ORACLE_STANDBY_SID async valid_for=(online_logfiles, primary_role) db_unique_name=$ORACLE_STANDBY_SID DELAY=10'|*.log_archive_dest_2='service=$ORACLE_SID async valid_for=(online_logfiles, primary_role) db_unique_name=$ORACLE_SID DELAY=10'|g;
    s|*.log_file_name_convert='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/'|*.log_file_name_convert='/$ORACLE_SID/','/$ORACLE_STANDBY_SID/'|g;
" "/home/oracle/scp/init$ORACLE_STANDBY_SID.ora"

echo "Transfiriendo PFILE a la base de datos standby..."
# Nota: Este comando requiere que SSH esté configurado entre contenedores
scp /home/oracle/scp/init$ORACLE_STANDBY_SID.ora oracle@vitalis-standby:/home/oracle/scp/

echo "Configurando base de datos standby..."
sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_STANDBY_SID AS SYSDBA <<EOF
CREATE SPFILE FROM PFILE='/home/oracle/scp/init$ORACLE_STANDBY_SID.ora';
STARTUP NOMOUNT;
EXIT
EOF

echo "Ejecutando duplicación RMAN para crear standby..."
rman TARGET sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_SID AUXILIARY sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_STANDBY_SID <<EOF
DUPLICATE TARGET DATABASE FOR STANDBY FROM ACTIVE DATABASE
DORECOVER
NOFILENAMECHECK;
EOF

echo "Configurando recuperación automática en standby..."
rman target sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_STANDBY_SID <<EOF
CROSSCHECK ARCHIVELOG ALL;
DELETE EXPIRED ARCHIVELOG ALL;
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
EOF

echo "Configurando política de eliminación de archive logs..."
rman TARGET sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_SID <<EOF
CONFIGURE ARCHIVELOG DELETION POLICY TO APPLIED ON ALL STANDBY;
EOF

echo "Configurando job de limpieza automática de archive logs..."
sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-VitalisPass@$ORACLE_SID AS SYSDBA <<EOF
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'PURGE_APPLIED_ARCHIVELOGS_VITALIS',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                              CROSSCHECK ARCHIVELOG ALL; 
                              DELETE NOPROMPT ARCHIVELOG ALL APPLIED ON STANDBY;
                            END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MINUTELY; INTERVAL=5',
        enabled         => TRUE
    );
END;
/
EXIT;
EOF

echo "=== Configuración de Vitalis Primary Database completada exitosamente ==="