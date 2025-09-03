# Guía Completa: Oracle 19c en Docker con Standby Database y Snapshots para Windows

## Tabla de Contenidos
1. [Prerrequisitos y Preparación del Entorno](#1-prerrequisitos-y-preparación-del-entorno)
2. [Configuración Inicial de Docker](#2-configuración-inicial-de-docker)
3. [Descarga e Instalación de Oracle 19c](#3-descarga-e-instalación-de-oracle-19c)
4. [Configuración de la Base de Datos Principal (Primary)](#4-configuración-de-la-base-de-datos-principal-primary)
5. [Configuración de la Base de Datos Standby](#5-configuración-de-la-base-de-datos-standby)
6. [Configuración de Data Guard](#6-configuración-de-data-guard)
7. [Sistema de Snapshots con Docker](#7-sistema-de-snapshots-con-docker)
8. [Scripts de Automatización](#8-scripts-de-automatización)
9. [Preparación para Exportación de Datos](#9-preparación-para-exportación-de-datos)
10. [Monitoreo y Mantenimiento](#10-monitoreo-y-mantenimiento)

---

## 1. Prerrequisitos y Preparación del Entorno

### 1.1 Requisitos del Sistema
- **CPU**: Mínimo 4 cores (recomendado 8 cores)
- **RAM**: Mínimo 8GB (recomendado 16GB o más)
- **Almacenamiento**: Mínimo 50GB libres (recomendado 100GB+)
- **Sistema Operativo**: Windows 10/11 Pro o Windows Server 2019/2022 con Hyper-V habilitado

### 1.2 Instalación de Docker Desktop para Windows

#### Paso 1: Habilitar Hyper-V y WSL 2
1. Abrir PowerShell como Administrador
2. Ejecutar:
```powershell
# Habilitar Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Habilitar WSL 2
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Reiniciar el sistema
Restart-Computer
```

#### Paso 2: Instalar Docker Desktop
1. Descargar Docker Desktop desde: https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe
2. Ejecutar el instalador como Administrador
3. Marcar "Use WSL 2 instead of Hyper-V" durante la instalación
4. Reiniciar cuando se solicite

#### Paso 3: Verificar instalación
```powershell
# Verificar Docker
docker --version
docker-compose --version

# Verificar que Docker está corriendo
docker info
```

### 1.3 Configuración de Docker para Oracle

#### Crear estructura de directorios manualmente:

**Opción 1: Usando PowerShell**
```powershell
# Navegar al directorio de trabajo
cd C:\Users\$env:USERNAME\Documents
mkdir oracle-docker-project
cd oracle-docker-project

# Crear estructura de directorios
New-Item -ItemType Directory -Path "primary\data" -Force
New-Item -ItemType Directory -Path "primary\scripts" -Force
New-Item -ItemType Directory -Path "primary\logs" -Force
New-Item -ItemType Directory -Path "primary\backup" -Force
New-Item -ItemType Directory -Path "standby\data" -Force
New-Item -ItemType Directory -Path "standby\scripts" -Force
New-Item -ItemType Directory -Path "standby\logs" -Force
New-Item -ItemType Directory -Path "standby\backup" -Force
New-Item -ItemType Directory -Path "shared\exports" -Force
New-Item -ItemType Directory -Path "shared\snapshots" -Force
```

**Opción 2: Crear carpetas manualmente usando Explorador de Windows**
1. Navegue a `C:\Users\[SuUsuario]\Documents`
2. Cree una nueva carpeta llamada `oracle-docker-project`
3. Dentro de esta carpeta, cree la siguiente estructura:
   ```
   oracle-docker-project/
   ├── primary/
   │   ├── data/
   │   ├── scripts/
   │   ├── logs/
   │   └── backup/
   ├── standby/
   │   ├── data/
   │   ├── scripts/
   │   ├── logs/
   │   └── backup/
   └── shared/
       ├── exports/
       └── snapshots/
   ```

#### Configurar recursos de Docker Desktop:
1. Clic derecho en el icono de Docker Desktop en la bandeja del sistema
2. Seleccionar "Settings"
3. En "Resources" → "Advanced":
   - **Memory**: Mínimo 8GB (recomendado 12GB+)
   - **CPU**: Mínimo 4 cores
   - **Disk image size**: Mínimo 100GB
4. Aplicar y reiniciar Docker Desktop

---

## 2. Configuración Inicial de Docker

### 2.1 Docker Compose Principal
Crear archivo `docker-compose.yml`:

```yaml
version: '3.8'

services:
  oracle-primary:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: oracle-primary
    hostname: oracle-primary
    environment:
      - ORACLE_SID=ORCL
      - ORACLE_PDB=ORCLPDB1
      - ORACLE_PWD=Oracle123
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
      - oracle-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g

  oracle-standby:
    image: container-registry.oracle.com/database/enterprise:19.3.0.0
    container_name: oracle-standby
    hostname: oracle-standby
    environment:
      - ORACLE_SID=ORCL
      - ORACLE_PDB=ORCLPDB1
      - ORACLE_PWD=Oracle123
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
      - oracle-net
    restart: unless-stopped
    mem_limit: 4g
    shm_size: 1g
    depends_on:
      - oracle-primary

networks:
  oracle-net:
    driver: bridge
    ipam:
      config:
        - subnet: 172.20.0.0/16
```

### 2.2 Configuración de Red Docker
```powershell
# Crear red personalizada (en PowerShell)
docker network create --driver bridge --subnet=172.20.0.0/16 --ip-range=172.20.240.0/20 oracle-net
```

---

## 3. Descarga e Instalación de Oracle 19c

### 3.1 Autenticación en Oracle Container Registry
```powershell
# Login en Oracle Container Registry (PowerShell)
docker login container-registry.oracle.com
# Usar tu Oracle Account (crear en oracle.com si no tienes)
```

### 3.2 Descarga de Imagen Oracle
```powershell
# Descargar imagen Oracle 19c Enterprise
docker pull container-registry.oracle.com/database/enterprise:19.3.0.0

# Verificar descarga
docker images | findstr oracle
```

### 3.3 Configuración de Parámetros Iniciales

**Crear manualmente el archivo**: `primary\scripts\01_init_primary.sql`

1. Navegue a la carpeta `primary\scripts\` en el Explorador de Windows
2. Cree un nuevo archivo de texto y nómbrelo `01_init_primary.sql`
3. Abra el archivo con un editor de texto (Notepad, Notepad++, VS Code) y copie el siguiente contenido:

```sql
-- Configuración inicial para Primary Database
ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=(ORCL,ORCL_STBY)' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/ORCL/arch/ VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=ORCL' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=ORCL_STBY LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=ORCL_STBY' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_FORMAT='%t_%s_%r.dbf' SCOPE=SPFILE;
ALTER SYSTEM SET LOG_ARCHIVE_MAX_PROCESSES=4 SCOPE=BOTH;
ALTER SYSTEM SET REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE SCOPE=SPFILE;
ALTER SYSTEM SET FAL_SERVER=ORCL_STBY SCOPE=BOTH;
ALTER SYSTEM SET FAL_CLIENT=ORCL SCOPE=BOTH;
ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO SCOPE=BOTH;
ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL_STBY/','/opt/oracle/oradata/ORCL/' SCOPE=SPFILE;
ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL_STBY/','/opt/oracle/oradata/ORCL/' SCOPE=SPFILE;

-- Crear directorio para archive logs
!mkdir -p /opt/oracle/oradata/ORCL/arch

-- Habilitar Force Logging
ALTER DATABASE FORCE LOGGING;
```

---

## 4. Configuración de la Base de Datos Principal (Primary)

### 4.1 Inicialización de la Base de Datos Primary
```powershell
# Iniciar solo el container primary
docker-compose up -d oracle-primary

# Monitorear logs de inicialización
docker logs -f oracle-primary

# Esperar mensaje: "DATABASE IS READY TO USE!"
```

### 4.2 Configuración Post-Instalación Primary

**Crear manualmente el script**: `primary\scripts\02_configure_primary.bat`

1. Navegue a `primary\scripts\` 
2. Cree un archivo nuevo llamado `02_configure_primary.bat`
3. Copie el siguiente contenido:

```batch
@echo off
echo Configurando Primary Database...

docker exec -it oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

# Crear directorios necesarios
mkdir -p /opt/oracle/oradata/ORCL/arch
mkdir -p /opt/oracle/shared/exports
mkdir -p /opt/oracle/admin/ORCL/adump

# Ejecutar configuración SQL
sqlplus / as sysdba << EOF
@/opt/oracle/scripts/setup/01_init_primary.sql

-- Crear usuario para replicación
CREATE USER c##replication IDENTIFIED BY Oracle123 CONTAINER=ALL;
GRANT CONNECT, RESOURCE TO c##replication CONTAINER=ALL;
GRANT DBA TO c##replication CONTAINER=ALL;
GRANT CREATE SESSION TO c##replication CONTAINER=ALL;

-- Crear tablespace para datos de prueba
CREATE TABLESPACE TEST_DATA DATAFILE '/opt/oracle/oradata/ORCL/test_data01.dbf' SIZE 100M AUTOEXTEND ON;

-- Configurar listener
ALTER SYSTEM SET LOCAL_LISTENER='(ADDRESS=(PROTOCOL=TCP)(HOST=oracle-primary)(PORT=1521))' SCOPE=BOTH;
ALTER SYSTEM REGISTER;

-- Reiniciar base de datos para aplicar cambios de SPFILE
SHUTDOWN IMMEDIATE;
STARTUP;

EXIT;
EOF
"

echo Primary Database configurado exitosamente
pause
```

### 4.3 Configuración del Listener Primary

**Crear manualmente el archivo**: `primary\scripts\listener.ora`

1. Navegue a `primary\scripts\`
2. Cree el archivo `listener.ora`
3. Copie el siguiente contenido:

```
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-primary)(PORT = 1521))
    )
  )

SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = ORCL)
      (ORACLE_HOME = /opt/oracle/product/19c/dbhome_1)
      (SID_NAME = ORCL)
    )
  )

ADR_BASE_LISTENER = /opt/oracle
```

### 4.4 Configuración tnsnames.ora Primary

**Crear manualmente el archivo**: `primary\scripts\tnsnames.ora`

1. Navegue a `primary\scripts\`
2. Cree el archivo `tnsnames.ora`
3. Copie el siguiente contenido:

```
ORCL =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-primary)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ORCL)
    )
  )

ORCL_STBY =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-standby)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ORCL_STBY)
    )
  )
```

---

## 5. Configuración de la Base de Datos Standby

### 5.1 Preparación de Archivos para Standby

**Crear manualmente el script**: `create_standby_files.bat`

1. En el directorio raíz del proyecto (`oracle-docker-project`), cree el archivo `create_standby_files.bat`
2. Copie el siguiente contenido:

```batch
@echo off
echo Creando archivos de configuración para Standby...

REM Crear directorio de scripts para standby
if not exist "standby\scripts" mkdir "standby\scripts"

REM Script de inicialización para standby
(
echo -- Configuración para Standby Database
echo STARTUP NOMOUNT PFILE='/opt/oracle/admin/ORCL_STBY/pfile/init.ora';
echo.
echo -- Configurar parámetros específicos del standby
echo ALTER SYSTEM SET DB_UNIQUE_NAME=ORCL_STBY SCOPE=SPFILE;
echo ALTER SYSTEM SET LOG_ARCHIVE_CONFIG='DG_CONFIG=^(ORCL,ORCL_STBY^)' SCOPE=BOTH;
echo ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/ORCL_STBY/arch/ VALID_FOR=^(ALL_LOGFILES,ALL_ROLES^) DB_UNIQUE_NAME=ORCL_STBY' SCOPE=BOTH;
echo ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=ORCL LGWR ASYNC VALID_FOR=^(ONLINE_LOGFILES,PRIMARY_ROLE^) DB_UNIQUE_NAME=ORCL' SCOPE=BOTH;
echo ALTER SYSTEM SET FAL_SERVER=ORCL SCOPE=BOTH;
echo ALTER SYSTEM SET FAL_CLIENT=ORCL_STBY SCOPE=BOTH;
echo ALTER SYSTEM SET STANDBY_FILE_MANAGEMENT=AUTO SCOPE=BOTH;
echo ALTER SYSTEM SET DB_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL/','/opt/oracle/oradata/ORCL_STBY/' SCOPE=SPFILE;
echo ALTER SYSTEM SET LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL/','/opt/oracle/oradata/ORCL_STBY/' SCOPE=SPFILE;
) > "standby\scripts\01_init_standby.sql"
```

**Continúe creando los siguientes archivos manualmente o complete el script .bat:**

**Archivo**: `standby\scripts\init_stby.ora`
DB_NAME=ORCL
DB_UNIQUE_NAME=ORCL_STBY
CONTROL_FILES=('/opt/oracle/oradata/ORCL_STBY/control01.ctl','/opt/oracle/oradata/ORCL_STBY/control02.ctl')
DB_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL/','/opt/oracle/oradata/ORCL_STBY/'
LOG_FILE_NAME_CONVERT='/opt/oracle/oradata/ORCL/','/opt/oracle/oradata/ORCL_STBY/'
REMOTE_LOGIN_PASSWORDFILE=EXCLUSIVE
LOG_ARCHIVE_CONFIG='DG_CONFIG=(ORCL,ORCL_STBY)'
LOG_ARCHIVE_DEST_1='LOCATION=/opt/oracle/oradata/ORCL_STBY/arch/ VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=ORCL_STBY'
LOG_ARCHIVE_DEST_2='SERVICE=ORCL LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=ORCL'
LOG_ARCHIVE_FORMAT='%t_%s_%r.dbf'
STANDBY_FILE_MANAGEMENT=AUTO
FAL_SERVER=ORCL
FAL_CLIENT=ORCL_STBY
EOF

# Crear listener.ora para standby
cat > standby/scripts/listener.ora << 'EOF'
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-standby)(PORT = 1521))
    )
  )

SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = ORCL_STBY)
      (ORACLE_HOME = /opt/oracle/product/19c/dbhome_1)
      (SID_NAME = ORCL)
    )
  )

ADR_BASE_LISTENER = /opt/oracle
EOF

# Crear tnsnames.ora para standby
cat > standby/scripts/tnsnames.ora << 'EOF'
ORCL =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-primary)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ORCL)
    )
  )

ORCL_STBY =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-standby)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = ORCL_STBY)
    )
  )
EOF

echo "Archivos de configuración para Standby creados exitosamente."
```

