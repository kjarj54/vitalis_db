#!/bin/bash

echo "===========================================" 
echo "Script para arreglar listener después del switchover"
echo "==========================================="

# Verificar que estamos en el contenedor standby
if [ "$ORACLE_SID" != "VITALISSB" ]; then
    echo "ERROR: Este script debe ejecutarse en el contenedor vitalis-standby"
    echo "ORACLE_SID actual: $ORACLE_SID"
    exit 1
fi

echo "Paso 1: Deteniendo el listener actual..."
lsnrctl stop

echo "Paso 2: Configurando nuevo listener.ora para standby convertido en primary..."
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
      (SID_DESC = 
          (GLOBAL_DBNAME = VITALISSB) 
          (ORACLE_HOME = $ORACLE_HOME) 
          (SID_NAME = VITALISSB) 
       ) 
      (SID_DESC = 
          (GLOBAL_DBNAME = VITALISPDB1) 
          (ORACLE_HOME = $ORACLE_HOME) 
          (SID_NAME = VITALISSB) 
       ) 
    )

# Permitir registro dinámico de servicios
DEDICATED_THROUGH_BROKER_LISTENER=ON
DIAG_ADR_ENABLED = off
EOF

echo "Paso 3: Configurando nuevo tnsnames.ora para acceso local y externo..."
cat <<EOF > $ORACLE_HOME/network/admin/tnsnames.ora
# Configuración para CDB (acceso interno)
VITALISSB=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISSB)
  )
)

# Configuración para PDB (acceso interno)  
VITALISPDB1=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISPDB1)
  )
)

# Configuración para acceso desde host externo al CDB
VITALISSB_EXT=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISSB)
  )
)

# Configuración para acceso desde host externo a la PDB
VITALISPDB1_EXT=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISPDB1)
  )
)

# Mantener referencias al primary original (por si acaso)
VITALISPDB1=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISPDB1)
  )
)

VITALIS=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALIS)
  )
)
EOF

echo "Paso 4: Iniciando el listener..."
lsnrctl start
sleep 5

echo "Paso 5: Configurando Oracle para registrar servicios automáticamente..."
sqlplus sys/$ORACLE_PWD as sysdba <<EOF
-- Configurar parámetros para registro automático de servicios
ALTER SYSTEM SET LOCAL_LISTENER = '(ADDRESS = (PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521))' SCOPE=BOTH;
ALTER SYSTEM SET SERVICE_NAMES = 'VITALISSB,VITALISPDB1' SCOPE=BOTH;

-- Registrar servicios manualmente
ALTER SYSTEM REGISTER;

-- Verificar que la PDB esté abierta
SELECT name, open_mode FROM v\$pdbs;

-- Si la PDB no está abierta, abrirla
ALTER PLUGGABLE DATABASE VITALISPDB1 OPEN;

-- Crear servicio específico para la PDB para conexiones externas
BEGIN
  DBMS_SERVICE.CREATE_SERVICE(
    service_name => 'VITALISPDB1',
    network_name => 'VITALISPDB1'
  );
END;
/

-- Iniciar el servicio
BEGIN
  DBMS_SERVICE.START_SERVICE('VITALISPDB1');
END;
/

-- Registrar nuevamente todos los servicios
ALTER SYSTEM REGISTER;

-- Verificar servicios disponibles
SELECT name, network_name, creation_date FROM v\$services ORDER BY name;

-- Verificar estado de la base de datos y PDBs
SELECT name, database_role, open_mode FROM v\$database;
SELECT name, open_mode FROM v\$pdbs;

EXIT;
EOF

echo "Paso 6: Verificando el estado del listener..."
sleep 3
lsnrctl status

echo "Paso 7: Verificando servicios registrados..."
lsnrctl services

echo "===========================================" 
echo "Configuración completada!"
echo "==========================================="
echo ""
echo "Ahora puedes conectarte usando:"
echo ""
echo "Desde DENTRO del contenedor:"
echo "  CDB: sqlplus sys/$ORACLE_PWD@localhost:1521/VITALISSB as sysdba"
echo "  PDB: sqlplus sys/$ORACLE_PWD@localhost:1521/VITALISPDB1 as sysdba"
echo ""
echo "Desde FUERA del contenedor (tu máquina):"
echo "  CDB: sqlplus sys/$ORACLE_PWD@localhost:1522/VITALISSB as sysdba"  
echo "  PDB: sqlplus sys/$ORACLE_PWD@localhost:1522/VITALISPDB1 as sysdba"
echo ""
echo "Si aún tienes problemas, ejecuta este comando para verificar:"
echo "  docker exec vitalis-standby lsnrctl services"