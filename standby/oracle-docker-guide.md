# Guía de Implementación de Oracle Data Guard para Vitalis
## Manual de Instalación y Configuración de Base de Datos Standby

### Introducción

Este manual describe la implementación de Oracle Data Guard para el sistema Vitalis, proporcionando alta disponibilidad y protección de datos mediante una base de datos standby. La configuración utiliza contenedores Docker para simular un entorno de producción con dos servidores separados.

### Conceptos Fundamentales

#### Oracle Data Guard
Oracle Data Guard es una solución de alta disponibilidad, protección de datos y recuperación ante desastres que mantiene una o más copias standby de una base de datos primaria.

**Componentes principales:**
- **Base de datos primaria**: Base de datos de producción activa
- **Base de datos standby**: Copia sincronizada de la primaria
- **Redo Transport**: Servicio que transmite logs de redo
- **Log Apply**: Proceso que aplica cambios en la standby

#### Configuración del Proyecto Vitalis

**Arquitectura implementada:**
- Servidor primario: `vitalis-primary` (Puerto 1521)
- Servidor standby: `vitalis-standby` (Puerto 1522)
- Transferencia de logs cada 5 minutos o 50MB
- Aplicación automática de logs cada 10 minutos
- Limpieza automática de archivos aplicados (3 días de retención)

### Prerrequisitos

#### Requisitos del Sistema
- Docker Desktop instalado y funcionando
- Mínimo 12GB de RAM disponible
- Mínimo 50GB de espacio en disco
- Acceso a Oracle Container Registry

#### Requisitos de Red
- Puertos disponibles: 1521, 1522, 5500, 5501, 2221, 2222
- Conectividad entre contenedores

### Procedimiento de Instalación

#### Paso 1: Preparación del Entorno

1. **Clonar o descargar el proyecto Vitalis**
```bash
cd "C:\Users\kevin\Documentos\carpetaU\SegundoSemestre2025\Administración de Bases de Datos\ProyectoDb\vitalis_db\standby"
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
    │   ├── load_vitalis_data.sql
    │   └── backup_vitalis.sh
    └── standby/
        ├── initialize_vitalis.sh
        └── delete_obsolete_vitalis.sh
```

3. **Configurar permisos de ejecución (si es necesario)**
```bash
# En sistemas Unix/Linux
chmod +x scripts/main/*.sh
chmod +x scripts/standby/*.sh
```

#### Paso 2: Autenticación con Oracle Container Registry

```bash
docker login container-registry.oracle.com
```
*Usar credenciales de Oracle*

#### Paso 3: Construcción e Inicio de Contenedores

1. **Construir e iniciar los servicios**
```bash
docker compose up -d --build
```

2. **Verificar que los contenedores estén ejecutándose**
```bash
docker compose ps
```

3. **Monitorear los logs de inicialización**
```bash
# Logs del contenedor primario
docker compose logs -f vitalis-primary

# Logs del contenedor standby
docker compose logs -f vitalis-standby
```

#### Paso 4: Configuración Inicial

1. **Esperar a que la base de datos primaria esté lista**
```bash
docker compose exec vitalis-primary bash -c "
while ! sqlplus -s sys/Vitalis123 as sysdba <<< 'SELECT 1 FROM DUAL;' > /dev/null 2>&1; do
  echo 'Esperando que la base de datos primaria esté lista...'
  sleep 30
done
echo 'Base de datos primaria lista'"
```

2. **Cargar el esquema de Vitalis (si es necesario)**
```bash
docker compose exec vitalis-primary sqlplus sys/Vitalis123@VITALIS as sysdba @/home/oracle/scripts/load_vitalis_data.sql
```

#### Paso 5: Configuración de Data Guard

1. **Ejecutar configuración en la base primaria**
```bash
docker compose exec vitalis-primary bash /home/oracle/scripts/initialize_vitalis.sh
```

2. **Ejecutar configuración en la base standby**
```bash
docker compose exec vitalis-standby bash /home/oracle/scripts/initialize_vitalis.sh
```

### Configuración de Clientes de Base de Datos

#### Configuración para DBeaver

**Conexión a Base de Datos Primaria:**
- **Driver**: Oracle
- **Host**: localhost
- **Puerto**: 1521
- **Database/SID**: VITALIS (mayúsculas) o vitalis (minúsculas)
- **Usuario**: sys
- **Contraseña**: Vitalis123
- **Tipo de conexión**: SID
- **Rol**: SYSDBA

**Conexión a Base de Datos Standby:**
- **Driver**: Oracle
- **Host**: localhost
- **Puerto**: 1522
- **Database/SID**: VITALISSB (mayúsculas) o vitalissb (minúsculas)
- **Usuario**: sys
- **Contraseña**: Vitalis123
- **Tipo de conexión**: SID
- **Rol**: SYSDBA

