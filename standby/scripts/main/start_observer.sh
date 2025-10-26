#!/bin/bash
# Script simple para iniciar el Observer de Fast-Start Failover

echo "=== Iniciando Observer para Fast-Start Failover ==="
echo "El Observer monitorea la primary y ejecuta failover automático si es necesario"
echo ""

# Crear directorio para logs del observer
mkdir -p /home/oracle/observer_logs

echo "Conectando como Observer..."
echo "CTRL+C para detener el Observer"

# Iniciar Observer - se ejecuta en foreground para monitoreo
dgmgrl sys/$ORACLE_MAIN_SID-$ORACLE_SID-1@$ORACLE_MAIN_SID <<EOF
START OBSERVER FILE='/home/oracle/observer_logs/fsfo.dat' LOGFILE='/home/oracle/observer_logs/observer.log';
EOF