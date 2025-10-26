# Data Guard con Fast-Start Failover - Configuración Simple

## ¿Qué se agregó?

### 1. **Parámetros en Oracle**
- `DG_BROKER_START=TRUE` - Habilita Data Guard Broker
- `DG_BROKER_CONFIG_FILE1/2` - Archivos de configuración del broker  
- `LOG_ARCHIVE_DEST_2` modificado para **SYNC** (síncrono) en lugar de ASYNC

### 2. **Scripts nuevos**
- `setup_broker.sh` - Configura Data Guard Broker automáticamente
- `start_observer.sh` - Inicia el Observer para failover automático
- `check_dg_status.sh` - Verifica estado del Data Guard

## Cómo funciona el failover automático

1. **Observer** monitorea la primary cada 30 segundos
2. Si la primary no responde por **30 segundos**, inicia failover automático
3. La **standby se convierte en nueva primary** automáticamente
4. Las aplicaciones deben reconectarse a la nueva primary

## Pasos para usar

### 1. Ejecutar configuración inicial
```bash
# En primary: ejecutar el script normal
./initialize_vitalis.sh
```

### 2. Iniciar Observer (en un terminal separado)
```bash
# En primary o en un servidor observer independiente
./start_observer.sh
```

### 3. Verificar estado
```bash
./check_dg_status.sh
```

## Comandos útiles del Data Guard Broker

```sql
-- Conectar al broker
dgmgrl sys/password@primary

-- Ver configuración
SHOW CONFIGURATION;

-- Ver estado del failover
SHOW FAST_START FAILOVER;

-- Realizar failover manual
FAILOVER TO standby_db;

-- Realizar switchover manual  
SWITCHOVER TO standby_db;
```

## Notas importantes

- **Observer debe estar ejecutándose** para failover automático
- **Timeout configurado a 30 segundos** (FastStartFailoverThreshold=30)
- **Modo MAXAVAILABILITY** - prioriza disponibilidad sobre rendimiento
- **SYNC replication** - garantiza cero pérdida de datos