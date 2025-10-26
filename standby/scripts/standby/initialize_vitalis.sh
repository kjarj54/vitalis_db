#!/bin/bash

SCRIPT_PATH="/home/oracle/scripts/delete_obsolete_vitalis.sh"

echo "Iniciando SSH daemon..."
/usr/sbin/sshd

# Verificar que SSH esté activo
if ! pgrep -x "sshd" > /dev/null; then
    echo "ERROR: SSH daemon no se pudo iniciar"
    exit 1
fi

echo "SSH daemon iniciado correctamente."

echo "Creando los directorios necesarios."
mkdir -p /opt/oracle/oradata/$ORACLE_SID/recovery_files
mkdir -p /home/oracle/scp/
mkdir -p /home/oracle/scp/recovery_files/

echo "Directorios creados."

echo "Deteniendo base de datos para configuración inicial..."
/home/oracle/shutDown.sh immediate

echo "Configurando parámetros iniciales de Oracle..."
sqlplus sys/$ORACLE_PWD as sysdba <<EOF
    STARTUP NOMOUNT;
    ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS = (PROTOCOL=TCP)(HOST=vitalis-standby)(PORT=1521))';
    ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE = 'EXCLUSIVE' scope = spfile;
    ALTER SYSTEM SET REMOTE_OS_AUTHENT = FALSE scope = spfile;
    
    -- Parámetros para Data Guard Broker
    ALTER SYSTEM SET DG_BROKER_START=TRUE SCOPE=SPFILE;
    ALTER SYSTEM SET DG_BROKER_CONFIG_FILE1='/opt/oracle/oradata/$ORACLE_SID/dr1$ORACLE_SID.dat' SCOPE=SPFILE;
    ALTER SYSTEM SET DG_BROKER_CONFIG_FILE2='/opt/oracle/oradata/$ORACLE_SID/dr2$ORACLE_SID.dat' SCOPE=SPFILE;
    EXIT;
EOF

echo "Creando archivo de contraseñas Oracle..."
orapwd file=$ORACLE_HOME/dbs/orapw$ORACLE_SID password=$ORACLE_MAIN_SID-$ORACLE_SID-1 entries=10 force=y

echo "Configurando tnsnames.ora..."
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

echo "Configurando listener.ora..."
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
sleep 2
lsnrctl start

echo "Deteniendo base de datos para finalizar configuración..."
/home/oracle/shutDown.sh immediate

echo "Configuración de standby completada. El servidor está listo para recibir configuración desde primary."
echo "SSH daemon está activo y escuchando conexiones."
echo "Puedes proceder a ejecutar el script initialize_vitalis.sh en el contenedor primary."