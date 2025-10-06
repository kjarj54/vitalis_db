#!/bin/bash

echo "Creando los directorios necesarios."
mkdir -p /opt/oracle/oradata/$ORACLE_SID/recovery_files
mkdir /home/oracle/scp/

echo "Directorios creados"
echo "Ajustando los parametros para el amo de la standby"
sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1 as sysdba <<EOF
    ALTER SYSTEM SET DB_UNIQUE_NAME=$ORACLE_SID SCOPE=SPFILE;
    ALTER SYSTEM SET DB_RECOVERY_FILE_DEST_SIZE=40G SCOPE=BOTH;
    ALTER SYSTEM SET DB_RECOVERY_FILE_DEST='/opt/oracle/oradata/$ORACLE_SID/recovery_files' SCOPE=BOTH;
    ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=($ORACLE_SID,$ORACLE_STANDBY_SID)';
    ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=$ORACLE_SID MANDATORY REOPEN=60' SCOPE=BOTH;
    ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=$ORACLE_STANDBY_SID ASYNC VALID_FOR=(ONLINE_LOGFILES, PRIMARY_ROLE) DB_UNIQUE_NAME=$ORACLE_STANDBY_SID DELAY=10' SCOPE=BOTH;
    ALTER SYSTEM SET log_archive_dest_state_1=ENABLE SCOPE=BOTH;
    ALTER SYSTEM SET log_archive_dest_state_2=ENABLE SCOPE=BOTH;
    ALTER SYSTEM SET standby_file_management=AUTO SCOPE=BOTH;
    ALTER SYSTEM SET ARCHIVE_LAG_TARGET=300 SCOPE=BOTH;
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE SCOPE=SPFILE;
    ALTER SYSTEM SET LOG_ARCHIVE_FORMAT='%t_%s_%r.arc' SCOPE=SPFILE;
    ALTER SYSTEM SET FAL_SERVER=$ORACLE_STANDBY_SID;
    ALTER SYSTEM SET FAL_CLIENT=$ORACLE_SID;
    ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/' SCOPE=SPFILE;
    ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/$ORACLE_STANDBY_SID/','/$ORACLE_SID/' SCOPE=SPFILE;
    ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO;
    ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS = (PROTOCOL=TCP)(HOST=vitalis-primary)(PORT=1521))';
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = 'EXCLUSIVE' scope = spfile;
    ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE scope = spfile;

    ALTER DATABASE ADD LOGFILE GROUP 4 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo04.log') SIZE 50M;
    ALTER DATABASE ADD LOGFILE GROUP 5 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo05.log') SIZE 50M;
    ALTER DATABASE ADD LOGFILE GROUP 6 ('$ORACLE_BASE/oradata/$ORACLE_SID/recovery_files/redo06.log') SIZE 50M;

    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM SWITCH LOGFILE;
    ALTER SYSTEM CHECKPOINT;

    ALTER DATABASE DROP LOGFILE GROUP 1;
    ALTER DATABASE DROP LOGFILE GROUP 2;
    ALTER DATABASE DROP LOGFILE GROUP 3;

    ALTER SYSTEM SET LOG_FILE_SIZE = 50M SCOPE=BOTH;

    EXIT;
EOF

echo "Parametros creados. Eliminando redo logs fisicos"
rm $ORACLE_BASE/oradata/$ORACLE_SID/redo01.log
rm $ORACLE_BASE/oradata/$ORACLE_SID/redo02.log
rm $ORACLE_BASE/oradata/$ORACLE_SID/redo03.log

echo "Eliminados. Creando orapwd"
orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=$ORACLE_SID-$ORACLE_STANDBY_SID-1 entries=10 force=y

echo "Creado."
echo "Modificando el listener y el tnsnames.ora"

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

echo "tnsnames y listener modificado."
echo "Creando el pfile para la standby."

sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1 as sysdba <<EOF
  CREATE PFILE='/home/oracle/scp/init$ORACLE_STANDBY_SID.ora' FROM SPFILE;
  EXIT;
EOF

echo "Creados."
echo "Modificando pfile..."
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

echo "Trasladando el pfile a la standby. La contraseña es 'oracle'"
scp /home/oracle/scp/init$ORACLE_STANDBY_SID.ora oracle@vitalis-standby:/home/oracle/scp/

echo "Archivo copiado"
echo "Aplicando parametros en la Standby."
sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_STANDBY_SID AS SYSDBA <<EOF
CREATE SPFILE FROM PFILE='/home/oracle/scp/init$ORACLE_STANDBY_SID.ora';
STARTUP NOMOUNT;
EXIT
EOF

rman TARGET sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID AUXILIARY sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_STANDBY_SID <<EOF
DUPLICATE TARGET DATABASE FOR STANDBY FROM ACTIVE DATABASE
DORECOVER
NOFILENAMECHECK;
EOF

rman target sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_STANDBY_SID <<EOF
CROSSCHECK ARCHIVELOG ALL;
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
EOF

rman TARGET sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
CONFIGURE CONTROLFILE AUTOBACKUP ON;
CONFIGURE ARCHIVELOG DELETION POLICY TO SHIPPED TO ALL STANDBY;
EOF

sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID AS SYSDBA <<EOF
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'PURGE_APPLIED_ARCHIVELOGS',
        job_type        => 'EXECUTABLE',
        job_action      => '/home/oracle/scripts/purge_applied_logs.sh',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MINUTELY; INTERVAL=5',
        enabled         => TRUE
    );
END;
/
EXIT;
EOF

sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID AS SYSDBA <<EOF
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'PURGE_APPLIED_ARCHIVELOGS_IN_STANDBY',
        job_type        => 'EXECUTABLE',
        job_action      => '/home/oracle/scripts/purge_complete_logs_in_standby.sh',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=0',
        enabled         => TRUE
    );
END;
/
EXIT;
EOF

sqlplus sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID AS SYSDBA <<EOF
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'REALIZE_BACKUP_DAILY',
        job_type        => 'EXECUTABLE',
        job_action      => '/home/oracle/scripts/daily_backup.sh',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=0',
        enabled         => TRUE
    );
END;
/
EXIT;
EOF

echo "El script se ha ejecutado correctamente."