### 5.2 Script de Creación de Standby Database

**Crear manualmente el script**: `setup_standby.bat`

1. En el directorio raíz del proyecto, cree el archivo `setup_standby.bat`
2. Copie el siguiente contenido:

```batch
@echo off
echo === CONFIGURANDO STANDBY DATABASE ===

REM 1. Crear backup del primary para el standby
echo Paso 1: Creando backup de Primary Database...
docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

# Crear backup para standby
rman target / << 'RMAN_EOF'
CONFIGURE DEVICE TYPE DISK PARALLELISM 2;
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT '/opt/oracle/shared/backup_%%U';
BACKUP DATABASE PLUS ARCHIVELOG;
BACKUP CURRENT CONTROLFILE FOR STANDBY FORMAT '/opt/oracle/shared/standby_control.ctl';
EXIT;
RMAN_EOF
"

REM 2. Iniciar container standby
echo Paso 2: Iniciando container Standby...
docker-compose up -d oracle-standby

REM Esperar que el container esté listo
echo Esperando que el container standby esté listo...
timeout 60

REM 3. Configurar standby database
echo Paso 3: Configurando Standby Database...
docker exec oracle-standby bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

# Crear directorios necesarios
mkdir -p /opt/oracle/oradata/ORCL_STBY/arch
mkdir -p /opt/oracle/admin/ORCL_STBY/{adump,pfile}

# Copiar archivos de configuración
cp /opt/oracle/scripts/setup/listener.ora $ORACLE_HOME/network/admin/
cp /opt/oracle/scripts/setup/tnsnames.ora $ORACLE_HOME/network/admin/
cp /opt/oracle/scripts/setup/init_stby.ora /opt/oracle/admin/ORCL_STBY/pfile/init.ora

# Iniciar listener
lsnrctl start

# Configurar standby con RMAN
rman target sys/Oracle123@ORCL auxiliary sys/Oracle123@ORCL_STBY << 'RMAN_EOF'
RUN {
  ALLOCATE CHANNEL prmy1 DEVICE TYPE DISK;
  ALLOCATE CHANNEL prmy2 DEVICE TYPE DISK;
  ALLOCATE AUXILIARY CHANNEL stby DEVICE TYPE DISK;
  DUPLICATE TARGET DATABASE FOR STANDBY FROM ACTIVE DATABASE
    DORECOVER
    SPFILE
    PARAMETER_VALUE_CONVERT '/opt/oracle/oradata/ORCL/','/opt/oracle/oradata/ORCL_STBY/'
    SET DB_UNIQUE_NAME='ORCL_STBY'
    SET FAL_CLIENT='ORCL_STBY'
    SET FAL_SERVER='ORCL'
    SET LOG_ARCHIVE_DEST_2='SERVICE=ORCL LGWR ASYNC VALID_FOR=(ONLINE_LOGFILES,PRIMARY_ROLE) DB_UNIQUE_NAME=ORCL';
}
RMAN_EOF
"

echo Standby Database configurado exitosamente!
pause
```

---

## 6. Configuración de Data Guard

### 6.1 Script de Activación de Data Guard

**Crear manualmente el script**: `activate_dataguard.bat`

1. En el directorio raíz del proyecto, cree el archivo `activate_dataguard.bat`
2. Copie el siguiente contenido:

```batch
@echo off
echo === ACTIVANDO DATA GUARD ===

REM Configurar Data Guard en Primary
echo Configurando Data Guard en Primary...
docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
-- Habilitar Data Guard
ALTER DATABASE SET STANDBY DATABASE TO MAXIMIZE PERFORMANCE;
ALTER SYSTEM SWITCH LOGFILE;
ALTER SYSTEM ARCHIVE LOG CURRENT;

-- Verificar configuración
SELECT NAME, VALUE FROM V\$PARAMETER WHERE NAME IN ('log_archive_dest_2','remote_login_passwordfile');
SELECT SEQUENCE#, FIRST_TIME, NEXT_TIME FROM V\$ARCHIVED_LOG ORDER BY SEQUENCE#;

EXIT;
EOF
"

REM Iniciar managed recovery en Standby
echo Iniciando Managed Recovery en Standby...
docker exec oracle-standby bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
-- Iniciar Managed Recovery
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE USING CURRENT LOGFILE DISCONNECT FROM SESSION;

-- Verificar estado
SELECT PROCESS, STATUS, THREAD#, SEQUENCE# FROM V\$MANAGED_STANDBY;

EXIT;
EOF
"

echo Data Guard activado exitosamente!
pause
```

### 6.2 Script de Verificación de Data Guard

**Crear manualmente el script**: `verify_dataguard.bat`

1. En el directorio raíz del proyecto, cree el archivo `verify_dataguard.bat`
2. Copie el siguiente contenido:

```batch
@echo off
echo === VERIFICANDO DATA GUARD ===

echo 1. Verificando Primary Database...
docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 100
SET LINESIZE 150
COL DATABASE_ROLE FORMAT A20
COL PROTECTION_MODE FORMAT A20
COL PROTECTION_LEVEL FORMAT A20

SELECT DATABASE_ROLE, PROTECTION_MODE, PROTECTION_LEVEL FROM V\$DATABASE;
SELECT DEST_ID, STATUS, DESTINATION FROM V\$ARCHIVE_DEST WHERE DEST_ID <= 2;
EOF
"

echo 2. Verificando Standby Database...
docker exec oracle-standby bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SET PAGESIZE 100
SET LINESIZE 150
COL DATABASE_ROLE FORMAT A20
COL PROTECTION_MODE FORMAT A20

SELECT DATABASE_ROLE, PROTECTION_MODE FROM V\$DATABASE;
SELECT PROCESS, STATUS FROM V\$MANAGED_STANDBY WHERE PROCESS LIKE '%%MRP%%';
EOF
"

echo 3. Prueba de sincronización...
docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
ALTER SYSTEM SWITCH LOGFILE;
SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG;
EOF
"

timeout 5

docker exec oracle-standby bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus -s / as sysdba << 'EOF'
SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
EOF
"

pause
```

---

## 7. Sistema de Snapshots con Docker

### 7.1 Configuración de Snapshots

**Crear manualmente el script**: `snapshot_manager.bat`

1. En el directorio raíz del proyecto, cree el archivo `snapshot_manager.bat`
2. Copie el siguiente contenido:

```batch
@echo off
setlocal enabledelayedexpansion

set SNAPSHOT_DIR=.\shared\snapshots
set TIMESTAMP=%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set TIMESTAMP=%TIMESTAMP: =0%

if "%1"=="create" goto create_snapshot
if "%1"=="restore" goto restore_snapshot
if "%1"=="list" goto list_snapshots
if "%1"=="delete" goto delete_snapshot
goto show_usage

:create_snapshot
set snapshot_name=%2
if "%snapshot_name%"=="" set snapshot_name=snapshot_%TIMESTAMP%

echo === CREANDO SNAPSHOT: %snapshot_name% ===

REM Crear directorio para el snapshot
if not exist "%SNAPSHOT_DIR%\%snapshot_name%" mkdir "%SNAPSHOT_DIR%\%snapshot_name%"

REM Poner bases de datos en modo backup
echo Poniendo bases de datos en modo backup...

docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
ALTER DATABASE BEGIN BACKUP;
ALTER SYSTEM ARCHIVE LOG CURRENT;
EXIT;
EOF
"

REM Crear snapshot de volúmenes
echo Creando snapshot de volúmenes...
docker run --rm -v %cd%\primary\data:/primary -v %cd%\standby\data:/standby -v "%SNAPSHOT_DIR%\%snapshot_name%":/backup alpine sh -c "cp -rp /primary /backup/primary_data && cp -rp /standby /backup/standby_data"

REM Terminar modo backup
docker exec oracle-primary bash -c "
export ORACLE_SID=ORCL
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin

sqlplus / as sysdba << 'EOF'
ALTER DATABASE END BACKUP;
EXIT;
EOF
"

REM Guardar estado de containers
docker-compose config > "%SNAPSHOT_DIR%\%snapshot_name%\docker-compose-state.yml"

REM Crear metadatos del snapshot
(
echo Snapshot Name: %snapshot_name%
echo Creation Date: %date% %time%
echo Primary Container Status: 
echo Standby Container Status: 
) > "%SNAPSHOT_DIR%\%snapshot_name%\snapshot_metadata.txt"

echo Snapshot '%snapshot_name%' creado exitosamente en %SNAPSHOT_DIR%\%snapshot_name%
goto end

:restore_snapshot
set snapshot_name=%2
if "%snapshot_name%"=="" (
    echo Error: Debe especificar el nombre del snapshot
    call :list_snapshots
    goto end
)

if not exist "%SNAPSHOT_DIR%\%snapshot_name%" (
    echo Error: El snapshot '%snapshot_name%' no existe
    call :list_snapshots
    goto end
)

echo === RESTAURANDO SNAPSHOT: %snapshot_name% ===

REM Detener containers
echo Deteniendo containers...
docker-compose down

REM Limpiar datos actuales
echo Limpiando datos actuales...
if exist "primary\data" rmdir /s /q "primary\data"
if exist "standby\data" rmdir /s /q "standby\data"
mkdir "primary\data"
mkdir "standby\data"

REM Restaurar datos desde snapshot
echo Restaurando datos desde snapshot...
docker run --rm -v "%SNAPSHOT_DIR%\%snapshot_name%":/backup -v %cd%\primary\data:/primary -v %cd%\standby\data:/standby alpine sh -c "cp -rp /backup/primary_data/* /primary/ && cp -rp /backup/standby_data/* /standby/"

REM Iniciar containers
echo Iniciando containers...
docker-compose up -d

echo Snapshot '%snapshot_name%' restaurado exitosamente
echo Esperando que las bases de datos estén listas...
timeout 60
goto end

:list_snapshots
echo === SNAPSHOTS DISPONIBLES ===
if exist "%SNAPSHOT_DIR%" (
    for /d %%i in ("%SNAPSHOT_DIR%\*") do (
        echo Nombre: %%~ni
        if exist "%%i\snapshot_metadata.txt" (
            findstr "Creation Date:" "%%i\snapshot_metadata.txt"
            echo ---
        ) else (
            echo Nombre: %%~ni ^(sin metadatos^)
            echo ---
        )
    )
) else (
    echo No hay snapshots disponibles
)
goto end

:delete_snapshot
set snapshot_name=%2
if "%snapshot_name%"=="" (
    echo Error: Debe especificar el nombre del snapshot
    goto end
)

if not exist "%SNAPSHOT_DIR%\%snapshot_name%" (
    echo Error: El snapshot '%snapshot_name%' no existe
    goto end
)

set /p confirmation="¿Está seguro de que desea eliminar el snapshot '%snapshot_name%'? (y/N): "
if /i "%confirmation%"=="y" (
    rmdir /s /q "%SNAPSHOT_DIR%\%snapshot_name%"
    echo Snapshot '%snapshot_name%' eliminado exitosamente
) else (
    echo Operación cancelada
)
goto end

:show_usage
echo Uso: %0 {create^|restore^|list^|delete} [snapshot_name]
echo.
echo Comandos:
echo   create [nombre]     - Crear nuevo snapshot ^(nombre opcional^)
echo   restore ^<nombre^>    - Restaurar snapshot específico
echo   list               - Listar snapshots disponibles
echo   delete ^<nombre^>     - Eliminar snapshot específico
echo.
echo Ejemplos:
echo   %0 create initial_state
echo   %0 restore initial_state
echo   %0 list

:end
pause
```

### 7.2 Script de Automatización de Snapshots
Crear script `auto_snapshot.sh`:

```bash
#!/bin/bash

# Script para crear snapshots automáticos antes de operaciones críticas

SNAPSHOT_DIR="./shared/snapshots"
AUTO_SNAPSHOT_DIR="$SNAPSHOT_DIR/auto"
MAX_AUTO_SNAPSHOTS=10

# Función para crear snapshot automático
create_auto_snapshot() {
    local operation="$1"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local snapshot_name="auto_${operation}_${timestamp}"
    
    echo "=== CREANDO SNAPSHOT AUTOMÁTICO ANTES DE: $operation ==="
    
    # Crear snapshot usando el script principal
    ./snapshot_manager.sh create "$snapshot_name"
    
    # Mover a directorio de snapshots automáticos
    mkdir -p "$AUTO_SNAPSHOT_DIR"
    mv "$SNAPSHOT_DIR/$snapshot_name" "$AUTO_SNAPSHOT_DIR/"
    
    # Limpiar snapshots automáticos antiguos
    cleanup_auto_snapshots
    
    echo "Snapshot automático '$snapshot_name' creado"
}

# Función para limpiar snapshots automáticos antiguos
cleanup_auto_snapshots() {
    if [ -d "$AUTO_SNAPSHOT_DIR" ]; then
        snapshot_count=$(ls -1 "$AUTO_SNAPSHOT_DIR" 2>/dev/null | wc -l)
        if [ "$snapshot_count" -gt "$MAX_AUTO_SNAPSHOTS" ]; then
            echo "Limpiando snapshots automáticos antiguos..."
            cd "$AUTO_SNAPSHOT_DIR"
            ls -1t | tail -n +$((MAX_AUTO_SNAPSHOTS + 1)) | xargs rm -rf
            cd - > /dev/null
        fi
    fi
}

# Función wrapper para operaciones con snapshot automático
with_auto_snapshot() {
    local operation="$1"
    shift
    
    create_auto_snapshot "$operation"
    
    echo "Ejecutando operación: $operation"
    "$@"
    
    if [ $? -eq 0 ]; then
        echo "Operación '$operation' completada exitosamente"
    else
        echo "Error en operación '$operation'. Snapshot automático disponible para restauración."
        echo "Para restaurar: ./snapshot_manager.sh restore auto_${operation}_*"
    fi
}

# Verificar argumentos
if [ $# -lt 2 ]; then
    echo "Uso: $0 <operacion> <comando> [argumentos...]"
    echo "Ejemplo: $0 data_import ./import_data.sh datos.sql"
    exit 1
fi

# Ejecutar con snapshot automático
with_auto_snapshot "$@"
```

