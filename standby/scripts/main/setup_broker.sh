#!/bin/bash

echo "=== CONFIGURACIÓN SIMPLE DE DATA GUARD BROKER ==="

# Configurar solo con la primary primero
echo "Paso 1: Configurando broker solo con PRIMARY..."
dgmgrl sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
REMOVE CONFIGURATION;
CREATE CONFIGURATION 'vitalis_dg' AS PRIMARY DATABASE IS 'vitalis' CONNECT IDENTIFIER IS 'vitalis';
ENABLE CONFIGURATION;
SHOW CONFIGURATION;
EXIT;
EOF

echo ""
echo "Paso 2: Presiona ENTER para continuar y agregar la STANDBY..."
read -p ""

# Agregar standby por separado
echo "Agregando STANDBY al broker..."
dgmgrl sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
ADD DATABASE 'vitalistb' AS CONNECT IDENTIFIER IS 'vitalistb' MAINTAINED AS PHYSICAL;
ENABLE DATABASE 'vitalistb';
SHOW CONFIGURATION;
EXIT;
EOF

echo ""
echo "=== CONFIGURACIÓN COMPLETADA ==="
echo ""
echo "FAILOVER MANUAL DISPONIBLE:"
echo ""
echo "1. SWITCHOVER (cambio planificado):"
echo "   dgmgrl sys/VITALIS-VITALISTB-1@vitalis"
echo "   DGMGRL> SWITCHOVER TO vitalistb;"
echo ""
echo "2. FAILOVER (emergencia):"
echo "   dgmgrl sys/VITALIS-VITALISTB-1@vitalis"
echo "   DGMGRL> FAILOVER TO vitalistb IMMEDIATE;"
echo ""
echo "3. Verificar estado:"
echo "   DGMGRL> SHOW CONFIGURATION;"