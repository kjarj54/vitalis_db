#!/bin/bash
# Script de respaldo automático para Vitalis Database
# Se ejecuta diariamente para crear respaldos completos

echo "=== Iniciando respaldo automático de Vitalis Database ==="
echo "Fecha/Hora: $(date)"

# Variables de configuración
BACKUP_DIR="/opt/oracle/backup"
RETENTION_DAYS=7
LOG_FILE="$BACKUP_DIR/backup_vitalis_$(date +%Y%m%d).log"
BACKUP_TAG="VITALIS_DAILY_BACKUP_$(date +%Y%m%d)"

# Crear directorio de respaldo si no existe
mkdir -p "$BACKUP_DIR"

# Función de logging
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Iniciando respaldo completo de la base de datos Vitalis"

# Ejecutar respaldo con RMAN
rman target / <<EOF | tee -a "$LOG_FILE"
CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF $RETENTION_DAYS DAYS;
CONFIGURE BACKUP OPTIMIZATION ON;
CONFIGURE DEVICE TYPE DISK PARALLELISM 2;
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT '$BACKUP_DIR/vitalis_%d_%T_%s_%p';

BACKUP AS COMPRESSED BACKUPSET DATABASE 
PLUS ARCHIVELOG 
DELETE ALL INPUT 
TAG '$BACKUP_TAG';

BACKUP CURRENT CONTROLFILE TAG 'VITALIS_CONTROLFILE_$(date +%Y%m%d)';

DELETE NOPROMPT OBSOLETE;

CROSSCHECK BACKUP;
DELETE NOPROMPT EXPIRED BACKUP;

LIST BACKUP SUMMARY;
EOF

# Verificar el resultado del respaldo
if [ $? -eq 0 ]; then
    log_message "Respaldo completado exitosamente"
    
    # Transferir respaldo al servidor standby
    log_message "Transfiriendo respaldo al servidor standby..."
    scp "$BACKUP_DIR"/vitalis_* oracle@vitalis-standby:/opt/oracle/backup/
    
    if [ $? -eq 0 ]; then
        log_message "Transferencia al standby completada exitosamente"
    else
        log_message "ERROR: Fallo en la transferencia al standby"
    fi
else
    log_message "ERROR: Fallo en el respaldo de la base de datos"
fi

# Limpiar respaldos antiguos (más de retention_days días)
find "$BACKUP_DIR" -name "vitalis_*" -mtime +$RETENTION_DAYS -delete
log_message "Limpieza de respaldos antiguos completada"

# Verificar espacio disponible
DISK_USAGE=$(df -h "$BACKUP_DIR" | tail -1 | awk '{print $5}' | sed 's/%//')
log_message "Uso de disco en directorio de respaldos: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 85 ]; then
    log_message "ADVERTENCIA: Uso de disco superior al 85% en directorio de respaldos"
fi

echo "=== Respaldo automático completado ==="