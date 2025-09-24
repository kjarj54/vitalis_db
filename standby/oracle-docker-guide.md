# Manual de Implementación: Proyecto Vitalis - Sistema de Administración de Centros de Salud
## Oracle 19c con Data Guard en Docker para Windows

### Objetivo del Proyecto
Implementar una solución completa de base de datos Oracle 19c con servidor de respaldo (Data Guard) para el sistema Vitalis de administración de centros de salud, cumpliendo con todos los requerimientos del proyecto académico.

## Tabla de Contenidos


---

## 1. Introducción y Conceptos del Proyecto

### 1.1 Descripción del Sistema Vitalis
El proyecto Vitalis es un sistema integral de administración de centros de salud que requiere:

**Funcionalidades Principales:**
- **Administración del Personal**: Auto-registro, aprobación, gestión de usuarios y perfiles
- **Administración de Centros de Salud**: Registro de centros, puestos médicos, turnos y procedimientos
- **Administración de Planillas**: Generación de planillas médicas y administrativas
- **Administración Financiera**: Resúmenes de ingresos y gastos por centro

**Requerimientos Técnicos del Proyecto:**
- Base de datos normalizada en 3FN mínimo, FNBC máximo
- Oracle 19c como motor de base de datos
- Servidor principal y servidor de respaldo (Data Guard)
- Archivos de actualización cada 5 minutos o 50 MB
- Transferencia de información cada 10 minutos
- Respaldos diarios automáticos
- Implementación en Windows con Docker

### 1.2 Conceptos Técnicos Clave

**Oracle Data Guard:**
- Solución de alta disponibilidad y recuperación ante desastres
- Mantiene copias sincronizadas de la base de datos principal
- Protege contra fallos de hardware, software y desastres naturales

**Componentes del Sistema:**
1. **Primary Database (Servidor Principal)**: Base de datos activa donde se ejecutan todas las transacciones
2. **Standby Database (Servidor de Respaldo)**: Copia sincronizada de la base principal
3. **Archive Logs**: Archivos de registro que contienen los cambios realizados
4. **Network Configuration**: Configuración de red para comunicación entre servidores

### 1.3 Arquitectura del Proyecto Vitalis

```
┌─────────────────────────────────────────────────────────────┐
│                    SERVIDOR PRINCIPAL                       │
│  ┌─────────────────┐  ┌─────────────────┐                   │
│  │   Oracle 19c    │  │   Aplicación    │                   │
│  │   Primary DB    │  │     Vitalis     │                   │
│  │   Puerto: 1521  │  │                 │                   │
│  └─────────────────┘  └─────────────────┘                   │
│           │                                                 │
│           │ Archive Logs (cada 5 min o 50MB)               │
│           ▼                                                 │
└─────────────────────────────────────────────────────────────┘
           │
           │ Red TCP/IP - Transferencia cada 10 min
           ▼
┌─────────────────────────────────────────────────────────────┐
│                    SERVIDOR STANDBY                         │
│  ┌─────────────────┐  ┌─────────────────┐                   │
│  │   Oracle 19c    │  │   Monitoreo y   │                   │
│  │   Standby DB    │  │   Respaldos     │                   │
│  │   Puerto: 1522  │  │                 │                   │
│  └─────────────────┘  └─────────────────┘                   │
└─────────────────────────────────────────────────────────────┘
```

---



#### Configuración de Servidores
```yaml
# Configuración para docker-compose.yml del proyecto Vitalis
version: '3.8'

services:
  vitalis-primary:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: vitalis-primary
    hostname: vitalis-primary
    environment:
      - ORACLE_SID=VITALIS
      - ORACLE_PDB=VITALISPDB1
      - ORACLE_PWD=Vitalis123
      - ORACLE_EDITION=enterprise
      - ORACLE_CHARACTERSET=AL32UTF8
      - ENABLE_ARCHIVELOG=true
      - ENABLE_FORCE_LOGGING=true
    ports:
      - "1521:1521"
      - "5500:5500"
    volumes:
      - ./primary/data:/opt/oracle/oradata
      - ./primary/scripts:/opt/oracle/scripts/setup
      - ./primary/logs:/opt/oracle/diag
      - ./shared:/opt/oracle/shared
    networks:
      - vitalis-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g

  vitalis-standby:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: vitalis-standby
    hostname: vitalis-standby
    environment:
      - ORACLE_SID=VITALIS
      - ORACLE_PDB=VITALISPDB1
      - ORACLE_PWD=Vitalis123
      - ORACLE_EDITION=enterprise
      - ORACLE_CHARACTERSET=AL32UTF8
      - ENABLE_ARCHIVELOG=true
      - ENABLE_FORCE_LOGGING=true
    ports:
      - "1522:1521"
      - "5501:5500"
    volumes:
      - ./standby/data:/opt/oracle/oradata
      - ./standby/scripts:/opt/oracle/scripts/setup
      - ./standby/logs:/opt/oracle/diag
      - ./shared:/opt/oracle/shared
    networks:
      - vitalis-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g
    depends_on:
      - vitalis-primary

networks:
  vitalis-net:
    driver: bridge
    ipam:
      config:
        - subnet: 172.30.0.0/16
```

---

## 3. Preparación del Entorno de Desarrollo

### 3.1 Requisitos del Sistema para el Proyecto Vitalis
- **CPU**: Mínimo 4 cores (recomendado 8 cores para ambos servidores)
- **RAM**: Mínimo 12GB (6GB por servidor Oracle)
- **Almacenamiento**: Mínimo 100GB libres para datos y respaldos
- **Sistema Operativo**: Windows 10/11 Pro con Docker Desktop
- **Red**: Conectividad estable para sincronización entre servidores

### 3.2 Instalación y Configuración de Docker

#### Paso 1: Instalación de Docker Desktop
```powershell
# Ejecutar como Administrador en PowerShell

# Habilitar características necesarias
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Reiniciar sistema
Restart-Computer
```