---

## 8. Scripts de Automatización

### 8.1 Script de Despliegue Completo
Crear script `deploy_oracle.sh`:

```bash
#!/bin/bash

set -e  # Salir si cualquier comando falla

echo "=== DESPLEGANDO ORACLE 19C CON DATA GUARD ==="

# Función de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Verificar prerrequisitos
check_prerequisites() {
    log "Verificando prerrequisitos..."
    
    # Verificar Docker
    if ! command -v docker &> /dev/null; then
        echo "Error: Docker no está instalado"
        exit 1
    fi
    
    # Verificar Docker Compose
    if ! command -v docker-compose &> /dev/null; then
        echo "Error: Docker Compose no está instalado"
        exit 1
    fi
    
    # Verificar espacio en disco
    available_space=$(df . | tail -1 | awk '{print $4}')
    required_space=52428800  # 50GB en KB
    
    if [ "$available_space" -lt "$required_space" ]; then
        echo "Error: Se requieren al menos 50GB de espacio libre"
        exit 1
    fi
    
    # Verificar memoria RAM
    available_ram=$(free -m | awk 'NR==2{print $7}')
    required_ram=8192  # 8GB
    
    if [ "$available_ram" -lt "$required_ram" ]; then
        echo "Advertencia: Se recomienda al menos 8GB de RAM libre"
    fi
    
    log "Prerrequisitos verificados ✓"
}

# Crear estructura de directorios
setup_directories() {
    log "Creando estructura de directorios..."
    
    mkdir -p {primary,standby}/{data,scripts,logs,backup}
    mkdir -p shared/{exports,snapshots}
    
    # Crear archivos de configuración si no existen
    if [ ! -f "docker-compose.yml" ]; then
        echo "Error: docker-compose.yml no encontrado"
        exit 1
    fi
    
    log "Estructura de directorios creada ✓"
}

# Desplegar Primary Database
deploy_primary() {
    log "Desplegando Primary Database..."
    
    # Iniciar solo primary
    docker-compose up -d oracle-primary
    
    # Esperar que esté listo
    log "Esperando que Primary Database esté listo..."
    timeout=600  # 10 minutos
    counter=0
    
    while [ $counter -lt $timeout ]; do
        if docker logs oracle-primary 2>&1 | grep -q "DATABASE IS READY TO USE"; then
            log "Primary Database listo ✓"
            break
        fi
        
        if [ $((counter % 30)) -eq 0 ]; then
            log "Esperando... ($((counter/60)) minutos transcurridos)"
        fi
        
        sleep 5
        counter=$((counter + 5))
    done
    
    if [ $counter -ge $timeout ]; then
        echo "Error: Timeout esperando Primary Database"
        docker logs oracle-primary
        exit 1
    fi
    
    # Configurar Primary
    log "Configurando Primary Database..."
    chmod +x primary/scripts/02_configure_primary.sh
    ./primary/scripts/02_configure_primary.sh
}

# Desplegar Standby Database
deploy_standby() {
    log "Desplegando Standby Database..."
    
    # Crear archivos de configuración para standby
    chmod +x create_standby_files.sh
    ./create_standby_files.sh
    
    # Configurar Standby
    chmod +x setup_standby.sh
    ./setup_standby.sh
}

# Activar Data Guard
activate_dataguard() {
    log "Activando Data Guard..."
    
    chmod +x activate_dataguard.sh
    ./activate_dataguard.sh
    
    # Verificar configuración
    sleep 30
    chmod +x verify_dataguard.sh
    ./verify_dataguard.sh
}

# Crear snapshot inicial
create_initial_snapshot() {
    log "Creando snapshot inicial..."
    
    chmod +x snapshot_manager.sh
    ./snapshot_manager.sh create "initial_deployment_$(date +%Y%m%d_%H%M%S)"
    
    log "Snapshot inicial creado ✓"
}

# Mostrar información de conexión
show_connection_info() {
    log "=== INFORMACIÓN DE CONEXIÓN ==="
    
    echo ""
    echo "Primary Database:"
    echo "  Host: localhost"
    echo "  Puerto: 1521"
    echo "  SID: ORCL"
    echo "  Usuario: sys"
    echo "  Contraseña: Oracle123"
    echo "  Conexión: sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba"
    echo ""
    echo "Standby Database:"
    echo "  Host: localhost"
    echo "  Puerto: 1522"
    echo "  SID: ORCL"
    echo "  Usuario: sys"
    echo "  Contraseña: Oracle123"
    echo "  Conexión: sqlplus sys/Oracle123@localhost:1522/ORCL as sysdba"
    echo ""
    echo "Enterprise Manager:"
    echo "  Primary: https://localhost:5500/em"
    echo "  Standby: https://localhost:5501/em"
    echo ""
}

# Función principal
main() {
    log "Iniciando despliegue de Oracle 19c con Data Guard"
    
    check_prerequisites
    setup_directories
    deploy_primary
    deploy_standby
    activate_dataguard
    create_initial_snapshot
    
    log "¡Despliegue completado exitosamente! ✓"
    show_connection_info
}

# Manejar señales de interrupción
trap 'echo "Despliegue interrumpido"; docker-compose down; exit 1' INT TERM

# Ejecutar función principal
main "$@"
```

### 8.2 Script de Monitoreo y Salud
Crear script `health_check.sh`:

```bash
#!/bin/bash

# Script de monitoreo continuo de Oracle Data Guard

ALERT_EMAIL=""  # Configurar email para alertas
LOG_FILE="./shared/logs/health_check.log"

# Función de logging
log() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" | tee -a "$LOG_FILE"
}

# Verificar estado de containers
check_containers() {
    log "=== VERIFICANDO CONTAINERS ==="
    
    primary_status=$(docker inspect oracle-primary --format='{{.State.Status}}' 2>/dev/null || echo "not_found")
    standby_status=$(docker inspect oracle-standby --format='{{.State.Status}}' 2>/dev/null || echo "not_found")
    
    log "Primary Container: $primary_status"
    log "Standby Container: $standby_status"
    
    if [ "$primary_status" != "running" ] || [ "$standby_status" != "running" ]; then
        log "ERROR: Uno o más containers no están ejecutándose"
        return 1
    fi
    
    return 0
}

# Verificar conectividad de bases de datos
check_database_connectivity() {
    log "=== VERIFICANDO CONECTIVIDAD DE BASES DE DATOS ==="
    
    # Verificar Primary
    primary_check=$(docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT 'PRIMARY_OK' FROM DUAL;
        EXIT;
EOF
    " 2>/dev/null | grep "PRIMARY_OK" | wc -l)
    
    # Verificar Standby
    standby_check=$(docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT 'STANDBY_OK' FROM DUAL;
        EXIT;
EOF
    " 2>/dev/null | grep "STANDBY_OK" | wc -l)
    
    if [ "$primary_check" -eq 1 ]; then
        log "Primary Database: Conectividad OK"
    else
        log "ERROR: Primary Database no responde"
        return 1
    fi
    
    if [ "$standby_check" -eq 1 ]; then
        log "Standby Database: Conectividad OK"
    else
        log "ERROR: Standby Database no responde"
        return 1
    fi
    
    return 0
}

# Verificar sincronización de Data Guard
check_dataguard_sync() {
    log "=== VERIFICANDO SINCRONIZACIÓN DATA GUARD ==="
    
    # Obtener último log sequence del Primary
    primary_seq=$(docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE DEST_ID=1;
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    # Obtener último log sequence aplicado en Standby
    standby_seq=$(docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    log "Primary último sequence: $primary_seq"
    log "Standby último sequence aplicado: $standby_seq"
    
    if [ -n "$primary_seq" ] && [ -n "$standby_seq" ]; then
        lag=$((primary_seq - standby_seq))
        log "Lag de sincronización: $lag logs"
        
        if [ "$lag" -gt 5 ]; then
            log "WARNING: Lag de sincronización alto ($lag logs)"
            return 1
        else
            log "Sincronización OK"
        fi
    else
        log "ERROR: No se pudo obtener información de sequences"
        return 1
    fi
    
    return 0
}

# Verificar espacio en disco
check_disk_space() {
    log "=== VERIFICANDO ESPACIO EN DISCO ==="
    
    # Verificar espacio general
    disk_usage=$(df . | tail -1 | awk '{print $5}' | sed 's/%//')
    log "Uso de disco: ${disk_usage}%"
    
    if [ "$disk_usage" -gt 90 ]; then
        log "ERROR: Espacio en disco crítico (${disk_usage}%)"
        return 1
    elif [ "$disk_usage" -gt 80 ]; then
        log "WARNING: Espacio en disco alto (${disk_usage}%)"
    fi
    
    # Verificar espacio de datos Oracle
    primary_space=$(docker exec oracle-primary bash -c "
        du -sh /opt/oracle/oradata 2>/dev/null | cut -f1
    " 2>/dev/null || echo "N/A")
    
    standby_space=$(docker exec oracle-standby bash -c "
        du -sh /opt/oracle/oradata 2>/dev/null | cut -f1
    " 2>/dev/null || echo "N/A")
    
    log "Espacio datos Primary: $primary_space"
    log "Espacio datos Standby: $standby_space"
    
    return 0
}

# Verificar procesos Oracle
check_oracle_processes() {
    log "=== VERIFICANDO PROCESOS ORACLE ==="
    
    # Verificar procesos en Primary
    primary_processes=$(docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT COUNT(*) FROM V\$PROCESS WHERE PROGRAM LIKE '%ora_%';
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    # Verificar MRP en Standby
    standby_mrp=$(docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT COUNT(*) FROM V\$MANAGED_STANDBY WHERE PROCESS LIKE 'MRP%' AND STATUS='APPLYING_LOG';
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    log "Procesos Oracle en Primary: $primary_processes"
    log "Procesos MRP activos en Standby: $standby_mrp"
    
    if [ -n "$primary_processes" ] && [ "$primary_processes" -gt 0 ]; then
        log "Procesos Primary: OK"
    else
        log "ERROR: Procesos Oracle no detectados en Primary"
        return 1
    fi
    
    if [ -n "$standby_mrp" ] && [ "$standby_mrp" -gt 0 ]; then
        log "Proceso MRP Standby: OK"
    else
        log "WARNING: Proceso MRP no activo en Standby"
    fi
    
    return 0
}

# Generar reporte de salud
generate_health_report() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local report_file="./shared/logs/health_report_$(date '+%Y%m%d_%H%M%S').txt"
    
    {
        echo "=== REPORTE DE SALUD ORACLE DATA GUARD ==="
        echo "Fecha: $timestamp"
        echo ""
        
        echo "Estado de Containers:"
        docker ps --filter name=oracle- --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
        echo ""
        
        echo "Uso de recursos:"
        docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"
        echo ""
        
        echo "Información de Data Guard:"
        docker exec oracle-primary bash -c "
            export ORACLE_SID=ORCL
            export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
            export PATH=\$PATH:\$ORACLE_HOME/bin
            
            sqlplus -s / as sysdba << 'EOF'
            SET PAGESIZE 100 LINESIZE 150
            COL DATABASE_ROLE FORMAT A20
            COL PROTECTION_MODE FORMAT A20
            SELECT DATABASE_ROLE, PROTECTION_MODE FROM V\$DATABASE;
            
            COL DEST_NAME FORMAT A30
            COL STATUS FORMAT A20
            SELECT DEST_NAME, STATUS FROM V\$ARCHIVE_DEST_STATUS WHERE DEST_ID <= 2;
EOF
        " 2>/dev/null
        
    } > "$report_file"
    
    log "Reporte de salud generado: $report_file"
}

# Función de alerta
send_alert() {
    local message="$1"
    local priority="$2"  # HIGH, MEDIUM, LOW
    
    log "ALERTA [$priority]: $message"
    
    # Aquí puedes agregar integración con sistemas de alertas
    # Ejemplo: email, Slack, PagerDuty, etc.
    
    if [ -n "$ALERT_EMAIL" ]; then
        echo "Alerta Oracle Data Guard [$priority]: $message" | mail -s "Oracle Alert" "$ALERT_EMAIL"
    fi
}

# Función principal de verificación
run_health_checks() {
    local overall_status=0
    
    log "=== INICIANDO VERIFICACIONES DE SALUD ==="
    
    if ! check_containers; then
        send_alert "Containers no están ejecutándose correctamente" "HIGH"
        overall_status=1
    fi
    
    if ! check_database_connectivity; then
        send_alert "Problemas de conectividad en bases de datos" "HIGH"
        overall_status=1
    fi
    
    if ! check_dataguard_sync; then
        send_alert "Problemas de sincronización en Data Guard" "MEDIUM"
        overall_status=1
    fi
    
    if ! check_disk_space; then
        send_alert "Problemas de espacio en disco" "MEDIUM"
    fi
    
    if ! check_oracle_processes; then
        send_alert "Problemas en procesos Oracle" "MEDIUM"
    fi
    
    if [ $overall_status -eq 0 ]; then
        log "=== TODAS LAS VERIFICACIONES PASARON ✓ ==="
    else
        log "=== ALGUNAS VERIFICACIONES FALLARON ✗ ==="
    fi
    
    return $overall_status
}

# Monitoreo continuo
continuous_monitoring() {
    local interval=${1:-300}  # Default 5 minutos
    
    log "Iniciando monitoreo continuo (intervalo: ${interval}s)"
    
    while true; do
        run_health_checks
        
        # Generar reporte cada hora
        current_minute=$(date '+%M')
        if [ "$current_minute" = "00" ]; then
            generate_health_report
        fi
        
        sleep $interval
    done
}

# Crear directorio de logs si no existe
mkdir -p ./shared/logs

# Manejar argumentos
case "$1" in
    "run")
        run_health_checks
        ;;
    "monitor")
        continuous_monitoring "$2"
        ;;
    "report")
        generate_health_report
        ;;
    *)
        echo "Uso: $0 {run|monitor|report} [intervalo_segundos]"
        echo ""
        echo "Comandos:"
        echo "  run      - Ejecutar verificaciones una vez"
        echo "  monitor  - Monitoreo continuo (default: 300s)"
        echo "  report   - Generar reporte de salud"
        echo ""
        echo "Ejemplos:"
        echo "  $0 run"
        echo "  $0 monitor 600    # Monitoreo cada 10 minutos"
        echo "  $0 report"
        exit 1
        ;;
esac
```

