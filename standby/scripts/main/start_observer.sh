#!/bin/bash

echo "Iniciando Data Guard Observer para Fast-Start Failover..."
echo "Presiona CTRL+C para detener el Observer"
echo "IMPORTANTE: El Observer debe mantenerse ejecutándose para failover automático"

# Crear directorio para logs del observer si no existe
mkdir -p /home/oracle/observer_logs

echo "Conectando al Data Guard Broker..."

# Iniciar el Observer
dgmgrl -silent sys/$ORACLE_SID-$ORACLE_STANDBY_SID-1@$ORACLE_SID <<EOF
START OBSERVER FILE IS '/home/oracle/observer_logs/observer.log';
EOF