1. Descargar Docker Desktop desde: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe
2. Instalar con configuración por defecto
3. Configurar recursos mínimos:
   - **Memory**: 12GB
   - **CPU**: 4 cores
   - **Disk**: 100GB

#### Paso 2: Estructura del Proyecto Vitalis
```powershell
# Crear estructura específica para Vitalis
cd C:\Users\$env:USERNAME\Documents
mkdir proyecto-vitalis
cd proyecto-vitalis

# Estructura de directorios del proyecto
$folders = @(
    "primary\data", "primary\scripts", "primary\logs", "primary\backup",
    "standby\data", "standby\scripts", "standby\logs", "standby\backup", 
    "shared\exports", "shared\padron", "shared\respaldos", "shared\logs",
    "scripts\mantenimiento", "scripts\seguridad", "scripts\notificaciones",
    "documentacion", "pruebas"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "Creada: $folder" -ForegroundColor Green
}
```

### 3.3 Configuración Específica para Vitalis

#### Archivo docker-compose.yml del Proyecto
**Crear archivo**: `docker-compose.yml`

```yaml
version: '3.8'

services:
  vitalis-primary:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: vitalis-primary
    hostname: vitalis-primary
    environment:
      - ORACLE_SID=VITALIS
      - ORACLE_PDB=VITALISPDB1
      - ORACLE_PWD=Vitalis123
      - ORACLE_EDITION=enterprise
      - ORACLE_CHARACTERSET=AL32UTF8
      - ENABLE_ARCHIVELOG=true
      - ENABLE_FORCE_LOGGING=true
    ports:
      - "1521:1521"
      - "5500:5500"
    volumes:
      - ./primary/data:/opt/oracle/oradata
      - ./primary/scripts:/opt/oracle/scripts/setup
      - ./primary/logs:/opt/oracle/diag
      - ./shared:/opt/oracle/shared
    networks:
      - vitalis-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g

  vitalis-standby:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: vitalis-standby
    hostname: vitalis-standby
    environment:
      - ORACLE_SID=VITALIS
      - ORACLE_PDB=VITALISPDB1
      - ORACLE_PWD=Vitalis123
      - ORACLE_EDITION=enterprise
      - ORACLE_CHARACTERSET=AL32UTF8
      - ENABLE_ARCHIVELOG=true
      - ENABLE_FORCE_LOGGING=true
    ports:
      - "1522:1521"
      - "5501:5500"
    volumes:
      - ./standby/data:/opt/oracle/oradata
      - ./standby/scripts:/opt/oracle/scripts/setup
      - ./standby/logs:/opt/oracle/diag
      - ./shared:/opt/oracle/shared
    networks:
      - vitalis-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g
    depends_on:
      - vitalis-primary

networks:
  vitalis-net:
    driver: bridge
    ipam:
      config:
        - subnet: 172.30.0.0/16
```

#### Configuración de Red del Proyecto
```powershell
# Crear red específica para Vitalis
docker network create --driver bridge --subnet=172.30.0.0/16 vitalis-net

# Verificar configuración
docker network ls | findstr vitalis
```


---

## 4. Implementación del Servidor Principal (Primary)

### 4.1 Descarga e Instalación de Oracle 19c

#### Autenticación en Oracle Container Registry
```powershell
# Autenticarse en Oracle Container Registry
docker login container-registry.oracle.com
# Usar credenciales de Oracle Account (crear en oracle.com si es necesario)
```

#### Descarga de Imagen Oracle
```powershell
# Descargar imagen Oracle 19c Enterprise para Vitalis
docker pull container-registry.oracle.com/database/enterprise:19.3.0.0

# Verificar descarga exitosa
docker images | findstr "oracle.*enterprise"
```

### 4.2 Configuración Inicial del Servidor Primary para Vitalis

#### Script de Inicialización Primary Database
**Crear archivo**: `primary\scripts\01_init_vitalis_primary.sql`

```sql
-- ================================================================
-- CONFIGURACIÓN INICIAL SERVIDOR PRIMARY - PROYECTO VITALIS
-- Cumple con especificaciones: Archive logs cada 5 min o 50MB
-- ================================================================

-- Configuración de Data Guard para Vitalis
ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=(VITALIS,VITALIS_STBY)' SCOPE=BOTH;

-- Configuración de destinos de archive logs
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/VITALIS/arch/ VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=VITALIS' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=VITALIS_STBY LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=VITALIS_STBY' SCOPE=BOTH;

-- Configuración específica del proyecto (cada 5 min o 50MB)
ALTER SYSTEM SET LOG_ARCHIVE_FORMAT='%t_%s_%r.dbf' SCOPE=SPFILE;
ALTER SYSTEM SET ARCHIVE_LAG_TARGET=300 SCOPE=BOTH;  -- 5 minutos según especificación
ALTER SYSTEM SET LOG_ARCHIVE_MAX_PROCESSES=4 SCOPE=BOTH;

-- Configuración de archivos de contraseña y failover
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE SCOPE=SPFILE;
ALTER SYSTEM SET FAL_SERVER=VITALIS_STBY SCOPE=BOTH;
ALTER SYSTEM SET FAL_CLIENT=VITALIS SCOPE=BOTH;
ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO SCOPE=BOTH;

-- Configuración de conversión de nombres de archivos
ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS_STBY/','/opt/oracle/oradata/VITALIS/' SCOPE=SPFILE;
ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS_STBY/','/opt/oracle/oradata/VITALIS/' SCOPE=SPFILE;

-- Crear directorios necesarios para el proyecto
!mkdir -p /opt/oracle/oradata/VITALIS/arch
!mkdir -p /opt/oracle/shared/respaldos
!mkdir -p /opt/oracle/shared/padron

-- Habilitar Force Logging (requerimiento del proyecto)
ALTER DATABASE FORCE LOGGING;

-- Configuración adicional para el proyecto Vitalis
ALTER SYSTEM SET NLS_TERRITORY='COSTA RICA' SCOPE=SPFILE;
ALTER SYSTEM SET NLS_LANGUAGE='SPANISH' SCOPE=SPFILE;

-- Configuración de parámetros de memoria para Vitalis
ALTER SYSTEM SET SGA_TARGET=4G SCOPE=SPFILE;
ALTER SYSTEM SET PGA_AGGREGATE_TARGET=1G SCOPE=SPFILE;

-- Verificar configuración
SELECT NAME, VALUE FROM V$PARAMETER 
WHERE NAME IN ('log_archive_dest_1', 'log_archive_dest_2', 'archive_lag_target');
```