---

## 9. Preparación para Exportación de Datos

### 9.1 Script de Exportación con Data Pump
Crear script `export_data.sh`:

```bash
#!/bin/bash

# Script para exportar datos usando Oracle Data Pump

EXPORT_DIR="./shared/exports"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Función de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Crear directorio de exportación en Oracle
setup_export_directory() {
    log "Configurando directorio de exportación en Oracle..."
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        # Crear directorio físico
        mkdir -p /opt/oracle/shared/exports
        
        sqlplus / as sysdba << 'EOF'
        -- Crear directory object
        CREATE OR REPLACE DIRECTORY EXPORT_DIR AS '/opt/oracle/shared/exports';
        
        -- Otorgar permisos
        GRANT READ, WRITE ON DIRECTORY EXPORT_DIR TO SYSTEM;
        GRANT READ, WRITE ON DIRECTORY EXPORT_DIR TO c##replication;
        
        -- Verificar directorio
        SELECT DIRECTORY_NAME, DIRECTORY_PATH FROM DBA_DIRECTORIES WHERE DIRECTORY_NAME = 'EXPORT_DIR';
        
        EXIT;
EOF
    "
}

# Exportación completa de la base de datos
export_full_database() {
    local export_name="full_export_$TIMESTAMP"
    
    log "=== INICIANDO EXPORTACIÓN COMPLETA DE BASE DE DATOS ==="
    log "Nombre del export: $export_name"
    
    # Crear snapshot antes del export
    log "Creando snapshot automático antes del export..."
    ./auto_snapshot.sh "full_export" echo "Export iniciado"
    
    # Ejecutar export
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        expdp system/Oracle123@ORCL \\
            DIRECTORY=EXPORT_DIR \\
            DUMPFILE=${export_name}.dmp \\
            LOGFILE=${export_name}.log \\
            FULL=Y \\
            COMPRESSION=ALL \\
            PARALLEL=2
    "
    
    if [ $? -eq 0 ]; then
        log "Exportación completa finalizada exitosamente"
        
        # Crear archivo de metadatos
        create_export_metadata "$export_name" "FULL" "Complete database export"
        
        # Mostrar información del archivo generado
        show_export_info "$export_name"
    else
        log "ERROR: Falló la exportación completa"
        return 1
    fi
}

# Exportación por esquemas
export_schemas() {
    local schemas="$1"
    local export_name="schemas_export_$TIMESTAMP"
    
    if [ -z "$schemas" ]; then
        echo "Error: Debe especificar los esquemas a exportar"
        echo "Uso: $0 export_schemas SCHEMA1,SCHEMA2,SCHEMA3"
        return 1
    fi
    
    log "=== INICIANDO EXPORTACIÓN DE ESQUEMAS ==="
    log "Esquemas: $schemas"
    log "Nombre del export: $export_name"
    
    # Crear snapshot automático
    ./auto_snapshot.sh "schema_export" echo "Export de esquemas iniciado"
    
    # Ejecutar export
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        expdp system/Oracle123@ORCL \\
            DIRECTORY=EXPORT_DIR \\
            DUMPFILE=${export_name}.dmp \\
            LOGFILE=${export_name}.log \\
            SCHEMAS=$schemas \\
            COMPRESSION=ALL \\
            PARALLEL=2
    "
    
    if [ $? -eq 0 ]; then
        log "Exportación de esquemas finalizada exitosamente"
        create_export_metadata "$export_name" "SCHEMAS" "Schemas: $schemas"
        show_export_info "$export_name"
    else
        log "ERROR: Falló la exportación de esquemas"
        return 1
    fi
}

# Exportación por tablas específicas
export_tables() {
    local tables="$1"
    local export_name="tables_export_$TIMESTAMP"
    
    if [ -z "$tables" ]; then
        echo "Error: Debe especificar las tablas a exportar"
        echo "Uso: $0 export_tables OWNER.TABLE1,OWNER.TABLE2"
        return 1
    fi
    
    log "=== INICIANDO EXPORTACIÓN DE TABLAS ==="
    log "Tablas: $tables"
    log "Nombre del export: $export_name"
    
    # Crear snapshot automático
    ./auto_snapshot.sh "table_export" echo "Export de tablas iniciado"
    
    # Ejecutar export
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        expdp system/Oracle123@ORCL \\
            DIRECTORY=EXPORT_DIR \\
            DUMPFILE=${export_name}.dmp \\
            LOGFILE=${export_name}.log \\
            TABLES=$tables \\
            COMPRESSION=ALL
    "
    
    if [ $? -eq 0 ]; then
        log "Exportación de tablas finalizada exitosamente"
        create_export_metadata "$export_name" "TABLES" "Tables: $tables"
        show_export_info "$export_name"
    else
        log "ERROR: Falló la exportación de tablas"
        return 1
    fi
}

# Exportación incremental (solo metadatos)
export_metadata_only() {
    local export_name="metadata_export_$TIMESTAMP"
    
    log "=== INICIANDO EXPORTACIÓN SOLO METADATOS ==="
    log "Nombre del export: $export_name"
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        expdp system/Oracle123@ORCL \\
            DIRECTORY=EXPORT_DIR \\
            DUMPFILE=${export_name}.dmp \\
            LOGFILE=${export_name}.log \\
            CONTENT=METADATA_ONLY \\
            FULL=Y
    "
    
    if [ $? -eq 0 ]; then
        log "Exportación de metadatos finalizada exitosamente"
        create_export_metadata "$export_name" "METADATA" "Metadata only export"
        show_export_info "$export_name"
    else
        log "ERROR: Falló la exportación de metadatos"
        return 1
    fi
}

# Crear archivo de metadatos para el export
create_export_metadata() {
    local export_name="$1"
    local export_type="$2"
    local description="$3"
    
    local metadata_file="$EXPORT_DIR/${export_name}_metadata.txt"
    
    cat > "$metadata_file" << EOF
Export Metadata
===============
Export Name: $export_name
Export Type: $export_type
Description: $description
Creation Date: $(date)
Database: ORCL (Primary)
Oracle Version: 19c
Compression: ALL
Parallel Degree: 2

Files Generated:
- ${export_name}.dmp (Data Pump export file)
- ${export_name}.log (Export log file)
- ${export_name}_metadata.txt (This metadata file)

Database Information at Export Time:
$(docker exec oracle-primary bash -c "
    export ORACLE_SID=ORCL
    export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
    export PATH=\$PATH:\$ORACLE_HOME/bin
    
    sqlplus -s / as sysdba << 'SQLEOF'
    SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
    SELECT 'Database Name: ' || NAME FROM V\$DATABASE;
    SELECT 'Database Role: ' || DATABASE_ROLE FROM V\$DATABASE;
    SELECT 'Archive Log Mode: ' || LOG_MODE FROM V\$DATABASE;
    SELECT 'Total Size: ' || ROUND(SUM(BYTES)/1024/1024/1024,2) || ' GB' FROM DBA_DATA_FILES;
    SQLEOF
" 2>/dev/null)

Data Guard Status:
$(docker exec oracle-primary bash -c "
    export ORACLE_SID=ORCL
    export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
    export PATH=\$PATH:\$ORACLE_HOME/bin
    
    sqlplus -s / as sysdba << 'SQLEOF'
    SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
    SELECT 'Protection Mode: ' || PROTECTION_MODE FROM V\$DATABASE;
    SELECT 'Standby Status: ' || STATUS FROM V\$ARCHIVE_DEST WHERE DEST_ID=2;
    SQLEOF
" 2>/dev/null)
EOF
    
    log "Metadatos creados: $metadata_file"
}

# Mostrar información del export generado
show_export_info() {
    local export_name="$1"
    
    log "=== INFORMACIÓN DEL EXPORT GENERADO ==="
    
    # Mostrar archivos generados
    ls -lh "$EXPORT_DIR/${export_name}"* 2>/dev/null || ls -lh "$EXPORT_DIR/"*"${export_name}"* 2>/dev/null
    
    # Mostrar log del export (últimas líneas)
    if [ -f "$EXPORT_DIR/${export_name}.log" ]; then
        echo ""
        echo "Últimas líneas del log de exportación:"
        echo "====================================="
        tail -20 "$EXPORT_DIR/${export_name}.log"
    fi
    
    echo ""
    echo "Archivos disponibles en: $EXPORT_DIR"
    echo "Para importar usar: impdp system/Oracle123@TARGET_DB DIRECTORY=IMPORT_DIR DUMPFILE=${export_name}.dmp"
}

# Listar exports disponibles
list_exports() {
    log "=== EXPORTS DISPONIBLES ==="
    
    if [ -d "$EXPORT_DIR" ] && [ "$(ls -A $EXPORT_DIR 2>/dev/null)" ]; then
        echo "Directorio: $EXPORT_DIR"
        echo ""
        
        # Buscar archivos .dmp
        for dump_file in "$EXPORT_DIR"/*.dmp 2>/dev/null; do
            if [ -f "$dump_file" ]; then
                base_name=$(basename "$dump_file" .dmp)
                size=$(ls -lh "$dump_file" | awk '{print $5}')
                date=$(ls -l "$dump_file" | awk '{print $6, $7, $8}')
                
                echo "Export: $base_name"
                echo "  Archivo: $(basename "$dump_file")"
                echo "  Tamaño: $size"
                echo "  Fecha: $date"
                
                # Mostrar metadatos si existen
                if [ -f "$EXPORT_DIR/${base_name}_metadata.txt" ]; then
                    echo "  Tipo: $(grep "Export Type:" "$EXPORT_DIR/${base_name}_metadata.txt" | cut -d: -f2 | xargs)"
                    echo "  Descripción: $(grep "Description:" "$EXPORT_DIR/${base_name}_metadata.txt" | cut -d: -f2 | xargs)"
                fi
                
                echo "---"
            fi
        done
    else
        echo "No hay exports disponibles"
    fi
}

# Limpiar exports antiguos
cleanup_old_exports() {
    local days_to_keep=${1:-30}  # Default 30 días
    
    log "Limpiando exports anteriores a $days_to_keep días..."
    
    if [ -d "$EXPORT_DIR" ]; then
        # Buscar archivos antiguos
        old_files=$(find "$EXPORT_DIR" -name "*.dmp" -mtime +$days_to_keep 2>/dev/null)
        
        if [ -n "$old_files" ]; then
            echo "Archivos a eliminar:"
            echo "$old_files" | while read file; do
                echo "  $file"
                base_name=$(basename "$file" .dmp)
                
                # Eliminar archivos relacionados
                rm -f "$file"
                rm -f "$EXPORT_DIR/${base_name}.log"
                rm -f "$EXPORT_DIR/${base_name}_metadata.txt"
                
                log "Eliminado: $(basename "$file")"
            done
        else
            log "No hay exports antiguos para eliminar"
        fi
    fi
}

# Verificar integridad del export
verify_export() {
    local export_name="$1"
    
    if [ -z "$export_name" ]; then
        echo "Error: Debe especificar el nombre del export"
        list_exports
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/${export_name}.dmp" ]; then
        echo "Error: Export $export_name no encontrado"
        return 1
    fi
    
    log "=== VERIFICANDO INTEGRIDAD DEL EXPORT: $export_name ==="
    
    # Usar impdp en modo SQLFILE para verificar sin importar
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        impdp system/Oracle123@ORCL \\
            DIRECTORY=EXPORT_DIR \\
            DUMPFILE=${export_name}.dmp \\
            LOGFILE=${export_name}_verify.log \\
            SQLFILE=${export_name}_verify.sql \\
            CONTENT=METADATA_ONLY
    "
    
    if [ $? -eq 0 ]; then
        log "Verificación completada. El export es válido."
        echo "Archivos de verificación generados:"
        echo "  - ${export_name}_verify.log"
        echo "  - ${export_name}_verify.sql"
    else
        log "ERROR: El export parece estar corrupto o incompleto"
        return 1
    fi
}

# Crear directorio de exports si no existe
mkdir -p "$EXPORT_DIR"

# Configurar directorio en Oracle la primera vez
if [ ! -f "$EXPORT_DIR/.oracle_dir_configured" ]; then
    setup_export_directory
    touch "$EXPORT_DIR/.oracle_dir_configured"
fi

# Manejar argumentos de línea de comandos
case "$1" in
    "full")
        export_full_database
        ;;
    "schemas")
        export_schemas "$2"
        ;;
    "tables")
        export_tables "$2"
        ;;
    "metadata")
        export_metadata_only
        ;;
    "list")
        list_exports
        ;;
    "cleanup")
        cleanup_old_exports "$2"
        ;;
    "verify")
        verify_export "$2"
        ;;
    *)
        echo "Uso: $0 {full|schemas|tables|metadata|list|cleanup|verify} [parámetros]"
        echo ""
        echo "Comandos de exportación:"
        echo "  full                     - Exportación completa de la base de datos"
        echo "  schemas <lista>          - Exportar esquemas específicos (ej: HR,SCOTT)"
        echo "  tables <lista>           - Exportar tablas específicas (ej: HR.EMPLOYEES,SCOTT.DEPT)"
        echo "  metadata                 - Exportar solo metadatos (estructura sin datos)"
        echo ""
        echo "Comandos de gestión:"
        echo "  list                     - Listar exports disponibles"
        echo "  cleanup [días]           - Limpiar exports anteriores a N días (default: 30)"
        echo "  verify <export_name>     - Verificar integridad de un export"
        echo ""
        echo "Ejemplos:"
        echo "  $0 full"
        echo "  $0 schemas HR,SCOTT,OE"
        echo "  $0 tables HR.EMPLOYEES,HR.DEPARTMENTS"
        echo "  $0 cleanup 15"
        echo "  $0 verify full_export_20241201_143022"
        exit 1
        ;;
esac
```

### 9.2 Script de Importación de Datos
Crear script `import_data.sh`:

