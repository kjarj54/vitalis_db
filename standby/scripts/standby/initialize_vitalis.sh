#!/bin/bash
# Script de inicialización para Vitalis Standby Database
# Adaptado para el proyecto Vitalis

echo "=== Iniciando configuración de Vitalis Standby Database ==="

# Configurar variables para el script de limpieza
SCRIPT_PATH="/home/oracle/scripts/delete_obsolete_vitalis.sh"

echo "Iniciando servicio SSH..."
/usr/sbin/sshd

echo "Creando directorios necesarios..."
mkdir -p /opt/oracle/oradata/$ORACLE_SID/recovery_files
mkdir -p /home/oracle/scp/
mkdir -p /home/oracle/scp/recovery_files/

echo "Apagando la instancia para reconfiguración..."
/home/oracle/shutDown.sh immediate

echo "Configurando parámetros iniciales de standby..."
sqlplus sys/$ORACLE_PWD as sysdba <<EOF
    STARTUP NOMOUNT;
    ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS = (PROTOCOL=TCP)(HOST=vitalis-standby)(PORT=1521))';
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = 'EXCLUSIVE' scope = spfile;
    ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE scope = spfile;
    EXIT;
EOF

echo "Creando archivo de contraseñas para standby..."
orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=Vitalis123 entries=10 force=y

echo "Configurando tnsnames.ora para standby..."
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

$ORACLE_MAIN_PDB=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_MAIN_PDB)
  )
)

$ORACLE_MAIN_SID=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_MAIN_SID)
  )
)
EOF

echo "Configurando listener.ora para standby..."
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

DEDICATED_THROUGH_BROKER_LISTENER=ON
DIAG_ADR_ENABLED = off
EOF

echo "Reiniciando listener..."
lsnrctl stop
lsnrctl start

echo "Apagando instancia standby..."
/home/oracle/shutDown.sh immediate

echo "=== Configuración de Vitalis Standby Database completada ==="
echo "Nota: La configuración final se completará cuando el script del primary se ejecute"