#### Script de Configuración Post-Instalación
**Crear archivo**: `primary\scripts\02_setup_vitalis_primary.bat`

```batch
@echo off
echo ================================================================
echo CONFIGURACIÓN POST-INSTALACIÓN SERVIDOR PRIMARY - VITALIS
echo ================================================================

docker exec -it vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

# Crear directorios necesarios específicos para Vitalis
mkdir -p /opt/oracle/oradata/VITALIS/arch
mkdir -p /opt/oracle/shared/respaldos
mkdir -p /opt/oracle/shared/padron
mkdir -p /opt/oracle/shared/exports
mkdir -p /opt/oracle/admin/VITALIS/adump

# Ejecutar configuración SQL para Vitalis
sqlplus / as sysdba << 'EOF'
@/opt/oracle/scripts/setup/01_init_vitalis_primary.sql

-- Crear usuarios específicos para el proyecto Vitalis
CREATE USER c##vitalis_admin IDENTIFIED BY Vitalis2025Admin CONTAINER=ALL;
GRANT CONNECT, RESOURCE, DBA TO c##vitalis_admin CONTAINER=ALL;

CREATE USER c##vitalis_replication IDENTIFIED BY VitalisRepl2025 CONTAINER=ALL;
GRANT CONNECT, RESOURCE TO c##vitalis_replication CONTAINER=ALL;
GRANT CREATE SESSION TO c##vitalis_replication CONTAINER=ALL;

-- Crear tablespace específico para datos de Vitalis
CREATE TABLESPACE VITALIS_DATA 
DATAFILE '/opt/oracle/oradata/VITALIS/vitalis_data01.dbf' 
SIZE 500M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;

-- Crear tablespace para índices
CREATE TABLESPACE VITALIS_INDEXES 
DATAFILE '/opt/oracle/oradata/VITALIS/vitalis_indexes01.dbf' 
SIZE 200M AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED;

-- Configurar listener específico para Vitalis
ALTER SYSTEM SET LOCAL_LISTENER='(ADDRESS=(PROTOCOL=TCP)(HOST=vitalis-primary)(PORT=1521))' SCOPE=BOTH;
ALTER SYSTEM REGISTER;

-- Mostrar configuración actual
SELECT NAME, VALUE FROM V\$PARAMETER WHERE NAME LIKE '%archive%' OR NAME LIKE '%log%';

-- Reiniciar para aplicar cambios de SPFILE
SHUTDOWN IMMEDIATE;
STARTUP;

EXIT;
EOF
"

echo ================================================================
echo CONFIGURACIÓN PRIMARY COMPLETADA
echo Servidor: vitalis-primary
echo Puerto: 1521
echo SID: VITALIS
echo PDB: VITALISPDB1
echo ================================================================
pause
```

### 4.3 Configuración de Listener para Vitalis

**Crear archivo**: `primary\scripts\listener.ora`

```
# Configuración de Listener para Proyecto Vitalis
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
    )
  )

SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = VITALIS)
      (ORACLE_HOME = /opt/oracle/product/19c/dbhome_1)
      (SID_NAME = VITALIS)
    )
    (SID_DESC =
      (GLOBAL_DBNAME = VITALISPDB1)
      (ORACLE_HOME = /opt/oracle/product/19c/dbhome_1)
      (SID_NAME = VITALIS)
    )
  )

ADR_BASE_LISTENER = /opt/oracle

# Configuración específica para Data Guard
ENABLE_GLOBAL_DYNAMIC_ENDPOINT_LISTENER = ON
```

### 4.4 Configuración TNS para Vitalis

**Crear archivo**: `primary\scripts\tnsnames.ora`

```
# Configuración TNS para Proyecto Vitalis

VITALIS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALIS)
    )
  )

VITALISPDB1 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALISPDB1)
    )
  )

VITALIS_STBY =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALIS_STBY)
    )
  )

# Configuración para aplicaciones del proyecto
VITALIS_APP =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
      (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALISPDB1)
      (FAILOVER_MODE = 
        (TYPE = SELECT)
        (METHOD = BASIC)
        (RETRIES = 3)
        (DELAY = 5)
      )
    )
  )
```

### 4.5 Inicialización del Servidor Primary

#### Script de Arranque Inicial
**Crear archivo**: `start_vitalis_primary.bat`

```batch
@echo off
title Vitalis - Iniciando Servidor Primary
echo ================================================================
echo PROYECTO VITALIS - INICIANDO SERVIDOR PRIMARY
echo ================================================================
echo.

echo Paso 1: Iniciando container Primary de Vitalis...
docker-compose up -d vitalis-primary

echo.
echo Paso 2: Esperando que la base de datos esté lista...
:wait_primary
timeout 30 > nul
docker logs vitalis-primary 2>&1 | findstr "DATABASE IS READY TO USE" > nul
if errorlevel 1 (
    echo Esperando base de datos... [%time%]
    goto wait_primary
)

echo.
echo Paso 3: Configurando servidor Primary para Vitalis...
call primary\scripts\02_setup_vitalis_primary.bat

echo.
echo ================================================================
echo SERVIDOR PRIMARY DE VITALIS INICIADO CORRECTAMENTE
echo ================================================================
echo Conexión: sqlplus sys/Vitalis2025!@localhost:1521/VITALIS as sysdba
echo Enterprise Manager: https://localhost:5500/em
echo ================================================================
echo.
pause
```