```bash
#!/bin/bash

# Script para importar datos usando Oracle Data Pump

EXPORT_DIR="./shared/exports"
IMPORT_LOG_DIR="./shared/logs/imports"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Función de logging
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Configurar directorio de importación
setup_import_directory() {
    log "Configurando directorio de importación..."
    
    mkdir -p "$IMPORT_LOG_DIR"
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus / as sysdba << 'EOF'
        -- Verificar que el directorio existe
        SELECT DIRECTORY_NAME, DIRECTORY_PATH FROM DBA_DIRECTORIES WHERE DIRECTORY_NAME = 'EXPORT_DIR';
        
        -- Crear directorio de importación si no existe
        CREATE OR REPLACE DIRECTORY IMPORT_DIR AS '/opt/oracle/shared/exports';
        GRANT READ, WRITE ON DIRECTORY IMPORT_DIR TO SYSTEM;
        GRANT READ, WRITE ON DIRECTORY IMPORT_DIR TO c##replication;
        
        EXIT;
EOF
    "
}

# Importación completa
import_full_database() {
    local export_file="$1"
    local target_mode="${2:-REPLACE}"  # REPLACE, SKIP, APPEND
    
    if [ -z "$export_file" ]; then
        echo "Error: Debe especificar el archivo de export"
        echo "Uso: $0 import_full <export_file> [REPLACE|SKIP|APPEND]"
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/$export_file" ]; then
        echo "Error: Archivo $export_file no encontrado en $EXPORT_DIR"
        return 1
    fi
    
    log "=== INICIANDO IMPORTACIÓN COMPLETA ==="
    log "Archivo: $export_file"
    log "Modo: $target_mode"
    
    # Crear snapshot antes de la importación
    log "Creando snapshot automático antes de la importación..."
    ./auto_snapshot.sh "full_import" echo "Importación iniciada"
    
    local log_file="full_import_${TIMESTAMP}.log"
    
    # Ejecutar importación
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        impdp system/Oracle123@ORCL \\
            DIRECTORY=IMPORT_DIR \\
            DUMPFILE=$export_file \\
            LOGFILE=$log_file \\
            FULL=Y \\
            TABLE_EXISTS_ACTION=$target_mode \\
            PARALLEL=2
    "
    
    if [ $? -eq 0 ]; then
        log "Importación completa finalizada exitosamente"
        
        # Copiar log al directorio de logs
        cp "$EXPORT_DIR/$log_file" "$IMPORT_LOG_DIR/" 2>/dev/null
        
        show_import_results "$log_file"
    else
        log "ERROR: Falló la importación completa"
        return 1
    fi
}

# Importación por esquemas con remapping
import_schemas() {
    local export_file="$1"
    local source_schemas="$2"
    local target_schemas="$3"
    local target_mode="${4:-REPLACE}"
    
    if [ -z "$export_file" ] || [ -z "$source_schemas" ]; then
        echo "Error: Debe especificar archivo y esquemas"
        echo "Uso: $0 import_schemas <export_file> <source_schemas> [target_schemas] [REPLACE|SKIP|APPEND]"
        echo "Ejemplo: $0 import_schemas schemas_export.dmp HR,SCOTT HRDEV,SCOTTDEV"
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/$export_file" ]; then
        echo "Error: Archivo $export_file no encontrado"
        return 1
    fi
    
    log "=== INICIANDO IMPORTACIÓN DE ESQUEMAS ==="
    log "Archivo: $export_file"
    log "Esquemas origen: $source_schemas"
    log "Esquemas destino: ${target_schemas:-$source_schemas}"
    log "Modo: $target_mode"
    
    # Crear snapshot automático
    ./auto_snapshot.sh "schema_import" echo "Importación de esquemas iniciada"
    
    local log_file="schema_import_${TIMESTAMP}.log"
    local remap_params=""
    
    # Generar parámetros de remapping si se especifican esquemas destino
    if [ -n "$target_schemas" ]; then
        IFS=',' read -ra SOURCE_ARRAY <<< "$source_schemas"
        IFS=',' read -ra TARGET_ARRAY <<< "$target_schemas"
        
        for i in "${!SOURCE_ARRAY[@]}"; do
            if [ -n "${TARGET_ARRAY[i]}" ]; then
                remap_params="$remap_params REMAP_SCHEMA=${SOURCE_ARRAY[i]}:${TARGET_ARRAY[i]}"
            fi
        done
    fi
    
    # Ejecutar importación
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        impdp system/Oracle123@ORCL \\
            DIRECTORY=IMPORT_DIR \\
            DUMPFILE=$export_file \\
            LOGFILE=$log_file \\
            SCHEMAS=$source_schemas \\
            $remap_params \\
            TABLE_EXISTS_ACTION=$target_mode \\
            PARALLEL=2
    "
    
    if [ $? -eq 0 ]; then
        log "Importación de esquemas finalizada exitosamente"
        cp "$EXPORT_DIR/$log_file" "$IMPORT_LOG_DIR/" 2>/dev/null
        show_import_results "$log_file"
    else
        log "ERROR: Falló la importación de esquemas"
        return 1
    fi
}

# Importación de tablas específicas
import_tables() {
    local export_file="$1"
    local tables="$2"
    local target_schema="$3"
    local target_mode="${4:-REPLACE}"
    
    if [ -z "$export_file" ] || [ -z "$tables" ]; then
        echo "Error: Debe especificar archivo y tablas"
        echo "Uso: $0 import_tables <export_file> <tables> [target_schema] [REPLACE|SKIP|APPEND]"
        echo "Ejemplo: $0 import_tables tables_export.dmp HR.EMPLOYEES,HR.DEPARTMENTS HRDEV"
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/$export_file" ]; then
        echo "Error: Archivo $export_file no encontrado"
        return 1
    fi
    
    log "=== INICIANDO IMPORTACIÓN DE TABLAS ==="
    log "Archivo: $export_file"
    log "Tablas: $tables"
    log "Esquema destino: ${target_schema:-original}"
    log "Modo: $target_mode"
    
    ./auto_snapshot.sh "table_import" echo "Importación de tablas iniciada"
    
    local log_file="table_import_${TIMESTAMP}.log"
    local remap_param=""
    
    # Generar parámetro de remapping de esquema si se especifica
    if [ -n "$target_schema" ]; then
        # Extraer el esquema origen de la primera tabla
        source_schema=$(echo "$tables" | cut -d'.' -f1 | cut -d',' -f1)
        remap_param="REMAP_SCHEMA=$source_schema:$target_schema"
    fi
    
    # Ejecutar importación
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        impdp system/Oracle123@ORCL \\
            DIRECTORY=IMPORT_DIR \\
            DUMPFILE=$export_file \\
            LOGFILE=$log_file \\
            TABLES=$tables \\
            $remap_param \\
            TABLE_EXISTS_ACTION=$target_mode
    "
    
    if [ $? -eq 0 ]; then
        log "Importación de tablas finalizada exitosamente"
        cp "$EXPORT_DIR/$log_file" "$IMPORT_LOG_DIR/" 2>/dev/null
        show_import_results "$log_file"
    else
        log "ERROR: Falló la importación de tablas"
        return 1
    fi
}

# Importación solo de metadatos
import_metadata_only() {
    local export_file="$1"
    local target_schemas="$2"
    
    if [ -z "$export_file" ]; then
        echo "Error: Debe especificar el archivo de export"
        echo "Uso: $0 import_metadata <export_file> [target_schemas]"
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/$export_file" ]; then
        echo "Error: Archivo $export_file no encontrado"
        return 1
    fi
    
    log "=== INICIANDO IMPORTACIÓN SOLO METADATOS ==="
    log "Archivo: $export_file"
    
    local log_file="metadata_import_${TIMESTAMP}.log"
    local schema_param=""
    
    if [ -n "$target_schemas" ]; then
        schema_param="SCHEMAS=$target_schemas"
    else
        schema_param="FULL=Y"
    fi
    
    # Ejecutar importación
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        impdp system/Oracle123@ORCL \\
            DIRECTORY=IMPORT_DIR \\
            DUMPFILE=$export_file \\
            LOGFILE=$log_file \\
            $schema_param \\
            CONTENT=METADATA_ONLY
    "
    
    if [ $? -eq 0 ]; then
        log "Importación de metadatos finalizada exitosamente"
        cp "$EXPORT_DIR/$log_file" "$IMPORT_LOG_DIR/" 2>/dev/null
        show_import_results "$log_file"
    else
        log "ERROR: Falló la importación de metadatos"
        return 1
    fi
}

# Mostrar resultados de la importación
show_import_results() {
    local log_file="$1"
    
    log "=== RESULTADOS DE LA IMPORTACIÓN ==="
    
    # Mostrar resumen desde el log
    if [ -f "$EXPORT_DIR/$log_file" ]; then
        echo ""
        echo "Resumen de la importación:"
        echo "=========================="
        
        # Extraer información relevante del log
        grep -E "(Master table|Job|completed successfully|ORA-|errors|warnings)" "$EXPORT_DIR/$log_file" | tail -20
        
        echo ""
        echo "Log completo disponible en: $EXPORT_DIR/$log_file"
        echo "Copia del log en: $IMPORT_LOG_DIR/$log_file"
    fi
    
    # Mostrar estadísticas de la base de datos después de la importación
    echo ""
    echo "Estadísticas actuales de la base de datos:"
    echo "=========================================="
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 20 LINESIZE 100
        COL OWNER FORMAT A20
        COL OBJECT_TYPE FORMAT A20
        COL COUNT FORMAT 999999
        
        SELECT OWNER, OBJECT_TYPE, COUNT(*) as COUNT
        FROM DBA_OBJECTS 
        WHERE OWNER NOT IN ('SYS','SYSTEM','OUTLN','DBSNMP','APPQOSSYS','DBSFWUSER','GGSYS','ANONYMOUS','CTXSYS','DVF','DVSYS','GSMADMIN_INTERNAL','LBACSYS','MDSYS','OJVMSYS','OLAPSYS','ORDDATA','ORDSYS','REMOTE_SCHEDULER_AGENT','WK_TEST','WKSYS','WK_PROXY','WKPROXY','XDB','XS\$NULL')
        GROUP BY OWNER, OBJECT_TYPE
        ORDER BY OWNER, OBJECT_TYPE;
        
        EXIT;
EOF
    "
}

# Listar logs de importaciones
list_import_logs() {
    log "=== LOGS DE IMPORTACIONES DISPONIBLES ==="
    
    if [ -d "$IMPORT_LOG_DIR" ] && [ "$(ls -A $IMPORT_LOG_DIR 2>/dev/null)" ]; then
        echo "Directorio: $IMPORT_LOG_DIR"
        echo ""
        
        ls -lt "$IMPORT_LOG_DIR"/*.log 2>/dev/null | while read line; do
            echo "$line"
        done
    else
        echo "No hay logs de importación disponibles"
    fi
}

# Script de pre-validación para importación
pre_import_validation() {
    local export_file="$1"
    
    if [ -z "$export_file" ]; then
        echo "Error: Debe especificar el archivo de export"
        return 1
    fi
    
    if [ ! -f "$EXPORT_DIR/$export_file" ]; then
        echo "Error: Archivo $export_file no encontrado"
        return 1
    fi
    
    log "=== VALIDACIÓN PRE-IMPORTACIÓN ==="
    log "Archivo: $export_file"
    
    # Verificar integridad del archivo
    log "Verificando integridad del archivo..."
    if ! file "$EXPORT_DIR/$export_file" | grep -q "data"; then
        log "WARNING: El archivo podría no ser un archivo válido de Data Pump"
    fi
    
    # Verificar espacio disponible
    log "Verificando espacio disponible..."
    file_size=$(stat -f%z "$EXPORT_DIR/$export_file" 2>/dev/null || stat -c%s "$EXPORT_DIR/$export_file" 2>/dev/null)
    available_space=$(df "$EXPORT_DIR" | tail -1 | awk '{print $4}')
    available_space_bytes=$((available_space * 1024))
    
    if [ "$file_size" -gt "$available_space_bytes" ]; then
        log "ERROR: Espacio insuficiente para la importación"
        return 1
    fi
    
    log "Espacio suficiente disponible ✓"
    
    # Verificar conectividad a la base de datos
    log "Verificando conectividad a la base de datos..."
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT 'DB_CONNECTION_OK' FROM DUAL;
        EXIT;
EOF
    " | grep -q "DB_CONNECTION_OK"
    
    if [ $? -eq 0 ]; then
        log "Conectividad a la base de datos ✓"
    else
        log "ERROR: No se puede conectar a la base de datos"
        return 1
    fi
    
    log "Validación pre-importación completada exitosamente ✓"
    return 0
}

# Configurar directorios
mkdir -p "$IMPORT_LOG_DIR"
setup_import_directory

# Manejar argumentos de línea de comandos
case "$1" in
    "full")
        if pre_import_validation "$2"; then
            import_full_database "$2" "$3"
        fi
        ;;
    "schemas")
        if pre_import_validation "$2"; then
            import_schemas "$2" "$3" "$4" "$5"
        fi
        ;;
    "tables")
        if pre_import_validation "$2"; then
            import_tables "$2" "$3" "$4" "$5"
        fi
        ;;
    "metadata")
        if pre_import_validation "$2"; then
            import_metadata_only "$2" "$3"
        fi
        ;;
    "validate")
        pre_import_validation "$2"
        ;;
    "logs")
        list_import_logs
        ;;
    *)
        echo "Uso: $0 {full|schemas|tables|metadata|validate|logs} [parámetros]"
        echo ""
        echo "Comandos de importación:"
        echo "  full <export_file> [REPLACE|SKIP|APPEND]"
        echo "    - Importación completa de la base de datos"
        echo ""
        echo "  schemas <export_file> <source_schemas> [target_schemas] [REPLACE|SKIP|APPEND]"
        echo "    - Importar esquemas específicos con opcional remapping"
        echo ""
        echo "  tables <export_file> <tables> [target_schema] [REPLACE|SKIP|APPEND]"
        echo "    - Importar tablas específicas con opcional remapping"
        echo ""
        echo "  metadata <export_file> [schemas]"
        echo "    - Importar solo metadatos (estructura sin datos)"
        echo ""
        echo "Comandos de utilidad:"
        echo "  validate <export_file>"
        echo "    - Validar archivo antes de importar"
        echo ""
        echo "  logs"
        echo "    - Listar logs de importaciones anteriores"
        echo ""
        echo "Ejemplos:"
        echo "  $0 full full_export_20241201.dmp REPLACE"
        echo "  $0 schemas schemas_export.dmp HR,SCOTT HRDEV,SCOTTDEV"
        echo "  $0 tables tables_export.dmp HR.EMPLOYEES,HR.DEPARTMENTS HRTEST"
        echo "  $0 validate export_file.dmp"
        exit 1
        ;;
esac
```

