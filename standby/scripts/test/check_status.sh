#!/bin/bash

# Script de verificación rápida del estado de Data Guard
# Puede ejecutarse en cualquier contenedor para verificar el estado actual

echo "=================================="
echo "  VERIFICACIÓN ESTADO DATA GUARD"
echo "=================================="
echo ""

# Determinar en qué contenedor estamos
if [ "$ORACLE_SID" = "VITALIS" ]; then
    echo "📍 Ejecutando en: PRIMARY ORIGINAL (vitalis-primary)"
    CONNECTION_STRING="sys/VITALIS-VITALISSB-1@VITALIS as sysdba"
elif [ "$ORACLE_SID" = "VITALISSB" ]; then
    echo "📍 Ejecutando en: STANDBY/NEW PRIMARY (vitalis-standby)"
    CONNECTION_STRING="sys/VITALIS-VITALISSB-1@VITALISSB as sysdba"
else
    echo "❌ Error: ORACLE_SID no reconocido: $ORACLE_SID"
    exit 1
fi

echo ""
echo "🔍 VERIFICANDO ESTADO ACTUAL..."

sqlplus -s $CONNECTION_STRING <<EOF
SET PAGESIZE 0
SET FEEDBACK OFF
SET HEADING OFF

-- Estado de la base de datos
SELECT '🗄️  BASE DE DATOS: ' || name || ' | ROL: ' || database_role || ' | MODO: ' || open_mode FROM v$database;

-- Estado de destinos de archive log
SELECT '📤 DEST 1: ' || SUBSTR(destination,1,30) || ' | STATUS: ' || status FROM v$archive_dest WHERE dest_id = 1;
SELECT '📤 DEST 2: ' || SUBSTR(destination,1,30) || ' | STATUS: ' || status || CASE WHEN error IS NOT NULL THEN ' | ERROR: ' || error ELSE '' END FROM v$archive_dest WHERE dest_id = 2;

-- Último archive log
SELECT '📋 ÚLTIMO LOG: SEQ#' || MAX(sequence#) || ' | FECHA: ' || TO_CHAR(MAX(completion_time), 'DD/MM/YY HH24:MI:SS') FROM v$archived_log WHERE dest_id = 1;

-- Estado del listener
SELECT '🔗 LISTENER: Puerto 1521 activo' FROM dual WHERE EXISTS (SELECT 1 FROM v\$listener_network WHERE protocol = 'tcp');

EOF

echo ""
echo "🧪 PRUEBA DE CONECTIVIDAD..."

# Verificar conectividad con el otro servidor
if [ "$ORACLE_SID" = "VITALIS" ]; then
    echo "   Probando conexión a standby..."
    if sqlplus -s sys/VITALIS-VITALISSB-1@VITALISSB as sysdba <<< "SELECT 'Standby accesible' FROM dual;" > /dev/null 2>&1; then
        echo "   ✅ Standby responde correctamente"
    else
        echo "   ❌ Standby no responde"
    fi
else
    echo "   Probando conexión a primary original..."
    if sqlplus -s sys/VITALIS-VITALISSB-1@VITALIS as sysdba <<< "SELECT 'Primary accesible' FROM dual;" > /dev/null 2>&1; then
        echo "   ✅ Primary original responde correctamente"
    else
        echo "   ❌ Primary original no responde"
    fi
fi

echo ""
echo "📊 PDBs DISPONIBLES..."
sqlplus -s $CONNECTION_STRING <<EOF
SET PAGESIZE 10
SET FEEDBACK OFF
COLUMN name FORMAT A20
COLUMN open_mode FORMAT A12

SELECT '   📦 ' || name || ' | ' || open_mode as "PDB STATUS" FROM v\$pdbs WHERE name != 'PDB\$SEED';
EOF

echo ""
echo "=================================="
echo "✅ VERIFICACIÓN COMPLETADA"
echo "=================================="