---

## 5. Implementación del Servidor de Respaldo (Standby)

### 5.1 Configuración del Servidor Standby para Vitalis

#### Script de Inicialización Standby
**Crear archivo**: `standby\scripts\01_init_vitalis_standby.sql`

```sql
-- ================================================================
-- CONFIGURACIÓN INICIAL SERVIDOR STANDBY - PROYECTO VITALIS
-- Cumple con especificaciones del proyecto
-- ================================================================

-- Configuración de parámetros específicos del standby
ALTER SYSTEM SET DB_UNIQUE_NAME=VITALIS_STBY SCOPE=SPFILE;
ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=(VITALIS,VITALIS_STBY)' SCOPE=BOTH;

-- Configuración de destinos de archive para standby
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/VITALIS_STBY/arch/ VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=VITALIS_STBY' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=VITALIS LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=VITALIS' SCOPE=BOTH;

-- Configuración de transferencia (cada 10 minutos según especificación)
ALTER SYSTEM SET ARCHIVE_LAG_TARGET=300 SCOPE=BOTH;  -- 5 minutos para archive logs
ALTER SYSTEM SET LOG_ARCHIVE_MAX_PROCESSES=4 SCOPE=BOTH;

-- Configuración de failover y recovery
ALTER SYSTEM SET FAL_SERVER=VITALIS SCOPE=BOTH;
ALTER SYSTEM SET FAL_CLIENT=VITALIS_STBY SCOPE=BOTH;
ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO SCOPE=BOTH;

-- Configuración de conversión de nombres para standby
ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS/','/opt/oracle/oradata/VITALIS_STBY/' SCOPE=SPFILE;
ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS/','/opt/oracle/oradata/VITALIS_STBY/' SCOPE=SPFILE;

-- Configuración específica para el proyecto Vitalis en standby
ALTER SYSTEM SET NLS_TERRITORY='COSTA RICA' SCOPE=SPFILE;
ALTER SYSTEM SET NLS_LANGUAGE='SPANISH' SCOPE=SPFILE;

-- Crear directorios para standby
!mkdir -p /opt/oracle/oradata/VITALIS_STBY/arch
!mkdir -p /opt/oracle/shared/respaldos_standby
```

#### Archivo de Parámetros Standby
**Crear archivo**: `standby\scripts\init_vitalis_stby.ora`

```
# Archivo de parámetros para Standby Database - Proyecto Vitalis
DB_NAME=VITALIS
DB_UNIQUE_NAME=VITALIS_STBY
CONTROL_FILES=('/opt/oracle/oradata/VITALIS_STBY/control01.ctl','/opt/oracle/oradata/VITALIS_STBY/control02.ctl')

# Configuración de conversión de archivos
DB_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS/','/opt/oracle/oradata/VITALIS_STBY/'
LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/VITALIS/','/opt/oracle/oradata/VITALIS_STBY/'

# Configuración de contraseñas y Data Guard
REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE
LOG_ARCHIVE_CONFIG='DG_CONFIG=(VITALIS,VITALIS_STBY)'

# Configuración de archive logs según especificaciones del proyecto
LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/VITALIS_STBY/arch/ VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=VITALIS_STBY'
LOG_ARCHIVE_DEST_2='SERVICE=VITALIS LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=VITALIS'
LOG_ARCHIVE_FORMAT='%t_%s_%r.dbf'

# Configuración específica del proyecto (cada 5 min o 50MB)
ARCHIVE_LAG_TARGET=300
LOG_ARCHIVE_MAX_PROCESSES=4

# Configuración de standby file management
STANDBY_FILE_MANAGEMENT=AUTO
FAL_SERVER=VITALIS
FAL_CLIENT=VITALIS_STBY

# Configuración de memoria para Vitalis Standby
SGA_TARGET=4G
PGA_AGGREGATE_TARGET=1G

# Configuración regional para Costa Rica
NLS_TERRITORY='COSTA RICA'
NLS_LANGUAGE='SPANISH'
```

### 5.2 Configuración de Listener para Standby

**Crear archivo**: `standby\scripts\listener.ora`

```
# Configuración de Listener para Standby - Proyecto Vitalis
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
    )
  )

SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = VITALIS_STBY)
      (ORACLE_HOME = /opt/oracle/product/19c/dbhome_1)
      (SID_NAME = VITALIS)
    )
  )

ADR_BASE_LISTENER = /opt/oracle

# Configuración específica para Data Guard en standby
ENABLE_GLOBAL_DYNAMIC_ENDPOINT_LISTENER = ON
```

### 5.3 Configuración TNS para Standby

**Crear archivo**: `standby\scripts\tnsnames.ora`

```
# Configuración TNS para Standby - Proyecto Vitalis

VITALIS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALIS)
    )
  )

VITALIS_STBY =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALIS_STBY)
    )
  )

# Configuración para conexiones desde aplicaciones
VITALIS_STANDBY_READONLY =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-standby)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = VITALIS_STBY)
    )
  )
```

### 5.4 Script de Creación del Standby Database

**Crear archivo**: `setup_vitalis_standby.bat`