---

## 10. Monitoreo y Mantenimiento

### 10.1 Script de Mantenimiento Automático
Crear script `maintenance.sh`:

```bash
#!/bin/bash

# Script de mantenimiento automático para Oracle Data Guard

MAINTENANCE_LOG="./shared/logs/maintenance.log"
ALERT_THRESHOLD_ARCHIVE_LAG=10  # Número máximo de logs de diferencia
ALERT_THRESHOLD_DISK_USAGE=85  # Porcentaje máximo de uso de disco

# Función de logging
log() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" | tee -a "$MAINTENANCE_LOG"
}

# Limpieza de archive logs antiguos
cleanup_archive_logs() {
    local retention_days=${1:-7}  # Default 7 días
    
    log "=== LIMPIEZA DE ARCHIVE LOGS ==="
    log "Retention: $retention_days días"
    
    # Limpiar archive logs en Primary
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        rman target / << 'RMAN_EOF'
        CROSSCHECK ARCHIVELOG ALL;
        DELETE NOPROMPT EXPIRED ARCHIVELOG ALL;
        DELETE NOPROMPT ARCHIVELOG ALL COMPLETED BEFORE 'SYSDATE-$retention_days';
        EXIT;
RMAN_EOF
    "
    
    # Limpiar archive logs en Standby
    docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        rman target / << 'RMAN_EOF'
        CROSSCHECK ARCHIVELOG ALL;
        DELETE NOPROMPT EXPIRED ARCHIVELOG ALL;
        DELETE NOPROMPT ARCHIVELOG ALL COMPLETED BEFORE 'SYSDATE-$retention_days';
        EXIT;
RMAN_EOF
    " 2>/dev/null || log "WARNING: No se pudo limpiar archive logs en Standby"
    
    log "Limpieza de archive logs completada"
}

# Actualización de estadísticas
update_statistics() {
    log "=== ACTUALIZANDO ESTADÍSTICAS ==="
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus / as sysdba << 'EOF'
        -- Actualizar estadísticas del sistema
        EXEC DBMS_STATS.GATHER_SYSTEM_STATS();
        
        -- Actualizar estadísticas del diccionario
        EXEC DBMS_STATS.GATHER_DICTIONARY_STATS();
        
        -- Actualizar estadísticas de esquemas principales
        BEGIN
            FOR schema_rec IN (
                SELECT DISTINCT OWNER 
                FROM DBA_TABLES 
                WHERE OWNER NOT IN ('SYS','SYSTEM','OUTLN','DBSNMP','APPQOSSYS','DBSFWUSER','GGSYS','ANONYMOUS','CTXSYS','DVF','DVSYS','GSMADMIN_INTERNAL','LBACSYS','MDSYS','OJVMSYS','OLAPSYS','ORDDATA','ORDSYS','REMOTE_SCHEDULER_AGENT','WK_TEST','WKSYS','WK_PROXY','WKPROXY','XDB','XS\$NULL')
                AND ROWNUM <= 10
            ) LOOP
                BEGIN
                    DBMS_STATS.GATHER_SCHEMA_STATS(
                        ownname => schema_rec.OWNER,
                        degree => 2,
                        cascade => TRUE
                    );
                    DBMS_OUTPUT.PUT_LINE('Estadísticas actualizadas para: ' || schema_rec.OWNER);
                EXCEPTION
                    WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE('Error actualizando estadísticas para ' || schema_rec.OWNER || ': ' || SQLERRM);
                END;
            END LOOP;
        END;
        /
        
        EXIT;
EOF
    "
    
    log "Actualización de estadísticas completada"
}

# Optimización de índices
rebuild_indexes() {
    log "=== RECONSTRUYENDO ÍNDICES FRAGMENTADOS ==="
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus / as sysdba << 'EOF'
        SET SERVEROUTPUT ON
        DECLARE
            CURSOR index_cursor IS
                SELECT OWNER, INDEX_NAME, TABLESPACE_NAME
                FROM DBA_INDEXES
                WHERE OWNER NOT IN ('SYS','SYSTEM','OUTLN','DBSNMP','APPQOSSYS','DBSFWUSER','GGSYS','ANONYMOUS','CTXSYS','DVF','DVSYS','GSMADMIN_INTERNAL','LBACSYS','MDSYS','OJVMSYS','OLAPSYS','ORDDATA','ORDSYS','REMOTE_SCHEDULER_AGENT','WK_TEST','WKSYS','WK_PROXY','WKPROXY','XDB','XS\$NULL')
                AND STATUS = 'VALID'
                AND ROWNUM <= 20;  -- Limitar para evitar tiempo excesivo
            
            rebuild_sql VARCHAR2(500);
            index_count NUMBER := 0;
        BEGIN
            FOR idx IN index_cursor LOOP
                BEGIN
                    rebuild_sql := 'ALTER INDEX ' || idx.OWNER || '.' || idx.INDEX_NAME || ' REBUILD ONLINE';
                    EXECUTE IMMEDIATE rebuild_sql;
                    index_count := index_count + 1;
                    DBMS_OUTPUT.PUT_LINE('Reconstruido: ' || idx.OWNER || '.' || idx.INDEX_NAME);
                EXCEPTION
                    WHEN OTHERS THEN
                        DBMS_OUTPUT.PUT_LINE('Error reconstruyendo ' || idx.OWNER || '.' || idx.INDEX_NAME || ': ' || SQLERRM);
                END;
            END LOOP;
            
            DBMS_OUTPUT.PUT_LINE('Total índices reconstruidos: ' || index_count);
        END;
        /
        
        EXIT;
EOF
    "
    
    log "Reconstrucción de índices completada"
}

# Verificación y reparación de Data Guard
check_and_repair_dataguard() {
    log "=== VERIFICANDO Y REPARANDO DATA GUARD ==="
    
    # Verificar estado del standby
    standby_status=$(docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT COUNT(*) FROM V\$MANAGED_STANDBY WHERE PROCESS LIKE 'MRP%' AND STATUS='APPLYING_LOG';
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    if [ -z "$standby_status" ] || [ "$standby_status" = "0" ]; then
        log "WARNING: MRP no está activo en Standby. Intentando reiniciar..."
        
        # Reiniciar managed recovery
        docker exec oracle-standby bash -c "
            export ORACLE_SID=ORCL
            export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
            export PATH=\$PATH:\$ORACLE_HOME/bin
            
            sqlplus / as sysdba << 'EOF'
            ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
            ALTER DATABASE RECOVER MANAGED STANDBY DATABASE USING CURRENT LOGFILE DISCONNECT FROM SESSION;
            EXIT;
EOF
        " 2>/dev/null
        
        log "Managed Recovery reiniciado"
    else
        log "Managed Recovery está funcionando correctamente"
    fi
    
    # Verificar lag de sincronización
    primary_seq=$(docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE DEST_ID=1;
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    standby_seq=$(docker exec oracle-standby bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        SELECT MAX(SEQUENCE#) FROM V\$ARCHIVED_LOG WHERE APPLIED='YES';
        EXIT;
EOF
    " 2>/dev/null | tr -d ' \t\n\r')
    
    if [ -n "$primary_seq" ] && [ -n "$standby_seq" ]; then
        lag=$((primary_seq - standby_seq))
        log "Lag actual: $lag archive logs"
        
        if [ "$lag" -gt "$ALERT_THRESHOLD_ARCHIVE_LAG" ]; then
            log "WARNING: Lag alto detectado ($lag logs). Forzando switch de log..."
            
            # Forzar switch de log en primary
            docker exec oracle-primary bash -c "
                export ORACLE_SID=ORCL
                export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
                export PATH=\$PATH:\$ORACLE_HOME/bin
                
                sqlplus / as sysdba << 'EOF'
                ALTER SYSTEM SWITCH LOGFILE;
                ALTER SYSTEM ARCHIVE LOG CURRENT;
                EXIT;
EOF
            "
            
            log "Log switch forzado para reducir lag"
        fi
    fi
}

# Limpieza de logs del sistema
cleanup_system_logs() {
    local retention_days=${1:-30}
    
    log "=== LIMPIEZA DE LOGS DEL SISTEMA ==="
    
    # Limpiar logs de Docker
    docker system prune -f --filter "until=${retention_days}h" 2>/dev/null || true
    
    # Limpiar logs de Oracle
    find ./shared/logs -name "*.log" -mtime +$retention_days -delete 2>/dev/null || true
    find ./primary/logs -name "*.trc" -mtime +$retention_days -delete 2>/dev/null || true
    find ./standby/logs -name "*.trc" -mtime +$retention_days -delete 2>/dev/null || true
    
    # Limpiar snapshots automáticos antiguos
    if [ -d "./shared/snapshots/auto" ]; then
        find ./shared/snapshots/auto -type d -mtime +$retention_days -exec rm -rf {} + 2>/dev/null || true
    fi
    
    log "Limpieza de logs del sistema completada"
}

# Backup de configuración
backup_configuration() {
    local backup_dir="./shared/backups/config_$(date +%Y%m%d_%H%M%S)"
    
    log "=== CREANDO BACKUP DE CONFIGURACIÓN ==="
    
    mkdir -p "$backup_dir"
    
    # Backup de archivos de configuración Docker
    cp docker-compose.yml "$backup_dir/" 2>/dev/null || true
    cp -r primary/scripts "$backup_dir/primary_scripts" 2>/dev/null || true
    cp -r standby/scripts "$backup_dir/standby_scripts" 2>/dev/null || true
    
    # Backup de parámetros de base de datos
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus -s / as sysdba << 'EOF'
        SPOOL /opt/oracle/shared/backups/primary_parameters.txt
        SHOW PARAMETERS;
        SPOOL OFF
        
        SPOOL /opt/oracle/shared/backups/primary_dataguard_config.txt
        SELECT * FROM V\$ARCHIVE_DEST_STATUS;
        SELECT * FROM V\$DATABASE;
        SPOOL OFF
        
        EXIT;
EOF
    " 2>/dev/null || true
    
    # Mover archivos generados al directorio de backup
    mv ./shared/backups/primary_*.txt "$backup_dir/" 2>/dev/null || true
    
    # Crear archivo de metadata
    cat > "$backup_dir/backup_metadata.txt" << EOF
Configuration Backup
==================
Backup Date: $(date)
Docker Compose Version: $(docker-compose version --short 2>/dev/null || echo "N/A")
Primary Container: $(docker inspect oracle-primary --format='{{.Config.Image}}' 2>/dev/null || echo "N/A")
Standby Container: $(docker inspect oracle-standby --format='{{.Config.Image}}' 2>/dev/null || echo "N/A")

Contents:
- docker-compose.yml
- primary_scripts/
- standby_scripts/
- primary_parameters.txt
- primary_dataguard_config.txt
EOF
    
    log "Backup de configuración creado en: $backup_dir"
}

# Optimización de rendimiento
performance_tuning() {
    log "=== OPTIMIZACIÓN DE RENDIMIENTO ==="
    
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus / as sysdba << 'EOF'
        -- Optimizar memoria SGA
        ALTER SYSTEM SET SGA_TARGET=3G SCOPE=SPFILE;
        
        -- Optimizar PGA
        ALTER SYSTEM SET PGA_AGGREGATE_TARGET=1G SCOPE=SPFILE;
        
        -- Optimizar procesos
        ALTER SYSTEM SET PROCESSES=500 SCOPE=SPFILE;
        
        -- Optimizar conexiones
        ALTER SYSTEM SET SESSIONS=500 SCOPE=SPFILE;
        
        -- Optimizar archive log parallelism
        ALTER SYSTEM SET LOG_ARCHIVE_MAX_PROCESSES=4 SCOPE=BOTH;
        
        -- Flush buffer cache para liberar memoria
        ALTER SYSTEM FLUSH BUFFER_CACHE;
        
        -- Mostrar configuración actual
        SELECT name, value FROM v\$parameter WHERE name IN (
            'sga_target', 'pga_aggregate_target', 'processes', 'sessions', 'log_archive_max_processes'
        );
        
        EXIT;
EOF
    "
    
    log "Optimización de rendimiento completada"
}

# Verificación de integridad
integrity_check() {
    log "=== VERIFICACIÓN DE INTEGRIDAD ==="
    
    # Verificar tablespaces
    docker exec oracle-primary bash -c "
        export ORACLE_SID=ORCL
        export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
        export PATH=\$PATH:\$ORACLE_HOME/bin
        
        sqlplus / as sysdba << 'EOF'
        SET PAGESIZE 100 LINESIZE 150
        
        -- Verificar tablespaces
        COL TABLESPACE_NAME FORMAT A30
        COL STATUS FORMAT A20
        SELECT TABLESPACE_NAME, STATUS, CONTENTS FROM DBA_TABLESPACES;
        
        -- Verificar datafiles
        COL FILE_NAME FORMAT A50
        SELECT FILE_NAME, STATUS, ENABLED FROM DBA_DATA_FILES WHERE STATUS != 'AVAILABLE';
        
        -- Verificar objetos inválidos
        COL OWNER FORMAT A20
        COL OBJECT_NAME FORMAT A30
        COL OBJECT_TYPE FORMAT A20
        SELECT OWNER, OBJECT_NAME, OBJECT_TYPE FROM DBA_OBJECTS WHERE STATUS = 'INVALID' AND ROWNUM <= 10;
        
        EXIT;
EOF
    "
    
    log "Verificación de integridad completada"
}

# Generar reporte de mantenimiento
generate_maintenance_report() {
    local report_file="./shared/reports/maintenance_report_$(date +%Y%m%d_%H%M%S).html"
    
    log "=== GENERANDO REPORTE DE MANTENIMIENTO ==="
    
    mkdir -p ./shared/reports
    
    cat > "$report_file" << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Mantenimiento Oracle Data Guard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background-color: #f0f0f0; padding: 20px; border-radius: 5px; }
        .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }
        .ok { color: green; }
        .warning { color: orange; }
        .error { color: red; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        pre { background-color: #f8f8f8; padding: 10px; border-radius: 3px; overflow-x: auto; }
    </style>
</head>
<body>
EOF
    
    # Agregar contenido al reporte
    {
        echo "<div class='header'>"
        echo "<h1>Reporte de Mantenimiento Oracle Data Guard</h1>"
        echo "<p>Fecha de generación: $(date)</p>"
        echo "<p>Sistema: Oracle 19c en Docker</p>"
        echo "</div>"
        
        echo "<div class='section'>"
        echo "<h2>Estado de Containers</h2>"
        echo "<pre>"
        docker ps --filter name=oracle- --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" 2>/dev/null || echo "Error obteniendo estado de containers"
        echo "</pre>"
        echo "</div>"
        
        echo "<div class='section'>"
        echo "<h2>Uso de Recursos</h2>"
        echo "<pre>"
        docker stats --no-stream --filter name=oracle- --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}" 2>/dev/null || echo "Error obteniendo estadísticas"
        echo "</pre>"
        echo "</div>"
        
        echo "<div class='section'>"
        echo "<h2>Estado de Data Guard</h2>"
        echo "<pre>"
        docker exec oracle-primary bash -c "
            export ORACLE_SID=ORCL
            export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
            export PATH=\$PATH:\$ORACLE_HOME/bin
            
            sqlplus -s / as sysdba << 'SQLEOF'
            SET PAGESIZE 100 LINESIZE 150
            COL DATABASE_ROLE FORMAT A20
            COL PROTECTION_MODE FORMAT A20
            SELECT DATABASE_ROLE, PROTECTION_MODE, PROTECTION_LEVEL FROM V\$DATABASE;
            
            COL DEST_NAME FORMAT A30
            COL STATUS FORMAT A20
            SELECT DEST_NAME, STATUS FROM V\$ARCHIVE_DEST_STATUS WHERE DEST_ID <= 2;
            SQLEOF
        " 2>/dev/null || echo "Error obteniendo información de Data Guard"
        echo "</pre>"
        echo "</div>"
        
        echo "<div class='section'>"
        echo "<h2>Espacio en Disco</h2>"
        echo "<pre>"
        df -h . 2>/dev/null || echo "Error obteniendo información de disco"
        echo "</pre>"
        echo "</div>"
        
        echo "<div class='section'>"
        echo "<h2>Logs Recientes</h2>"
        echo "<pre>"
        tail -20 "$MAINTENANCE_LOG" 2>/dev/null || echo "No hay logs de mantenimiento disponibles"
        echo "</pre>"
        echo "</div>"
        
    } >> "$report_file"
    
    echo "</body></html>" >> "$report_file"
    
    log "Reporte de mantenimiento generado: $report_file"
}

# Función principal de mantenimiento completo
full_maintenance() {
    local archive_retention=${1:-7}
    local log_retention=${2:-30}
    
    log "=== INICIANDO MANTENIMIENTO COMPLETO ==="
    log "Archive log retention: $archive_retention días"
    log "System log retention: $log_retention días"
    
    # Crear snapshot antes del mantenimiento
    ./auto_snapshot.sh "maintenance" echo "Mantenimiento iniciado" 2>/dev/null || log "WARNING: No se pudo crear snapshot automático"
    
    # Ejecutar tareas de mantenimiento
    cleanup_archive_logs "$archive_retention"
    cleanup_system_logs "$log_retention"
    check_and_repair_dataguard
    update_statistics
    rebuild_indexes
    integrity_check
    backup_configuration
    performance_tuning
    generate_maintenance_report
    
    log "=== MANTENIMIENTO COMPLETO FINALIZADO ==="
}

# Crear directorio de logs si no existe
mkdir -p "$(dirname "$MAINTENANCE_LOG")"
mkdir -p ./shared/{reports,backups}

# Manejar argumentos
case "$1" in
    "full")
        full_maintenance "$2" "$3"
        ;;
    "cleanup-archives")
        cleanup_archive_logs "$2"
        ;;
    "cleanup-logs")
        cleanup_system_logs "$2"
        ;;
    "update-stats")
        update_statistics
        ;;
    "rebuild-indexes")
        rebuild_indexes
        ;;
    "check-dataguard")
        check_and_repair_dataguard
        ;;
    "backup-config")
        backup_configuration
        ;;
    "performance")
        performance_tuning
        ;;
    "integrity")
        integrity_check
        ;;
    "report")
        generate_maintenance_report
        ;;
    *)
        echo "Uso: $0 {full|cleanup-archives|cleanup-logs|update-stats|rebuild-indexes|check-dataguard|backup-config|performance|integrity|report} [parámetros]"
        echo ""
        echo "Comandos:"
        echo "  full [archive_days] [log_days]    - Mantenimiento completo (default: 7, 30)"
        echo "  cleanup-archives [días]           - Limpiar archive logs (default: 7)"
        echo "  cleanup-logs [días]               - Limpiar logs sistema (default: 30)"
        echo "  update-stats                      - Actualizar estadísticas"
        echo "  rebuild-indexes                   - Reconstruir índices fragmentados"
        echo "  check-dataguard                   - Verificar y reparar Data Guard"
        echo "  backup-config                     - Backup configuración"
        echo "  performance                       - Optimización rendimiento"
        echo "  integrity                         - Verificación integridad"
        echo "  report                           - Generar reporte mantenimiento"
        echo ""
        echo "Ejemplos:"
        echo "  $0 full                          # Mantenimiento completo con defaults"
        echo "  $0 full 3 15                     # Archives 3 días, logs 15 días"
        echo "  $0 cleanup-archives 5            # Limpiar archives > 5 días"
        echo "  $0 check-dataguard               # Solo verificar Data Guard"
        exit 1
        ;;
esac
```

