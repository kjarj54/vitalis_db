#!/bin/bash
# Script simple para configurar Data Guard Broker y Fast-Start Failover

echo "=== Configurando Data Guard Broker ==="

# 1. Crear configuración del broker
dgmgrl sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
CREATE CONFIGURATION vitalis_dg AS PRIMARY DATABASE IS $ORACLE_SID CONNECT IDENTIFIER IS $ORACLE_SID;
ADD DATABASE $ORACLE_STANDBY_SID AS CONNECT IDENTIFIER IS $ORACLE_STANDBY_SID MAINTAINED AS PHYSICAL;
ENABLE CONFIGURATION;
EOF

echo "=== Configurando Fast-Start Failover ==="

# 2. Configurar Fast-Start Failover
dgmgrl sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
EDIT CONFIGURATION SET PROTECTION MODE AS MAXAVAILABILITY;
EDIT DATABASE $ORACLE_SID SET PROPERTY FastStartFailoverTarget='$ORACLE_STANDBY_SID';
EDIT DATABASE $ORACLE_STANDBY_SID SET PROPERTY FastStartFailoverTarget='$ORACLE_SID';
EDIT CONFIGURATION SET FastStartFailoverThreshold=30;
ENABLE FAST_START FAILOVER;
EOF

echo "=== Configuración Data Guard Broker completada ==="
echo "Para iniciar el Observer, ejecuta:"
echo "dgmgrl sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID"
echo "START OBSERVER FILE='/home/oracle/fsfo.dat'"