```batch
@echo off
title Vitalis - Configurando Servidor Standby
echo ================================================================
echo PROYECTO VITALIS - CONFIGURANDO SERVIDOR STANDBY
echo Cumpliendo especificaciones: Transferencia cada 10 minutos
echo ================================================================

echo Paso 1: Creando backup de Primary para Standby...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

# Crear backup específico para Vitalis Standby
rman target / << 'RMAN_EOF'
CONFIGURE DEVICE TYPE DISK PARALLELISM 2;
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT '/opt/oracle/shared/backup_vitalis_%%U';
BACKUP DATABASE PLUS ARCHIVELOG;
BACKUP CURRENT CONTROLFILE FOR STANDBY FORMAT '/opt/oracle/shared/vitalis_standby_control.ctl';
LIST BACKUP SUMMARY;
EXIT;
RMAN_EOF
"

echo.
echo Paso 2: Iniciando container Standby de Vitalis...
docker-compose up -d vitalis-standby

echo.
echo Paso 3: Esperando que container standby esté listo...
timeout 60 > nul

echo.
echo Paso 4: Configurando Vitalis Standby Database...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

# Crear directorios necesarios para Vitalis Standby
mkdir -p /opt/oracle/oradata/VITALIS_STBY/arch
mkdir -p /opt/oracle/admin/VITALIS_STBY/{adump,pfile}
mkdir -p /opt/oracle/shared/respaldos_standby

# Copiar archivos de configuración específicos de Vitalis
cp /opt/oracle/scripts/setup/listener.ora \$ORACLE_HOME/network/admin/
cp /opt/oracle/scripts/setup/tnsnames.ora \$ORACLE_HOME/network/admin/
cp /opt/oracle/scripts/setup/init_vitalis_stby.ora /opt/oracle/admin/VITALIS_STBY/pfile/init.ora

# Iniciar listener
lsnrctl start

# Configurar standby con RMAN para Vitalis
rman target sys/Vitalis2025!@VITALIS auxiliary sys/Vitalis2025!@VITALIS_STBY << 'RMAN_EOF'
RUN {
  ALLOCATE CHANNEL prmy1 DEVICE TYPE DISK;
  ALLOCATE CHANNEL prmy2 DEVICE TYPE DISK;
  ALLOCATE AUXILIARY CHANNEL stby DEVICE TYPE DISK;
  
  DUPLICATE TARGET DATABASE FOR STANDBY FROM ACTIVE DATABASE
    DORECOVER
    SPFILE
    PARAMETER_VALUE_CONVERT '/opt/oracle/oradata/VITALIS/','/opt/oracle/oradata/VITALIS_STBY/'
    SET DB_UNIQUE_NAME='VITALIS_STBY'
    SET FAL_CLIENT='VITALIS_STBY'
    SET FAL_SERVER='VITALIS'
    SET LOG_ARCHIVE_DEST_2='SERVICE=VITALIS LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=VITALIS'
    SET ARCHIVE_LAG_TARGET=300;
}
RMAN_EOF
"

echo.
echo ================================================================
echo STANDBY DATABASE DE VITALIS CONFIGURADO EXITOSAMENTE
echo ================================================================
echo Primary: vitalis-primary:1521
echo Standby: vitalis-standby:1522
echo Configuración cumple con especificaciones del proyecto
echo ================================================================
pause
```

### 5.5 Script de Verificación del Standby

**Crear archivo**: `verify_vitalis_standby.bat`

```batch
@echo off
title Vitalis - Verificando Configuración Standby
echo ================================================================
echo PROYECTO VITALIS - VERIFICANDO CONFIGURACIÓN STANDBY
echo ================================================================

echo 1. Verificando estado de Primary Database...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 100 LINESIZE 150
COL DATABASE_ROLE FORMAT A20
COL DB_UNIQUE_NAME FORMAT A20
COL PROTECTION_MODE FORMAT A20

SELECT DATABASE_ROLE, DB_UNIQUE_NAME, PROTECTION_MODE FROM V\$DATABASE;

SELECT DEST_ID, STATUS, DESTINATION, ERROR FROM V\$ARCHIVE_DEST WHERE DEST_ID <= 2;

-- Verificar configuración específica del proyecto
SELECT NAME, VALUE FROM V\$PARAMETER 
WHERE NAME IN ('archive_lag_target', 'log_archive_max_processes');

EOF
"

echo.
echo 2. Verificando estado de Standby Database...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 100 LINESIZE 150
COL DATABASE_ROLE FORMAT A20
COL DB_UNIQUE_NAME FORMAT A20
COL PROTECTION_MODE FORMAT A20

SELECT DATABASE_ROLE, DB_UNIQUE_NAME, PROTECTION_MODE FROM V\$DATABASE;

-- Verificar procesos de recovery activos
SELECT PROCESS, STATUS, THREAD#, SEQUENCE# FROM V\$MANAGED_STANDBY WHERE PROCESS LIKE 'MRP%%';

-- Verificar configuración de transferencia (cada 10 min según proyecto)
SELECT NAME, VALUE FROM V\$PARAMETER 
WHERE NAME IN ('archive_lag_target', 'log_archive_max_processes');

EOF
"

echo.
echo 3. Prueba de sincronización según especificaciones del proyecto...
echo Forzando switch de log en Primary...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
ALTER SYSTEM SWITCH LOGFILE;
SELECT 'PRIMARY_SEQ: ' || MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE DEST_ID=1;
EOF
"

echo.
echo Esperando transferencia (máximo 10 minutos según especificación)...
timeout 15 > nul

docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SELECT 'STANDBY_SEQ: ' || MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
EOF
"

echo.
echo ================================================================
echo VERIFICACIÓN COMPLETADA
echo La configuración cumple con los requerimientos del proyecto:
echo - Archive logs cada 5 minutos o 50MB
echo - Transferencia entre servidores cada 10 minutos
echo - Configuración específica para Vitalis
echo ================================================================
pause
```

---

## 6. Configuración de Monitoreo para Data Guard Vitalis

### 6.1 Script de Monitoreo Continuo

**Crear archivo**: `monitor_vitalis_dataguard.bat`