### 10.2 Script de Instalación y Configuración Completa

Crear script final `install_complete.sh`:

```bash
#!/bin/bash

# Script de instalación completa de Oracle 19c con Data Guard en Docker

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_NAME="oracle-dataguard-docker"

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función de logging con colores
log() {
    local level="$1"
    shift
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case "$level" in
        "INFO")
            echo -e "${GREEN}[$timestamp] INFO:${NC} $*"
            ;;
        "WARN")
            echo -e "${YELLOW}[$timestamp] WARN:${NC} $*"
            ;;
        "ERROR")
            echo -e "${RED}[$timestamp] ERROR:${NC} $*"
            ;;
        "DEBUG")
            echo -e "${BLUE}[$timestamp] DEBUG:${NC} $*"
            ;;
        *)
            echo "[$timestamp] $level: $*"
            ;;
    esac
}

# Verificar prerrequisitos
check_prerequisites() {
    log "INFO" "Verificando prerrequisitos del sistema..."
    
    # Verificar SO
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        log "ERROR" "Este script está diseñado para Linux. SO detectado: $OSTYPE"
        exit 1
    fi
    
    # Verificar Docker
    if ! command -v docker &> /dev/null; then
        log "ERROR" "Docker no está instalado"
        exit 1
    fi
    
    # Verificar Docker Compose
    if ! command -v docker-compose &> /dev/null; then
        log "ERROR" "Docker Compose no está instalado"
        exit 1
    fi
    
    # Verificar permisos Docker
    if ! docker info &> /dev/null; then
        log "ERROR" "No tiene permisos para usar Docker. Ejecute: sudo usermod -aG docker \$USER"
        exit 1
    fi
    
    # Verificar recursos del sistema
    local total_memory=$(free -g | awk 'NR==2{print $2}')
    if [ "$total_memory" -lt 8 ]; then
        log "WARN" "Se recomienda al menos 8GB de RAM. RAM detectada: ${total_memory}GB"
    fi
    
    local available_space=$(df . | tail -1 | awk '{print int($4/1024/1024)}')
    if [ "$available_space" -lt 50 ]; then
        log "ERROR" "Se requieren al menos 50GB de espacio libre. Disponible: ${available_space}GB"
        exit 1
    fi
    
    log "INFO" "Prerrequisitos verificados ✓"
}

# Crear estructura de proyecto
create_project_structure() {
    log "INFO" "Creando estructura del proyecto..."
    
    # Crear directorios principales
    mkdir -p {primary,standby}/{data,scripts,logs,backup}
    mkdir -p shared/{exports,snapshots,logs,reports,backups}
    mkdir -p scripts/{maintenance,monitoring,deployment}
    
    log "INFO" "Estructura del proyecto creada ✓"
}

# Crear todos los scripts necesarios
create_scripts() {
    log "INFO" "Creando scripts de gestión..."
    
    # Hacer ejecutables todos los scripts existentes
    chmod +x *.sh 2>/dev/null || true
    
    # Crear script de inicio rápido
    cat > "quick_start.sh" << 'EOF'
#!/bin/bash
# Script de inicio rápido

echo "=== ORACLE 19C DATA GUARD - INICIO RÁPIDO ==="
echo ""
echo "1. Desplegando sistema completo..."
./deploy_oracle.sh

echo ""
echo "2. Esperando 60 segundos para estabilización..."
sleep 60

echo ""
echo "3. Verificando Data Guard..."
./verify_dataguard.sh

echo ""
echo "4. Creando snapshot inicial..."
./snapshot_manager.sh create "initial_quickstart_$(date +%Y%m%d_%H%M%S)"

echo ""
echo "5. Configurando monitoreo..."
nohup ./health_check.sh monitor 300 > ./shared/logs/monitoring.log 2>&1 &
echo "Monitoreo iniciado en background (PID: $!)"

echo ""
echo "=== DESPLIEGUE COMPLETO ✓ ==="
echo ""
echo "Información de conexión:"
echo "Primary:  sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba"
echo "Standby:  sqlplus sys/Oracle123@localhost:1522/ORCL as sysdba"
echo ""
echo "Web Interfaces:"
echo "Primary EM:  https://localhost:5500/em"
echo "Standby EM:  https://localhost:5501/em"
echo ""
echo "Comandos útiles:"
echo "./health_check.sh run              - Verificar salud del sistema"
echo "./export_data.sh list              - Ver exports disponibles"
echo "./snapshot_manager.sh list         - Ver snapshots disponibles"
echo "./maintenance.sh full              - Ejecutar mantenimiento"
EOF
    
    chmod +x quick_start.sh
    
    # Crear script de parada limpia
    cat > "shutdown.sh" << 'EOF'
#!/bin/bash
# Script de parada limpia

echo "=== PARANDO SISTEMA ORACLE DATA GUARD ==="

echo "1. Deteniendo monitoreo..."
pkill -f "health_check.sh monitor" 2>/dev/null || true

echo "2. Creando snapshot final..."
./snapshot_manager.sh create "shutdown_$(date +%Y%m%d_%H%M%S)" 2>/dev/null || true

echo "3. Parando containers Oracle..."
docker-compose down

echo "4. Limpiando recursos Docker..."
docker system prune -f

echo "=== SISTEMA PARADO ✓ ==="
EOF
    
    chmod +x shutdown.sh
    
    # Crear script de limpieza completa
    cat > "cleanup.sh" << 'EOF'
#!/bin/bash
# Script de limpieza completa

echo "=== LIMPIEZA COMPLETA DEL SISTEMA ==="
echo "ADVERTENCIA: Esto eliminará TODOS los datos y snapshots"
echo "¿Está seguro? (escriba 'YES' para confirmar):"
read confirmation

if [ "$confirmation" != "YES" ]; then
    echo "Operación cancelada"
    exit 1
fi

echo "1. Parando containers..."
docker-compose down -v

echo "2. Eliminando imágenes Oracle..."
docker rmi $(docker images | grep oracle | awk '{print $3}') 2>/dev/null || true

echo "3. Eliminando volúmenes..."
docker volume prune -f

echo "4. Eliminando datos..."
rm -rf primary/data/* standby/data/* 2>/dev/null || true
rm -rf shared/exports/* shared/snapshots/* 2>/dev/null || true
rm -rf shared/logs/* shared/reports/* shared/backups/* 2>/dev/null || true

echo "5. Limpieza de Docker..."
docker system prune -a -f

echo "=== LIMPIEZA COMPLETA ✓ ==="
EOF
    
    chmod +x cleanup.sh
    
    log "INFO" "Scripts de gestión creados ✓"
}

# Crear archivo README
create_documentation() {
    log "INFO" "Creando documentación..."
    
    cat > "README.md" << 'EOF'
# Oracle 19c Data Guard en Docker

Este proyecto proporciona una configuración completa de Oracle 19c con Data Guard usando Docker.

## Inicio Rápido

```bash
# Instalación completa
./install_complete.sh

# Inicio rápido del sistema
./quick_start.sh

# Verificar estado
./health_check.sh run

# Parar sistema
./shutdown.sh
```

## Comandos Principales

### Gestión del Sistema
- `./deploy_oracle.sh` - Desplegar sistema completo
- `./health_check.sh run` - Verificar salud
- `./verify_dataguard.sh` - Verificar Data Guard
- `./maintenance.sh full` - Mantenimiento completo

### Snapshots
- `./snapshot_manager.sh create [nombre]` - Crear snapshot
- `./snapshot_manager.sh restore [nombre]` - Restaurar snapshot
- `./snapshot_manager.sh list` - Listar snapshots

### Exportación/Importación
- `./export_data.sh full` - Export completo
- `./export_data.sh schemas SCHEMA1,SCHEMA2` - Export esquemas
- `./import_data.sh full archivo.dmp` - Import completo

### Conexiones
- **Primary Database**: `sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba`
- **Standby Database**: `sqlplus sys/Oracle123@localhost:1522/ORCL as sysdba`
- **Enterprise Manager**: https://localhost:5500/em (Primary) / https://localhost:5501/em (Standby)

## Estructura del Proyecto

```
├── docker-compose.yml          # Configuración Docker Compose
├── primary/                    # Datos y configuración Primary
├── standby/                    # Datos y configuración Standby
├── shared/                     # Datos compartidos
│   ├── exports/               # Archivos de exportación
│   ├── snapshots/             # Snapshots del sistema
│   ├── logs/                  # Logs del sistema
│   └── backups/               # Backups de configuración
└── scripts/                   # Scripts de gestión
```

## Monitoreo

El sistema incluye monitoreo automático que verifica:
- Estado de containers
- Conectividad de bases de datos
- Sincronización de Data Guard
- Uso de recursos
- Integridad de datos

## Troubleshooting

### Problemas Comunes

1. **Container no inicia**
   ```bash
   docker logs oracle-primary
   # Verificar logs para errores específicos
   ```

2. **Data Guard no sincroniza**
   ```bash
   ./verify_dataguard.sh
   ./maintenance.sh check-dataguard
   ```

3. **Espacio insuficiente**
   ```bash
   ./maintenance.sh cleanup-archives 3
   ./maintenance.sh cleanup-logs 15
   ```

## Configuración Avanzada

### Variables de Entorno
- `ORACLE_PWD`: Contraseña de Oracle (default: Oracle123)
- `ORACLE_SID`: SID de la base de datos (default: ORCL)
- `ORACLE_PDB`: Nombre del PDB (default: ORCLPDB1)

### Puertos
- 1521: Primary Database
- 1522: Standby Database
- 5500: Primary Enterprise Manager
- 5501: Standby Enterprise Manager

## Mantenimiento

Se recomienda ejecutar mantenimiento regular:

```bash
# Mantenimiento completo semanal
./maintenance.sh full

