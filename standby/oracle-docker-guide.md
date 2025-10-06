# Guía de Implementación Oracle Data Guard Standby - Proyecto Vitalis

## Introducción

Esta guía describe el proceso completo para implementar una base de datos Oracle Data Guard standby para el sistema Vitalis. La configuración utiliza contenedores Docker para facilitar el despliegue y la administración de tanto la base de datos principal como la standby.

## Conceptos Fundamentales

### Oracle Data Guard
Oracle Data Guard es una funcionalidad que proporciona alta disponibilidad, protección de datos y recuperación ante desastres para bases de datos Oracle. Mantiene una o más réplicas (standby databases) sincronizadas con la base de datos principal (primary database).

### Componentes Principales
- **Primary Database**: Base de datos principal que recibe todas las transacciones
- **Standby Database**: Réplica de la base de datos principal que se mantiene sincronizada
- **Archive Logs**: Archivos que contienen los cambios realizados en la base de datos
- **Redo Logs**: Logs de transacciones en línea

## Arquitectura del Sistema

```
┌─────────────────┐    Archive Logs    ┌─────────────────┐
│                 │ ─────────────────→ │                 │
│ Primary DB      │                    │ Standby DB      │
│ (vitalis-       │ ←───────────────── │ (vitalis-       │
│  primary)       │    Status/Control   │  standby)       │
│ Puerto: 1521    │                    │ Puerto: 1522    │
└─────────────────┘                    └─────────────────┘
```

## Prerrequisitos

### Requerimientos del Sistema
- Docker y Docker Compose instalados
- Al menos 8GB de RAM disponible
- 50GB de espacio en disco libre
- Sistema operativo compatible con Docker

### Configuración de Red
- Puerto 1521: Base de datos primary
- Puerto 1522: Base de datos standby
- Puerto 5500: Oracle Enterprise Manager (primary)
- Puerto 5501: Oracle Enterprise Manager (standby)

## Proceso de Implementación

### Paso 1: Preparación del Entorno

1. **Clonar o descargar el proyecto**
   ```bash
   cd e:\carpetaU\SegundoSemestre2025\AdministracionDB\ProyectoDB\standby
   ```

2. **Verificar la estructura de archivos**
   ```
   standby/
   ├── docker-compose.yml
   ├── Dockerfile.vitalis-primary
   ├── Dockerfile.vitalis-standby
   └── scripts/
       ├── main/
       │   ├── initialize_vitalis.sh
       │   ├── backup_vitalis.sh
       │   ├── purge_applied_logs.sh
       │   ├── purge_complete_logs_in_standby.sh
       │   └── daily_backup.sh
       ├── standby/
       │   ├── initialize_vitalis.sh
       │   └── delete_obsolete_vitalis.sh
       └── test/
           ├── test-primary.sql
           └── test-standby.sql
   ```

### Paso 2: Construcción y Despliegue

1. **Construir y levantar los contenedores**
   ```bash
   docker-compose up -d
   ```

2. **Verificar que los contenedores estén ejecutándose**
   ```bash
   docker-compose ps
   ```

   Salida esperada:
   ```
   NAME               STATUS
   vitalis-primary    Up
   vitalis-standby    Up
   ```

### Paso 3: Inicialización de la Base de Datos Primary

1. **Conectar al contenedor primary**
   ```bash
   docker exec -it vitalis-primary bash
   ```

2. **Ejecutar el script de inicialización**
   ```bash
   cd /home/oracle/scripts
   chmod +x initialize_vitalis.sh
   ./initialize_vitalis.sh
   ```

   **Nota importante**: Durante la ejecución del script, se solicitará la contraseña SSH para conectarse al servidor standby. La contraseña por defecto es `oracle`.

### Paso 4: Inicialización de la Base de Datos Standby

1. **En una nueva terminal, conectar al contenedor standby**
   ```bash
   docker exec -it vitalis-standby bash
   ```

2. **Ejecutar el script de inicialización del standby**
   ```bash
   cd /home/oracle/scripts
   chmod +x initialize_vitalis.sh
   ./initialize_vitalis.sh
   ```

### Paso 5: Configuración de SSH entre Contenedores

Para que la replicación funcione correctamente, es necesario configurar la autenticación SSH sin contraseña entre los contenedores.

1. **En el contenedor primary, generar claves SSH**
   ```bash
   ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""
   ```

2. **Copiar la clave pública al standby**
   ```bash
   ssh-copy-id oracle@vitalis-standby
   ```

3. **Verificar la conexión**
   ```bash
   ssh oracle@vitalis-standby "hostname"
   ```

## Verificación del Funcionamiento

### Verificación en Primary Database

1. **Conectar a la base de datos primary**
   ```bash
   docker exec -it vitalis-primary sqlplus sys/VITALIS-VITALISSB-1@VITALIS as sysdba
   ```

2. **Ejecutar script de prueba**
   ```sql
   @/home/oracle/scripts/test/test-primary.sql
   ```

3. **Verificaciones importantes**:
   - Estado de la base de datos debe ser `PRIMARY` y `READ WRITE`
   - Los destinos de archive log deben estar `VALID`
   - Debe haber actividad en LOG_ARCHIVE_DEST_2