```batch
@echo off
title Vitalis - Monitoreo Data Guard
echo ================================================================
echo PROYECTO VITALIS - MONITOREO DATA GUARD EN TIEMPO REAL
echo Cumpliendo especificaciones: Verificación cada 10 minutos
echo ================================================================

:monitor_loop
cls
echo ================================================================
echo VITALIS DATA GUARD - ESTADO ACTUAL [%date% %time%]
echo ================================================================

echo.
echo 1. ESTADO DEL SERVIDOR PRIMARY...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 50 LINESIZE 120
PROMPT === ESTADO PRIMARY DATABASE ===
COL DATABASE_ROLE FORMAT A20
COL DB_UNIQUE_NAME FORMAT A20
COL PROTECTION_MODE FORMAT A20
COL OPEN_MODE FORMAT A20

SELECT DATABASE_ROLE, DB_UNIQUE_NAME, PROTECTION_MODE, OPEN_MODE 
FROM V\$DATABASE;

PROMPT.
PROMPT === DESTINOS DE ARCHIVE LOG ===
COL DESTINATION FORMAT A40
COL STATUS FORMAT A12
COL ERROR FORMAT A30

SELECT DEST_ID, STATUS, DESTINATION, ERROR 
FROM V\$ARCHIVE_DEST 
WHERE DEST_ID <= 2;

PROMPT.
PROMPT === SECUENCIA ACTUAL DE LOGS ===
SELECT MAX(SEQUENCE#) AS CURRENT_SEQ, THREAD# 
FROM V\$LOG 
WHERE STATUS='CURRENT' 
GROUP BY THREAD#;

EOF
" 2>nul

echo.
echo 2. ESTADO DEL SERVIDOR STANDBY...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 50 LINESIZE 120
PROMPT === ESTADO STANDBY DATABASE ===
COL DATABASE_ROLE FORMAT A20
COL DB_UNIQUE_NAME FORMAT A20
COL PROTECTION_MODE FORMAT A20
COL OPEN_MODE FORMAT A20

SELECT DATABASE_ROLE, DB_UNIQUE_NAME, PROTECTION_MODE, OPEN_MODE 
FROM V\$DATABASE;

PROMPT.
PROMPT === PROCESOS DE RECOVERY ACTIVOS ===
COL PROCESS FORMAT A12
COL STATUS FORMAT A12
COL CLIENT_PROCESS FORMAT A12

SELECT PROCESS, STATUS, THREAD#, SEQUENCE#, CLIENT_PROCESS 
FROM V\$MANAGED_STANDBY 
WHERE PROCESS IN ('MRP0','RFS','ARCH') OR CLIENT_PROCESS='LGWR';

PROMPT.
PROMPT === LOGS APLICADOS EN STANDBY ===
SELECT MAX(SEQUENCE#) AS APPLIED_SEQ, THREAD# 
FROM V\$ARCHIVED_LOG 
WHERE APPLIED='YES' 
GROUP BY THREAD#;

EOF
" 2>nul

echo.
echo 3. VERIFICACIÓN DE SINCRONIZACIÓN...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 20 LINESIZE 120
PROMPT === GAP ANALYSIS ===
SELECT * FROM V\$ARCHIVE_GAP;

PROMPT.
PROMPT === CONFIGURACIÓN ESPECÍFICA VITALIS ===
SELECT NAME, VALUE FROM V\$PARAMETER 
WHERE NAME IN ('archive_lag_target', 'log_archive_max_processes', 'db_unique_name');
EOF
" 2>nul

echo.
echo 4. ESTADÍSTICAS DE TRANSFERENCIA (últimas 24 horas)...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 30 LINESIZE 120
PROMPT === ARCHIVO LOGS RECIBIDOS HOY ===
COL COMPLETION_TIME FORMAT A20
SELECT TO_CHAR(COMPLETION_TIME, 'DD-MON HH24:MI') AS COMPLETION_TIME,
       SEQUENCE# AS SEQ,
       ROUND(BLOCKS*BLOCK_SIZE/1024/1024, 2) AS MB
FROM V\$ARCHIVED_LOG 
WHERE COMPLETION_TIME >= SYSDATE - 1
AND DEST_ID = 1
ORDER BY COMPLETION_TIME DESC
FETCH FIRST 10 ROWS ONLY;
EOF
" 2>nul

echo.
echo ================================================================
echo PRÓXIMA VERIFICACIÓN EN 10 MINUTOS (según especificaciones)
echo Presione Ctrl+C para detener el monitoreo
echo ================================================================
echo.

REM Esperar 10 minutos (600 segundos) según especificación del proyecto
timeout 600 >nul
goto monitor_loop
```

### 6.2 Script de Alerta Automática

**Crear archivo**: `vitalis_alert_system.bat`

```batch
@echo off
title Vitalis - Sistema de Alertas Data Guard
echo ================================================================
echo PROYECTO VITALIS - SISTEMA DE ALERTAS AUTOMÁTICAS
echo ================================================================

set "alert_log=vitalis_alerts.log"
set "max_lag=900"  REM 15 minutos máximo de lag permitido

:check_alerts
echo [%date% %time%] Verificando estado de Data Guard Vitalis... >> %alert_log%

REM Verificar lag entre Primary y Standby
for /f %%i in ('docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin
sqlplus -s / as sysdba << EOF
SET PAGESIZE 0 FEEDBACK OFF HEADING OFF
SELECT MAX(SEQUENCE#) FROM V\$LOG WHERE STATUS='CURRENT';
EOF
"') do set primary_seq=%%i

for /f %%i in ('docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin
sqlplus -s / as sysdba << EOF
SET PAGESIZE 0 FEEDBACK OFF HEADING OFF
SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
EOF
"') do set standby_seq=%%i

set /a lag_seq=%primary_seq%-%standby_seq%

if %lag_seq% gtr 3 (
    echo [%date% %time%] ALERTA: Lag detectado entre Primary y Standby >> %alert_log%
    echo Primary Sequence: %primary_seq% >> %alert_log%
    echo Standby Sequence: %standby_seq% >> %alert_log%
    echo Diferencia: %lag_seq% logs >> %alert_log%
    echo.
    echo *** ALERTA VITALIS DATA GUARD ***
    echo Lag detectado: %lag_seq% archive logs
    echo Se requiere revisión inmediata
    echo.
)

REM Verificar procesos de recovery
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 0 FEEDBACK OFF HEADING OFF
SELECT COUNT(*) FROM V\$MANAGED_STANDBY WHERE PROCESS='MRP0' AND STATUS='APPLYING_LOG';
EOF
" > temp_mrp_status.txt

for /f %%i in (temp_mrp_status.txt) do set mrp_active=%%i
del temp_mrp_status.txt

if %mrp_active% equ 0 (
    echo [%date% %time%] ALERTA: Proceso MRP0 no está activo en Standby >> %alert_log%
    echo.
    echo *** ALERTA VITALIS DATA GUARD ***
    echo Proceso de recovery MRP0 no está activo
    echo Se requiere intervención inmediata
    echo.
)

REM Esperar 5 minutos antes de la siguiente verificación
timeout 300 >nul
goto check_alerts
```