# Limpieza de archive logs (ejecutar diario)
./maintenance.sh cleanup-archives 7

# Verificación de integridad (ejecutar semanal)
./maintenance.sh integrity
```

## Backup y Recuperación

### Snapshots
Los snapshots permiten restaurar el sistema a un estado anterior:

```bash
# Crear snapshot antes de cambios importantes
./snapshot_manager.sh create "before_changes"

# Restaurar si algo sale mal
./snapshot_manager.sh restore "before_changes"
```

### Exports
Para backup de datos:

```bash
# Export completo
./export_data.sh full

# Export de esquemas específicos
./export_data.sh schemas HR,SCOTT

# Verificar exports
./export_data.sh verify export_name
```
EOF

    log "INFO" "Documentación creada ✓"
}

# Configurar variables de entorno
setup_environment() {
    log "INFO" "Configurando variables de entorno..."
    
    # Crear archivo de configuración
    cat > ".env" << 'EOF'
# Configuración Oracle Data Guard

# Configuración de Base de Datos
ORACLE_SID=ORCL
ORACLE_PDB=ORCLPDB1
ORACLE_PWD=Oracle123
ORACLE_EDITION=enterprise
ORACLE_CHARACTERSET=AL32UTF8

# Configuración Data Guard
ENABLE_ARCHIVELOG=true
ENABLE_FORCE_LOGGING=true

# Configuración de Red
PRIMARY_PORT=1521
STANDBY_PORT=1522
PRIMARY_EM_PORT=5500
STANDBY_EM_PORT=5501

# Configuración de Recursos
MEMORY_LIMIT=4g
SHM_SIZE=1g

# Configuración de Mantenimiento
ARCHIVE_RETENTION_DAYS=7
LOG_RETENTION_DAYS=30
MAX_AUTO_SNAPSHOTS=10
EOF
    
    log "INFO" "Variables de entorno configuradas ✓"
}

# Configurar sistema operativo
configure_system() {
    log "INFO" "Configurando parámetros del sistema operativo..."
    
    # Configurar límites del kernel para Oracle
    if [ -w /etc/sysctl.conf ]; then
        grep -q "vm.max_map_count" /etc/sysctl.conf || echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
        sudo sysctl -p
    else
        log "WARN" "No se pueden configurar parámetros del kernel. Ejecutar como root: echo 'vm.max_map_count=262144' >> /etc/sysctl.conf && sysctl -p"
    fi
    
    # Configurar límites de archivos
    if [ -w /etc/security/limits.conf ]; then
        grep -q "oracle soft nofile" /etc/security/limits.conf || {
            echo "oracle soft nofile 65536" | sudo tee -a /etc/security/limits.conf
            echo "oracle hard nofile 65536" | sudo tee -a /etc/security/limits.conf
        }
    else
        log "WARN" "No se pueden configurar límites de archivos"
    fi
    
    log "INFO" "Configuración del sistema completada ✓"
}

# Crear servicios systemd (opcional)
create_systemd_services() {
    if [ -w /etc/systemd/system ] && [ "$EUID" -eq 0 ]; then
        log "INFO" "Creando servicios systemd..."
        
        cat > "/etc/systemd/system/oracle-dataguard.service" << EOF
[Unit]
Description=Oracle 19c Data Guard Docker
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$SCRIPT_DIR
ExecStart=/usr/local/bin/docker-compose up -d
ExecStop=/usr/local/bin/docker-compose down
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target
EOF
        
        systemctl daemon-reload
        systemctl enable oracle-dataguard.service
        
        log "INFO" "Servicio systemd creado. Usar: systemctl start oracle-dataguard"
    else
        log "WARN" "No se pudo crear servicio systemd (requiere privilegios root)"
    fi
}

# Descargar imagen Oracle si no existe
prepare_oracle_image() {
    log "INFO" "Verificando imagen Oracle..."
    
    if ! docker images | grep -q "container-registry.oracle.com/database/enterprise"; then
        log "INFO" "Imagen Oracle no encontrada. Iniciando descarga..."
        log "WARN" "Necesitará autenticarse en Oracle Container Registry"
        
        docker login container-registry.oracle.com
        docker pull container-registry.oracle.com/database/enterprise:19.3.0.0
        
        log "INFO" "Imagen Oracle descargada ✓"
    else
        log "INFO" "Imagen Oracle ya disponible ✓"
    fi
}

# Ejecutar tests iniciales
run_initial_tests() {
    log "INFO" "Ejecutando tests iniciales..."
    
    # Test de Docker Compose
    if docker-compose config > /dev/null 2>&1; then
        log "INFO" "Configuración Docker Compose válida ✓"
    else
        log "ERROR" "Configuración Docker Compose inválida"
        return 1
    fi
    
    # Test de permisos de archivos
    if [ -x "./deploy_oracle.sh" ] && [ -x "./health_check.sh" ]; then
        log "INFO" "Permisos de archivos correctos ✓"
    else
        log "ERROR" "Problemas con permisos de archivos"
        return 1
    fi
    
    # Test de espacio en disco
    local space_needed=53687091200  # 50GB en bytes
    local space_available=$(df "$SCRIPT_DIR" | tail -1 | awk '{print $4 * 1024}')
    
    if [ "$space_available" -gt "$space_needed" ]; then
        log "INFO" "Espacio en disco suficiente ✓"
    else
        log "WARN" "Espacio en disco limitado"
    fi
    
    log "INFO" "Tests iniciales completados ✓"
}

# Mostrar información final
show_final_info() {
    log "INFO" "=== INSTALACIÓN COMPLETADA ✓ ==="
    echo ""
    echo -e "${GREEN}Oracle 19c Data Guard en Docker instalado exitosamente${NC}"
    echo ""
    echo "Próximos pasos:"
    echo "1. Iniciar el sistema:     ${BLUE}./quick_start.sh${NC}"
    echo "2. Verificar estado:       ${BLUE}./health_check.sh run${NC}"
    echo "3. Acceder a Primary:      ${BLUE}sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba${NC}"
    echo "4. Acceder a Standby:      ${BLUE}sqlplus sys/Oracle123@localhost:1522/ORCL as sysdba${NC}"
    echo ""
    echo "Interfaces web:"
    echo "- Primary EM:  https://localhost:5500/em"
    echo "- Standby EM:  https://localhost:5501/em"
    echo ""
    echo "Comandos útiles:"
    echo "- ${BLUE}./deploy_oracle.sh${NC}         # Desplegar sistema"
    echo "- ${BLUE}./snapshot_manager.sh list${NC} # Gestionar snapshots"
    echo "- ${BLUE}./export_data.sh list${NC}      # Gestionar exports"
    echo "- ${BLUE}./maintenance.sh full${NC}      # Mantenimiento completo"
    echo "- ${BLUE}./shutdown.sh${NC}              # Parar sistema"
    echo ""
    echo "Documentación: ${BLUE}README.md${NC}"
    echo ""
    echo -e "${YELLOW}¡Listo para usar!${NC}"
}

# Función principal
main() {
    log "INFO" "Iniciando instalación completa de Oracle 19c Data Guard en Docker"
    log "INFO" "Directorio de instalación: $SCRIPT_DIR"
    
    check_prerequisites
    create_project_structure
    setup_environment
    configure_system
    create_scripts
    create_documentation
    prepare_oracle_image
    run_initial_tests
    create_systemd_services
    
    show_final_info
}

# Función de limpieza en caso de error
cleanup_on_error() {
    log "ERROR" "Error durante la instalación. Limpiando..."
    docker-compose down 2>/dev/null || true
    log "ERROR" "Instalación cancelada"
    exit 1
}

# Configurar trap para limpieza en caso de error
trap cleanup_on_error ERR INT TERM

# Verificar si ya existe una instalación
if [ -f "docker-compose.yml" ] && [ -f ".env" ]; then
    echo -e "${YELLOW}Se detectó una instalación existente.${NC}"
    echo "¿Desea reinstalar? Esto sobrescribirá la configuración actual (y/N):"
    read -r reinstall
    
    if [[ ! $reinstall =~ ^[Yy]$ ]]; then
        log "INFO" "Instalación cancelada por el usuario"
        exit 0
    fi
    
    log "INFO" "Reinstalando..."
fi

# Ejecutar instalación
main "$@"

---

## Instrucciones Específicas para Windows

### Pasos de Configuración Manual

#### 1. Crear Estructura de Carpetas
**Opción A: PowerShell**
```powershell
# Ejecutar en PowerShell como Administrador
cd C:\Users\$env:USERNAME\Documents
mkdir oracle-docker-project
cd oracle-docker-project

# Crear estructura completa
$folders = @(
    "primary\data", "primary\scripts", "primary\logs", "primary\backup",
    "standby\data", "standby\scripts", "standby\logs", "standby\backup",
    "shared\exports", "shared\snapshots", "shared\logs", "shared\reports", "shared\backups"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force
    Write-Host "Creada carpeta: $folder" -ForegroundColor Green
}
```

**Opción B: Explorador de Windows**
1. Navegue a `C:\Users\[SuUsuario]\Documents`
2. Cree la carpeta `oracle-docker-project`
3. Dentro de esta carpeta, cree manualmente todas las subcarpetas mostradas en la estructura del proyecto

#### 2. Scripts de Automatización para Windows

**Script Principal de Despliegue**: `deploy_oracle.bat`
```batch
@echo off
echo === DESPLEGANDO ORACLE 19C CON DATA GUARD ===

echo Paso 1: Verificando prerrequisitos...
docker --version > nul 2>&1
if errorlevel 1 (
    echo ERROR: Docker no está instalado o no está en PATH
    pause
    exit /b 1
)

echo Paso 2: Iniciando Primary Database...
docker-compose up -d oracle-primary

echo Esperando que Primary Database esté listo...
:wait_primary
timeout 30 > nul
docker logs oracle-primary 2>&1 | findstr "DATABASE IS READY TO USE" > nul
if errorlevel 1 goto wait_primary

echo Paso 3: Configurando Primary...
call primary\scripts\02_configure_primary.bat

echo Paso 4: Configurando Standby...
call create_standby_files.bat
call setup_standby.bat

echo Paso 5: Activando Data Guard...
call activate_dataguard.bat

echo Paso 6: Verificando configuración...
call verify_dataguard.bat

echo === DESPLIEGUE COMPLETADO ===
echo Primary: sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba
echo Standby: sqlplus sys/Oracle123@localhost:1522/ORCL as sysdba
pause
```

### Comandos de PowerShell Útiles

```powershell
# Verificar estado de containers
docker ps --filter name=oracle-

# Ver logs en tiempo real
docker logs -f oracle-primary

# Conectar a SQL*Plus en Primary
docker exec -it oracle-primary sqlplus sys/Oracle123@ORCL as sysdba

# Conectar a SQL*Plus en Standby
docker exec -it oracle-standby sqlplus sys/Oracle123@ORCL as sysdba

# Verificar espacio en disco
Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, @{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB,2)}}, @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace/1GB,2)}}
```

### Secuencia de Despliegue Completo en Windows

#### Paso 1: Preparación
```powershell
# 1. Verificar Docker Desktop está corriendo
docker --version

# 2. Crear estructura de directorios
cd C:\Users\$env:USERNAME\Documents\oracle-docker-project

# 3. Crear red Docker
docker network create --driver bridge --subnet=172.20.0.0/16 oracle-net
```

#### Paso 2: Despliegue
```batch
# Ejecutar script principal
deploy_oracle.bat
```

#### Paso 3: Verificación
```batch
# Verificar Data Guard
verify_dataguard.bat

# Crear snapshot inicial
snapshot_manager.bat create initial_deployment
```

### Conexiones y Acceso

#### SQL*Plus Connections
```powershell
# Primary Database
docker exec -it oracle-primary sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba

# Standby Database  
docker exec -it oracle-standby sqlplus sys/Oracle123@localhost:1521/ORCL as sysdba
```

#### Enterprise Manager
- **Primary**: https://localhost:5500/em
- **Standby**: https://localhost:5501/em
  - Usuario: sys
  - Contraseña: Oracle123
  - Rol: sysdba

### Mantenimiento y Operaciones

#### Backup y Snapshots
```batch
# Crear snapshot antes de cambios importantes
snapshot_manager.bat create "antes_cambios"

# Listar snapshots disponibles
snapshot_manager.bat list

# Restaurar snapshot si es necesario
snapshot_manager.bat restore nombre_snapshot
```

#### Parada Normal
```powershell
# Parar containers manteniendo datos
docker-compose down
```

### Lista de Archivos que Debe Crear Manualmente

1. **docker-compose.yml** (raíz del proyecto)
2. **primary\scripts\01_init_primary.sql**
3. **primary\scripts\02_configure_primary.bat**
4. **primary\scripts\listener.ora**
5. **primary\scripts\tnsnames.ora**
6. **standby\scripts\01_init_standby.sql**
7. **standby\scripts\init_stby.ora**
8. **standby\scripts\listener.ora**
9. **standby\scripts\tnsnames.ora**
10. **create_standby_files.bat**
11. **setup_standby.bat**
12. **activate_dataguard.bat**
13. **verify_dataguard.bat**
14. **snapshot_manager.bat**
15. **deploy_oracle.bat**

**¡La configuración está completa y adaptada para Windows! Todos los scripts mantienen la funcionalidad completa de la standby database.**