### Verificación en Standby Database

1. **Conectar a la base de datos standby**
   ```bash
   docker exec -it vitalis-standby sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba
   ```

2. **Ejecutar script de prueba**
   ```sql
   @/home/oracle/scripts/test/test-standby.sql
   ```

3. **Verificaciones importantes**:
   - Estado de la base de datos debe ser `PHYSICAL STANDBY`
   - El proceso MRP (Managed Recovery Process) debe estar activo
   - No debe haber gaps en la aplicación de logs

### Prueba de Sincronización

1. **En el primary, crear una tabla de prueba**
   ```sql
   CREATE TABLE test_sync (id NUMBER, fecha DATE);
   INSERT INTO test_sync VALUES (1, SYSDATE);
   COMMIT;
   ALTER SYSTEM SWITCH LOGFILE;
   ```

2. **En el standby, verificar que la tabla se sincronizó**
   ```sql
   ALTER DATABASE OPEN READ ONLY;
   SELECT * FROM test_sync;
   ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
   ```

## Monitoreo y Mantenimiento

### Scripts Automáticos Configurados

1. **PURGE_APPLIED_ARCHIVELOGS**: Se ejecuta cada 5 minutos
   - Limpia archive logs aplicados en el primary
   
2. **PURGE_APPLIED_ARCHIVELOGS_IN_STANDBY**: Se ejecuta diariamente
   - Limpia archive logs obsoletos en el standby
   
3. **REALIZE_BACKUP_DAILY**: Se ejecuta diariamente
   - Realiza backup completo y lo transfiere al standby

### Comandos de Monitoreo Útiles

1. **Ver estado de Data Guard**
   ```sql
   SELECT database_role, open_mode FROM v$database;
   ```

2. **Ver aplicación de logs en standby**
   ```sql
   SELECT process, status, sequence# FROM v$managed_standby;
   ```

3. **Ver gaps en la sincronización**
   ```sql
   SELECT * FROM v$archive_gap;
   ```

## Solución de Problemas Comunes

### Problema: Standby no recibe archive logs

**Síntomas**:
- LOG_ARCHIVE_DEST_2 muestra estado ERROR
- Hay gaps en v$archive_gap

**Solución**:
1. Verificar conectividad de red entre contenedores
2. Verificar configuración de tnsnames.ora
3. Reiniciar el listener en ambos servidores

```bash
lsnrctl stop
lsnrctl start
```

### Problema: Recovery process no está activo

**Síntomas**:
- v$managed_standby no muestra proceso MRP

**Solución**:
```sql
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
```

### Problema: Errores de autenticación SSH

**Síntomas**:
- Scripts de backup fallan con errores de SSH
- No se pueden transferir archivos entre servidores

**Solución**:
1. Reconfigurar claves SSH
2. Verificar permisos de archivos ~/.ssh/
3. Verificar conectividad de red

## Parámetros de Configuración Importantes

### Configuraciones de Archive Log
- `ARCHIVE_LAG_TARGET=300`: Fuerza switch de log cada 5 minutos
- `LOG_ARCHIVE_DEST_2`: Destino para envío a standby con delay de 10 segundos

### Configuraciones de Standby
- `STANDBY_FILE_MANAGEMENT=AUTO`: Gestión automática de archivos
- `FAL_SERVER` y `FAL_CLIENT`: Para recuperación automática de gaps

## Comandos de Administración

### Forzar Switch de Logfile
```sql
ALTER SYSTEM SWITCH LOGFILE;
```

### Detener Recovery en Standby
```sql
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
```

### Iniciar Recovery en Standby
```sql
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
```

### Abrir Standby en Read-Only
```sql
ALTER DATABASE OPEN READ ONLY;
```

## Backup y Recovery

### Backup Automático
El sistema está configurado para realizar backups automáticos diarios que incluyen:
- Base de datos completa
- Archive logs
- Control files

### Transferencia al Standby
Los backups se transfieren automáticamente al servidor standby para redundancia adicional.

## Recomendaciones de Seguridad

1. **Cambiar contraseñas por defecto**
2. **Configurar firewall para limitar acceso a puertos**
3. **Implementar monitoreo de logs de seguridad**
4. **Realizar pruebas de recuperación regulares**

## Conclusiones

La implementación de Oracle Data Guard para el proyecto Vitalis proporciona:

- **Alta Disponibilidad**: La base de datos standby puede activarse rápidamente en caso de fallo
- **Protección de Datos**: Los datos se replican automáticamente con un delay mínimo
- **Facilidad de Administración**: Los procesos automatizados reducen la intervención manual
- **Escalabilidad**: La arquitectura permite agregar más standby databases si es necesario

Esta configuración cumple con los requerimientos del proyecto de:
- Actualización automática cada 5 minutos (ARCHIVE_LAG_TARGET)
- Transferencia de información cada 10 minutos (LOG_ARCHIVE_DEST_2 DELAY)
- Limpieza automática de archivos obsoletos después de 3 días
- Respaldo diario automático con transferencia al standby

## Contacto y Soporte

Para soporte técnico o dudas sobre la implementación, consultar la documentación oficial de Oracle Data Guard o contactar al administrador de la base de datos.