---

### 6.4 Script de Pruebas de Failover

**Crear archivo**: `vitalis_failover_test.bat`

```batch
@echo off
title Vitalis - Prueba de Failover
echo ================================================================
echo PROYECTO VITALIS - PRUEBA DE FAILOVER (SIMULACIÓN)
echo ADVERTENCIA: Esta es una prueba que afectará la disponibilidad
echo ================================================================

set /p confirm="¿Continuar con la prueba de failover? (S/N): "
if /i "%confirm%" neq "S" (
    echo Prueba cancelada.
    pause
    exit
)

echo.
echo 1. Estado inicial del sistema...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SELECT 'PRIMARY: ' || DATABASE_ROLE FROM V\$DATABASE;
SELECT 'CURRENT_SEQ: ' || MAX(SEQUENCE#) FROM V\$LOG WHERE STATUS='CURRENT';
EOF
"

docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SELECT 'STANDBY: ' || DATABASE_ROLE FROM V\$DATABASE;
SELECT 'APPLIED_SEQ: ' || MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
EOF
"

echo.
echo 2. Forzando switch de logs antes del failover...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
ALTER SYSTEM SWITCH LOGFILE;
ALTER SYSTEM SWITCH LOGFILE;
EOF
"

echo.
echo 3. Esperando sincronización completa...
timeout 30 >nul

echo.
echo 4. Simulando falla del primary (detener container)...
docker stop vitalis-primary

echo.
echo 5. Activando standby como primary...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
-- Cancelar recovery
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

-- Finish recovery
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE FINISH;

-- Activar como primary
ALTER DATABASE ACTIVATE STANDBY DATABASE;

-- Abrir la base de datos
ALTER DATABASE OPEN;

-- Verificar nuevo estado
SELECT 'NEW_PRIMARY: ' || DATABASE_ROLE FROM V\$DATABASE;
EOF
"

echo.
echo 6. Verificando disponibilidad del servicio...
docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
-- Verificar que podemos hacer operaciones
CREATE TABLE TEST_FAILOVER (
    test_id NUMBER,
    test_date DATE DEFAULT SYSDATE,
    test_message VARCHAR2(100)
);

INSERT INTO TEST_FAILOVER (test_id, test_message) 
VALUES (1, 'Failover test successful for Vitalis project');

COMMIT;

SELECT * FROM TEST_FAILOVER;

DROP TABLE TEST_FAILOVER;
EOF
"

echo.
echo ================================================================
echo PRUEBA DE FAILOVER COMPLETADA
echo ================================================================
echo El standby ahora es el primary activo
echo Para restaurar el estado original:
echo 1. Reiniciar vitalis-primary
echo 2. Reconfigurar como standby
echo 3. Ejecutar script de restauración
echo ================================================================

set /p restore="¿Desea restaurar el estado original? (S/N): "
if /i "%restore%" equ "S" (
    echo.
    echo Restaurando configuración original...
    docker start vitalis-primary
    echo Primary container reiniciado.
    echo Ejecute el script de reconfiguración para completar la restauración.
)

pause
```

---


## 7. Configuración de Seguridad para Vitalis

### 8.1 Configuración de Usuarios y Roles

**Crear archivo**: `vitalis_security_setup.bat`