**Nota importante**: Si una conexión falla, probar con la variante en el caso opuesto (mayúsculas/minúsculas) ya que Oracle puede generar automáticamente los nombres de servicios en minúsculas.

**Configuración alternativa usando Service Name:**
- **Tipo de conexión**: Service name
- **Service name primaria**: VITALIS o vitalis
- **Service name standby**: VITALISSB o vitalissb

#### Strings de Conexión para Aplicaciones

**Base Primaria:**
```
jdbc:oracle:thin:@localhost:1521:VITALIS
jdbc:oracle:thin:@localhost:1521:vitalis
```

**Base Standby:**
```
jdbc:oracle:thin:@localhost:1522:VITALISSB
jdbc:oracle:thin:@localhost:1522:vitalissb
```

### Verificación de la Configuración

#### Verificar Estado de la Base Primaria
```sql
-- Conectar a la base primaria
sqlplus sys/Vitalis123@localhost:1521/VITALIS as sysdba

-- Verificar modo de la base de datos
SELECT database_role, open_mode FROM v$database;

-- Verificar configuración de Data Guard
SELECT dest_name, status, destination FROM v$archive_dest WHERE dest_name IN ('LOG_ARCHIVE_DEST_1', 'LOG_ARCHIVE_DEST_2');

-- Verificar generación de logs
SELECT sequence#, first_time, applied FROM v$archived_log ORDER BY sequence# DESC;
```

#### Verificar Estado de la Base Standby
```sql
-- Conectar a la base standby (probar ambas variantes)
-- Mayúsculas (configuración manual):
sqlplus sys/Vitalis123@localhost:1522/VITALISSB as sysdba
-- Minúsculas (generación automática de Oracle):
sqlplus sys/Vitalis123@localhost:1522/vitalissb as sysdba

-- Verificar modo de la base de datos
SELECT database_role, open_mode FROM v$database;

-- Verificar aplicación de logs
SELECT process, status, sequence# FROM v$managed_standby;

-- Verificar último log aplicado
SELECT max(sequence#) FROM v$archived_log WHERE applied='YES';
```

#### Prueba de Sincronización
```sql
-- En la base primaria, crear una tabla de prueba
CREATE TABLE vitalis.test_sync (
    id NUMBER,
    fecha DATE DEFAULT SYSDATE,
    descripcion VARCHAR2(100)
);

INSERT INTO vitalis.test_sync VALUES (1, SYSDATE, 'Prueba de sincronización');
COMMIT;

-- Forzar switch de log
ALTER SYSTEM SWITCH LOGFILE;

-- En la base standby (después de unos minutos), verificar la tabla
SELECT * FROM vitalis.test_sync;
```

### Monitoreo y Mantenimiento

#### Scripts Automáticos Configurados

1. **Limpieza de Archive Logs**
   - Frecuencia: Cada 5 minutos
   - Retención: 3 días
   - Job: `PURGE_APPLIED_ARCHIVELOGS_VITALIS`

2. **Respaldo Automático**
   - Frecuencia: Diario
   - Incluye: Base de datos completa + archive logs
   - Transferencia automática al standby

#### Comandos de Monitoreo

```bash
# Verificar espacio en disco
docker compose exec vitalis-primary df -h /opt/oracle/oradata
docker compose exec vitalis-standby df -h /opt/oracle/oradata

# Verificar logs de aplicación
docker compose exec vitalis-standby tail -f /home/oracle/logs/delete_obsolete_vitalis.log

# Verificar procesos de Data Guard
docker compose exec vitalis-standby bash -c "ps aux | grep ora_mrp"
```

### Resolución de Problemas Comunes

#### 1. La base standby no está sincronizada

**Diagnóstico:**
```sql
-- En primaria
SELECT max(sequence#) FROM v$archived_log;

-- En standby
SELECT max(sequence#) FROM v$archived_log WHERE applied='YES';
```

**Solución:**
```sql
-- En standby, cancelar recuperación y reiniciar
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
```

#### 2. Error de conectividad entre bases

**Verificación:**
```bash
# Verificar conectividad de red
docker compose exec vitalis-primary ping vitalis-standby
docker compose exec vitalis-standby ping vitalis-primary

# Verificar listeners
docker compose exec vitalis-primary lsnrctl status
docker compose exec vitalis-standby lsnrctl status

# Probar conexiones con ambas variantes
# Primaria
sqlplus sys/Vitalis123@localhost:1521/VITALIS as sysdba
sqlplus sys/Vitalis123@localhost:1521/vitalis as sysdba

# Standby
sqlplus sys/Vitalis123@localhost:1522/VITALISSB as sysdba
sqlplus sys/Vitalis123@localhost:1522/vitalissb as sysdba
```

**Solución:**
```bash
# Reiniciar listeners
docker compose exec vitalis-primary lsnrctl reload
docker compose exec vitalis-standby lsnrctl reload
```

