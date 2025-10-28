#!/bin/bash

# Script de Switch Over Automático para Oracle Data Guard
# Ejecutar en el contenedor que se convertirá en nuevo PRIMARY

echo "=================================="
echo "  VITALIS SWITCH OVER SCRIPT"
echo "=================================="
echo "Este script convertirá este standby en el nuevo PRIMARY"
echo ""

# Verificar que estamos en el contenedor correcto
if [ "$ORACLE_SID" != "VITALISSB" ]; then
    echo "ERROR: Este script debe ejecutarse en el contenedor vitalis-standby (ORACLE_SID=VITALISSB)"
    exit 1
fi

echo "PASO 1: Verificando estado actual..."
sqlplus -s sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba <<EOF
SET PAGESIZE 0
SET FEEDBACK OFF
SELECT 'Estado actual: ' || database_role || ' - ' || open_mode FROM v$database;
EOF

echo ""
echo "PASO 2: Ejecutando Switch Over..."
echo "Convirtiendo standby a primary..."

sqlplus sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba <<EOF
-- Verificar que podemos hacer switch over
SELECT switchover_status FROM v$database;

-- Si el primary está disponible, hacer switch over normal
ALTER DATABASE COMMIT TO SWITCHOVER TO PRIMARY WITH SESSION SHUTDOWN;
SHUTDOWN IMMEDIATE;
STARTUP;

-- Si falla el comando anterior, hacer failover de emergencia
-- Descomentar la siguiente línea solo si el primary no responde:
-- ALTER DATABASE ACTIVATE STANDBY DATABASE;
EXIT;
EOF

if [ $? -eq 0 ]; then
    echo "✓ Switch over ejecutado exitosamente"
else
    echo "⚠ Switch over falló, intentando failover de emergencia..."
    sqlplus sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba <<EOF
    ALTER DATABASE ACTIVATE STANDBY DATABASE;
    SHUTDOWN IMMEDIATE;
    STARTUP;
    EXIT;
EOF
fi

echo ""
echo "PASO 3: Configurando parámetros del nuevo primary..."

sqlplus sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba <<EOF
-- Configurar destinos de archive log para el nuevo primary
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=$ORACLE_SID MANDATORY REOPEN=60' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=$ORACLE_MAIN_SID ASYNC VALID_FOR=(ONLINE_LOGFILES, PRIMARY_ROLE) DB_UNIQUE_NAME=$ORACLE_MAIN_SID DELAY=10' SCOPE=BOTH;

-- Configurar FAL para recuperación automática
ALTER SYSTEM SET FAL_SERVER=$ORACLE_MAIN_SID;
ALTER SYSTEM SET FAL_CLIENT=$ORACLE_SID;

-- Habilitar destinos
ALTER SYSTEM SET log_archive_dest_state_1=ENABLE SCOPE=BOTH;
ALTER SYSTEM SET log_archive_dest_state_2=ENABLE SCOPE=BOTH;

-- Forzar switch de logfile
ALTER SYSTEM SWITCH LOGFILE;
EXIT;
EOF

echo ""
echo "PASO 4: Actualizando configuración de red..."

# Actualizar tnsnames.ora
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

$ORACLE_MAIN_SID=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = $ORACLE_MAIN_SID)
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
EOF

# Actualizar listener.ora
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
      (SID_DESC = (GLOBAL_DBNAME = $ORACLE_SID) 
                  (ORACLE_HOME = $ORACLE_HOME) 
                  (SID_NAME = $ORACLE_SID) 
       ) 
    )

DEDICATED_THROUGH_BROKER_LISTENER=ON
DIAG_ADR_ENABLED = off
EOF

# Reiniciar listener
echo "Reiniciando listener..."
lsnrctl stop
sleep 2
lsnrctl start

echo ""
echo "PASO 5: Verificando nuevo primary..."

sqlplus -s sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba <<EOF
SET PAGESIZE 20
SET FEEDBACK ON
COLUMN name FORMAT A10
COLUMN database_role FORMAT A15
COLUMN open_mode FORMAT A12

SELECT 
    name,
    database_role,
    open_mode
FROM v$database;

-- Verificar PDBs
SHOW PDBS;

-- Crear tabla de verificación
CREATE TABLE switchover_test (
    id NUMBER,
    switchover_date DATE DEFAULT SYSDATE,
    mensaje VARCHAR2(100)
);

INSERT INTO switchover_test VALUES (1, SYSDATE, 'Switch Over completado exitosamente desde ' || USER);
COMMIT;

SELECT * FROM switchover_test;
EXIT;
EOF

echo ""
echo "=================================="
echo "✓ SWITCH OVER COMPLETADO"
echo "=================================="
echo ""
echo "🔗 INFORMACIÓN DE CONEXIÓN:"
echo "   Host: localhost"
echo "   Puerto: 1522 (Docker port mapping)"
echo "   SID: $ORACLE_SID"
echo "   PDB: $ORACLE_PDB"
echo "   Usuario: sys as sysdba"
echo "   Contraseña: $ORACLE_SID-$ORACLE_MAIN_SID-1"
echo ""
echo "📋 PRÓXIMOS PASOS:"
echo "1. Verificar conectividad con DBeaver usando los datos anteriores"
echo "2. Verificar que las aplicaciones puedan conectarse al nuevo primary"
echo "3. Si es necesario, recrear el standby ejecutando el script de inicialización"
echo ""
echo "🧪 PRUEBA RÁPIDA DE CONEXIÓN:"
echo "   sqlplus sys/$ORACLE_SID-$ORACLE_MAIN_SID-1@$ORACLE_SID as sysdba"
echo ""