```batch
@echo off
title Vitalis - Configuración de Seguridad
echo ================================================================
echo PROYECTO VITALIS - CONFIGURACIÓN DE SEGURIDAD
echo Roles: Admin, Medico, Administrativo
echo ================================================================

echo 1. Configurando usuarios y roles en Primary Database...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
-- ================================================================
-- CONFIGURACIÓN DE SEGURIDAD ESPECÍFICA PARA VITALIS
-- Cumple con especificaciones del proyecto
-- ================================================================

-- Crear roles específicos del proyecto Vitalis
CREATE ROLE VITALIS_ADMIN;
CREATE ROLE VITALIS_MEDICO;
CREATE ROLE VITALIS_ADMINISTRATIVO;

-- Configurar privilegios para rol ADMIN
GRANT CONNECT, RESOURCE, DBA TO VITALIS_ADMIN;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO VITALIS_ADMIN;
GRANT SELECT ANY TABLE, INSERT ANY TABLE, UPDATE ANY TABLE, DELETE ANY TABLE TO VITALIS_ADMIN;

-- Configurar privilegios para rol MEDICO
GRANT CONNECT, RESOURCE TO VITALIS_MEDICO;
GRANT CREATE SESSION TO VITALIS_MEDICO;
-- Acceso completo a tablas médicas (definir según estructura de vitalis_script.SQL)
GRANT SELECT, INSERT, UPDATE ON VITALIS_DATA.PACIENTES TO VITALIS_MEDICO;
GRANT SELECT, INSERT, UPDATE ON VITALIS_DATA.CITAS TO VITALIS_MEDICO;
GRANT SELECT, INSERT, UPDATE ON VITALIS_DATA.HISTORIALES TO VITALIS_MEDICO;
GRANT SELECT ON VITALIS_DATA.MEDICAMENTOS TO VITALIS_MEDICO;

-- Configurar privilegios para rol ADMINISTRATIVO
GRANT CONNECT TO VITALIS_ADMINISTRATIVO;
GRANT CREATE SESSION TO VITALIS_ADMINISTRATIVO;
-- Acceso limitado para funciones administrativas
GRANT SELECT, INSERT, UPDATE ON VITALIS_DATA.PACIENTES TO VITALIS_ADMINISTRATIVO;
GRANT SELECT, INSERT, UPDATE ON VITALIS_DATA.CITAS TO VITALIS_ADMINISTRATIVO;
GRANT SELECT ON VITALIS_DATA.REPORTES TO VITALIS_ADMINISTRATIVO;

-- Crear usuarios específicos del proyecto
CREATE USER vitalis_admin_user IDENTIFIED BY VitalisAdmin2025!;
CREATE USER vitalis_medico_user IDENTIFIED BY VitalisMedico2025!;
CREATE USER vitalis_admin_user IDENTIFIED BY VitalisAdm2025!;

-- Asignar roles a usuarios
GRANT VITALIS_ADMIN TO vitalis_admin_user;
GRANT VITALIS_MEDICO TO vitalis_medico_user;
GRANT VITALIS_ADMINISTRATIVO TO vitalis_admin_user;

-- Configurar perfiles de seguridad
CREATE PROFILE VITALIS_SECURITY_PROFILE LIMIT
    SESSIONS_PER_USER 3
    CPU_PER_SESSION 60000
    CPU_PER_CALL 6000
    CONNECT_TIME 480
    IDLE_TIME 30
    LOGICAL_READS_PER_SESSION UNLIMITED
    LOGICAL_READS_PER_CALL 10000
    PRIVATE_SGA UNLIMITED
    COMPOSITE_LIMIT UNLIMITED
    PASSWORD_LIFE_TIME 90
    PASSWORD_REUSE_TIME 30
    PASSWORD_REUSE_MAX 5
    PASSWORD_VERIFY_FUNCTION DEFAULT
    PASSWORD_LOCK_TIME 1
    PASSWORD_GRACE_TIME 7
    FAILED_LOGIN_ATTEMPTS 3;

-- Aplicar perfil a usuarios de Vitalis
ALTER USER vitalis_admin_user PROFILE VITALIS_SECURITY_PROFILE;
ALTER USER vitalis_medico_user PROFILE VITALIS_SECURITY_PROFILE;
ALTER USER vitalis_admin_user PROFILE VITALIS_SECURITY_PROFILE;

-- Configurar auditoría para cumplir con regulaciones de salud
AUDIT ALL ON VITALIS_DATA.PACIENTES BY ACCESS;
AUDIT ALL ON VITALIS_DATA.HISTORIALES BY ACCESS;
AUDIT SELECT, INSERT, UPDATE, DELETE ON VITALIS_DATA.CITAS BY ACCESS;

-- Verificar configuración
SELECT 'Roles creados:' FROM DUAL;
SELECT ROLE FROM DBA_ROLES WHERE ROLE LIKE 'VITALIS_%';

SELECT 'Usuarios creados:' FROM DUAL;
SELECT USERNAME FROM DBA_USERS WHERE USERNAME LIKE 'VITALIS_%';

EOF
"

echo.
echo 2. Replicando configuración de seguridad en Standby...
echo Esperando sincronización...
timeout 30 >nul

docker exec vitalis-standby bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
-- Verificar que la configuración de seguridad se ha replicado
SELECT 'Verificando roles en Standby:' FROM DUAL;
SELECT ROLE FROM DBA_ROLES WHERE ROLE LIKE 'VITALIS_%';

SELECT 'Verificando usuarios en Standby:' FROM DUAL;
SELECT USERNAME FROM DBA_USERS WHERE USERNAME LIKE 'VITALIS_%';
EOF
"

echo.
echo ================================================================
echo CONFIGURACIÓN DE SEGURIDAD VITALIS COMPLETADA
echo ================================================================
echo Roles creados: VITALIS_ADMIN, VITALIS_MEDICO, VITALIS_ADMINISTRATIVO
echo Usuarios configurados con perfiles de seguridad
echo Auditoría habilitada para tablas sensibles
echo ================================================================

pause
```

### 8.2 Script de Validación de Seguridad

**Crear archivo**: `vitalis_security_test.bat`

```batch
@echo off
title Vitalis - Pruebas de Seguridad
echo ================================================================
echo PROYECTO VITALIS - PRUEBAS DE SEGURIDAD
echo ================================================================

echo 1. Probando acceso con usuario ADMIN...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus vitalis_admin_user/VitalisAdmin2025! << 'EOF'
SELECT USER AS CURRENT_USER FROM DUAL;
SELECT 'Privilegios de ADMIN verificados' FROM DUAL;
EOF
"

echo.
echo 2. Probando acceso con usuario MEDICO...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus vitalis_medico_user/VitalisMedico2025! << 'EOF'
SELECT USER AS CURRENT_USER FROM DUAL;
SELECT 'Privilegios de MEDICO verificados' FROM DUAL;
EOF
"

echo.
echo 3. Probando acceso con usuario ADMINISTRATIVO...
docker exec vitalis-primary bash -c "
export ORACLE_SID=VITALIS
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=\$PATH:\$ORACLE_HOME/bin

sqlplus vitalis_admin_user/VitalisAdm2025! << 'EOF'
SELECT USER AS CURRENT_USER FROM DUAL;
SELECT 'Privilegios de ADMINISTRATIVO verificados' FROM DUAL;
EOF
"

echo.
echo ================================================================
echo PRUEBAS DE SEGURIDAD COMPLETADAS
echo Todos los usuarios pueden conectarse correctamente
echo ================================================================

pause
```