#### 3. Espacio insuficiente en disco

**Verificación:**
```bash
docker compose exec vitalis-primary df -h
docker compose exec vitalis-standby df -h
```

**Solución:**
```bash
# Ejecutar limpieza manual
docker compose exec vitalis-primary bash /home/oracle/scripts/backup_vitalis.sh
docker compose exec vitalis-standby bash /home/oracle/scripts/delete_obsolete_vitalis.sh
```

### Procedimientos de Emergencia

#### Switchover (Cambio Planificado)

1. **Verificar sincronización**
```sql
-- En primaria
SELECT max(sequence#) FROM v$archived_log;
```

2. **Preparar switchover**
```sql
-- En primaria
ALTER DATABASE COMMIT TO SWITCHOVER TO STANDBY;

-- En standby
ALTER DATABASE COMMIT TO SWITCHOVER TO PRIMARY;
```

#### Failover (Cambio de Emergencia)

1. **Activar standby como primaria**
```sql
-- En standby (nueva primaria)
ALTER DATABASE ACTIVATE STANDBY DATABASE;
ALTER DATABASE OPEN;
```

2. **Actualizar aplicaciones** para que apunten al nuevo puerto (1522)

### Automatización y Tareas Programadas

#### Configuración de Respaldos Automáticos

El sistema incluye un job automático que:
- Ejecuta respaldos completos diariamente
- Transfiere respaldos al servidor standby
- Mantiene retención de 7 días
- Limpia archivos obsoletos

#### Monitoreo Automático

Se recomienda implementar:
- Alertas por email para fallos de sincronización
- Monitoreo de espacio en disco
- Verificación de integridad de archive logs

### Mejores Prácticas

#### Seguridad
- Usar contraseñas robustas para todos los usuarios
- Configurar SSL/TLS para conexiones de red
- Implementar auditoría de accesos
- Restringir accesos por IP

#### Performance
- Monitorear regularmente el LAG de aplicación
- Configurar paralelismo en respaldos RMAN
- Optimizar parámetros de red según ancho de banda

#### Mantenimiento
- Ejecutar verificaciones semanales de sincronización
- Probar procedimientos de switchover mensualmente
- Mantener documentación actualizada
- Capacitar al personal en procedimientos de emergencia

### Conclusiones

Esta implementación de Oracle Data Guard para Vitalis proporciona:

1. **Alta Disponibilidad**: Protección contra fallos de hardware/software
2. **Protección de Datos**: Copia sincronizada en tiempo real
3. **Recuperación Rápida**: Switchover/Failover automatizado
4. **Mantenimiento Simplificado**: Scripts automatizados para tareas rutinarias
5. **Monitoreo Integrado**: Alertas y logs centralizados

La configuración es robusta y sigue las mejores prácticas de Oracle, garantizando la continuidad del negocio para el sistema Vitalis.

### Anexos

#### A. Variables de Entorno Utilizadas
- `ORACLE_SID=VITALIS` (Primaria)
- `ORACLE_STANDBY_SID=VITALISSB` (Standby)
- `ORACLE_PDB=VITALISPDB1` (PDB Primaria)
- `ORACLE_STANDBY_PDB=VITALISBPDB1` (PDB Standby)
- `ORACLE_PWD=Vitalis123`

**Nota**: Los nombres de servicios pueden aparecer en mayúsculas o minúsculas dependiendo de la configuración automática de Oracle.

#### B. Puertos y Servicios
- Puerto 1521: Base de datos primaria
- Puerto 1522: Base de datos standby  
- Puerto 5500/5501: Oracle Enterprise Manager
- Puerto 2221/2222: SSH para administración

#### C. Ubicaciones Importantes
- Datos: `/opt/oracle/oradata`
- Respaldos: `/opt/oracle/backup`
- Scripts: `/home/oracle/scripts`
- Logs: `/home/oracle/logs`

#### D. Variantes de Conexión (Mayúsculas/Minúsculas)

**Comandos SQL*Plus:**
```bash
# Base Primaria
sqlplus sys/Vitalis123@localhost:1521/VITALIS as sysdba    # Mayúsculas
sqlplus sys/Vitalis123@localhost:1521/vitalis as sysdba    # Minúsculas

# Base Standby
sqlplus sys/Vitalis123@localhost:1522/VITALISSB as sysdba  # Mayúsculas
sqlplus sys/Vitalis123@localhost:1522/vitalissb as sysdba  # Minúsculas
```

**Configuración DBeaver - Resumen Rápido:**
| Parámetro | Primaria | Standby |
|-----------|----------|---------|
| Host | localhost | localhost |
| Puerto | 1521 | 1522 |
| SID/Service | VITALIS o vitalis | VITALISSB o vitalissb |
| Usuario | sys | sys |
| Contraseña | Vitalis123 | Vitalis123 |
| Rol | SYSDBA | SYSDBA |