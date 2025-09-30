#!/bin/bash
# Script para limpiar archive logs obsoletos en Vitalis Standby
# Este script se ejecuta automáticamente para mantener el espacio en disco

echo "=== Iniciando limpieza de archive logs obsoletos en Vitalis Standby ==="
echo "Fecha/Hora: $(date)"

# Variables de configuración
RETENTION_DAYS=3
LOG_FILE="/home/oracle/logs/delete_obsolete_vitalis.log"

# Crear directorio de logs si no existe
mkdir -p /home/oracle/logs

# Función de logging
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Iniciando proceso de limpieza de archive logs"

# Conectar a RMAN y limpiar archive logs aplicados
rman target / <<EOF | tee -a "$LOG_FILE"
CROSSCHECK ARCHIVELOG ALL;
DELETE NOPROMPT ARCHIVELOG ALL COMPLETED BEFORE 'SYSDATE-$RETENTION_DAYS' APPLIED ON STANDBY;
DELETE NOPROMPT EXPIRED ARCHIVELOG ALL;
LIST ARCHIVELOG ALL;
EXIT;
EOF

log_message "Limpieza de archive logs completada"

# Verificar espacio en disco
DISK_USAGE=$(df -h /opt/oracle/oradata | tail -1 | awk '{print $5}' | sed 's/%//')
log_message "Uso de disco actual: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 85 ]; then
    log_message "ADVERTENCIA: Uso de disco superior al 85%. Se requiere atención."
fi

echo "=== Limpieza completada ==="