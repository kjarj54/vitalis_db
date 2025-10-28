# Guía de Switch Over - Oracle Data Guard Vitalis

## 🚨 Switch Over en Caso de Falla del Primary

Esta guía proporciona los pasos exactos para realizar un **Switch Over** cuando el servidor primary falla y necesitas que el standby tome el control como nuevo primary.

---

## 📋 Prerrequisitos

### ✅ Verificaciones Previas
Antes de iniciar el Switch Over, verifica:

1. **Ambos contenedores están ejecutándose**:
   ```powershell
   docker-compose ps
   ```

2. **Conectividad de red entre contenedores**:
   ```powershell
   docker exec -it vitalis-primary ping vitalis-standby
   docker exec -it vitalis-standby ping vitalis-primary
   ```

---

## 🔄 Proceso de Switch Over

### Paso 1: Verificar Estado Actual

#### En el Primary (si está disponible):
```bash
docker exec -it vitalis-primary sqlplus sys/VITALIS-VITALISSB-1@VITALIS as sysdba
```

```sql
-- Verificar estado actual
SELECT name, database_role, open_mode, switchover_status FROM v$database;

-- Debe mostrar:
-- NAME      DATABASE_ROLE   OPEN_MODE    SWITCHOVER_STATUS
-- VITALIS   PRIMARY         READ WRITE   TO STANDBY
```

#### En el Standby:
```bash
docker exec -it vitalis-standby sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba
```

```sql
-- Verificar estado del standby
SELECT name, database_role, open_mode, switchover_status FROM v$database;

-- Debe mostrar:
-- NAME       DATABASE_ROLE      OPEN_MODE     SWITCHOVER_STATUS
-- VITALISSB  PHYSICAL STANDBY   MOUNTED       NOT ALLOWED o TO PRIMARY
```

### Paso 2: Switch Over - Escenario Normal (Primary Disponible)

#### 2.1 Preparar Primary para Switch Over
```sql
-- En el Primary
ALTER DATABASE COMMIT TO SWITCHOVER TO STANDBY WITH SESSION SHUTDOWN;
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
```

#### 2.2 Convertir Standby a Primary
```sql
-- En el Standby (nuevo Primary)
ALTER DATABASE COMMIT TO SWITCHOVER TO PRIMARY WITH SESSION SHUTDOWN;
SHUTDOWN IMMEDIATE;
STARTUP;
```

#### 2.3 Convertir Primary anterior a Standby
```sql
-- En el Primary anterior (ahora Standby)
ALTER DATABASE COMMIT TO SWITCHOVER TO STANDBY WITH SESSION SHUTDOWN;
SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
```

### Paso 3: Switch Over - Escenario de Emergencia (Primary No Disponible)

Cuando el primary está completamente caído:

#### 3.1 Activar Standby como Primary (Failover)
```sql
-- En el Standby
ALTER DATABASE ACTIVATE STANDBY DATABASE;
SHUTDOWN IMMEDIATE;
STARTUP;
```

**⚠️ IMPORTANTE**: Después de un `ACTIVATE`, el primary anterior NO puede convertirse automáticamente en standby. Requiere recreación completa.

---

## 🔧 Configuración Post-Switch Over

### Paso 4: Actualizar Configuración de Red

#### 4.1 Actualizar tnsnames.ora en el Nuevo Primary (ex-Standby)

```bash
docker exec -it vitalis-standby bash
```

```bash
cat <<EOF > $ORACLE_HOME/network/admin/tnsnames.ora
VITALISSB=localhost:1521/VITALISSB
VITALISBPDB1=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISBPDB1)
  )
)

VITALISSB=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISSB)
  )
)

VITALIS=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALIS)
  )
)

VITALISPDB1=
(DESCRIPTION =
  (ADDRESS = (PROTOCOL = TCP)(HOST = vitalis-primary)(PORT = 1521))
  (CONNECT_DATA =
    (SERVER = DEDICATED)
    (SERVICE_NAME = VITALISPDB1)
  )
)
EOF
```

#### 4.2 Actualizar listener.ora en el Nuevo Primary

```bash
cat <<EOF > $ORACLE_HOME/network/admin/listener.ora
LISTENER = 
(DESCRIPTION_LIST = 
  (DESCRIPTION = 
    (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1)) 
    (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521)) 
  ) 
) 

SID_LIST_LISTENER = 
   (SID_LIST = 
      (SID_DESC = (GLOBAL_DBNAME = VITALISSB) 
                  (ORACLE_HOME = $ORACLE_HOME) 
                  (SID_NAME = VITALISSB) 
       ) 
    )

DEDICATED_THROUGH_BROKER_LISTENER=ON
DIAG_ADR_ENABLED = off
EOF
```

#### 4.3 Reiniciar Listener

```bash
lsnrctl stop
lsnrctl start
```

### Paso 5: Configurar Parámetros de Data Guard en Nuevo Primary

```sql
sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba

-- Configurar como nuevo primary
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=USE_DB_RECOVERY_FILE_DEST VALID_FOR=(ALL_LOGFILES,ALL_ROLES) DB_UNIQUE_NAME=VITALISSB MANDATORY REOPEN=60' SCOPE=BOTH;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_2='SERVICE=VITALIS ASYNC VALID_FOR=(ONLINE_LOGFILES, PRIMARY_ROLE) DB_UNIQUE_NAME=VITALIS DELAY=10' SCOPE=BOTH;
ALTER SYSTEM SET FAL_SERVER=VITALIS;
ALTER SYSTEM SET FAL_CLIENT=VITALISSB;

-- Habilitar destinos
ALTER SYSTEM SET log_archive_dest_state_1=ENABLE SCOPE=BOTH;
ALTER SYSTEM SET log_archive_dest_state_2=ENABLE SCOPE=BOTH;
```

---

## 🧪 Verificación Post-Switch Over

### Paso 6: Pruebas de Funcionamiento

#### 6.1 Verificar Nuevo Primary (ex-Standby)

```sql
-- Conectar al nuevo primary
sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba

-- Verificar rol
SELECT name, database_role, open_mode FROM v$database;
-- Debe mostrar: VITALISSB | PRIMARY | READ WRITE

-- Crear tabla de prueba
CREATE TABLE test_switchover (
    id NUMBER,
    fecha DATE DEFAULT SYSDATE,
    mensaje VARCHAR2(100)
);

INSERT INTO test_switchover VALUES (1, SYSDATE, 'Switch Over realizado exitosamente');
COMMIT;

-- Verificar que se están enviando logs
SELECT dest_name, status, destination FROM v$archive_dest WHERE dest_name = 'LOG_ARCHIVE_DEST_2';
```

#### 6.2 Conectar a la PDB del Nuevo Primary

```sql
-- Conectar a la PDB
SHOW PDBS;
ALTER SESSION SET CONTAINER=VITALISBPDB1;

-- Crear tabla en PDB
CREATE TABLE pdb_test (
    id NUMBER,
    switch_date DATE DEFAULT SYSDATE
);

INSERT INTO pdb_test VALUES (1, SYSDATE);
COMMIT;
```

#### 6.3 Verificar Conectividad Externa

Desde tu máquina local o DBeaver:

- **Host**: localhost
- **Puerto**: 1522 (puerto del ex-standby, ahora primary)
- **SID**: VITALISSB
- **Usuario**: sys as sysdba
- **Contraseña**: VITALIS-VITALISSB-1

Para PDB:
- **Service Name**: VITALISBPDB1
- **Puerto**: 1522

---

## 🔄 Recrear Standby (Post-Failover)

Si hiciste un `ACTIVATE` (failover), necesitas recrear el standby:

### Paso 7: Recrear Configuración Standby

#### 7.1 Preparar Primary anterior

```bash
docker exec -it vitalis-primary bash

# Limpiar datos anteriores
rm -rf /opt/oracle/oradata/VITALIS/*
```

#### 7.2 Ejecutar RMAN Duplicate

```sql
-- En el nuevo Primary (ex-standby)
sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba

-- Crear pfile para nuevo standby
CREATE PFILE='/tmp/initVITALIS.ora' FROM SPFILE;
```

#### 7.3 Configurar nuevo Standby

```bash
# Copiar pfile al contenedor primary
docker exec -it vitalis-primary sqlplus sys/VITALIS-VITALISSB-1 as sysdba

CREATE SPFILE FROM PFILE='/tmp/initVITALIS.ora';
STARTUP NOMOUNT;
```

#### 7.4 Duplicate desde nuevo Primary

```bash
rman TARGET sys/VITALIS-VITALISSB-1@VITALISSB AUXILIARY sys/VITALIS-VITALISSB-1@VITALIS

DUPLICATE TARGET DATABASE FOR STANDBY FROM ACTIVE DATABASE
DORECOVER
NOFILENAMECHECK;
```

---

## 📱 Conexiones DBeaver Post-Switch Over

### Configuración DBeaver para Nuevo Primary

**Conexión 1: Base de datos principal (CDB)**
- **Driver**: Oracle
- **Server Host**: localhost
- **Port**: 1522
- **Database**: VITALISSB
- **Username**: sys as sysdba
- **Password**: VITALIS-VITALISSB-1

**Conexión 2: PDB**
- **Driver**: Oracle
- **Server Host**: localhost  
- **Port**: 1522
- **Service name**: VITALISBPDB1
- **Username**: sys as sysdba
- **Password**: VITALIS-VITALISSB-1

### Test de Conectividad DBeaver

```sql
-- Prueba básica
SELECT 
    name as database_name,
    database_role,
    open_mode,
    switchover_status
FROM v$database;

-- Verificar PDBs disponibles
SELECT name, open_mode FROM v$pdbs;

-- Crear usuario de prueba en PDB
ALTER SESSION SET CONTAINER=VITALISBPDB1;

CREATE USER test_user IDENTIFIED BY test123;
GRANT CONNECT, RESOURCE TO test_user;

-- Conectar con usuario test_user
-- Host: localhost, Port: 1522, Service: VITALISBPDB1
-- User: test_user, Password: test123
```

---

## 🚨 Comandos de Emergencia

### Reseteo Completo (Última opción)

Si algo sale mal y necesitas empezar desde cero:

```bash
# Detener contenedores
docker-compose down -v

# Eliminar volúmenes (CUIDADO: Elimina todos los datos)
docker volume prune -f

# Levantar nuevamente
docker-compose up -d

# Ejecutar configuración inicial
# 1. Primero standby: docker exec -it vitalis-standby bash -> ./scripts/initialize_vitalis.sh
# 2. Luego primary: docker exec -it vitalis-primary bash -> ./scripts/initialize_vitalis.sh
```

### Verificación Rápida de Estado

```sql
-- Script de verificación rápida
SELECT 
    'DATABASE: ' || name || ' | ROLE: ' || database_role || ' | MODE: ' || open_mode as status
FROM v$database
UNION ALL
SELECT 
    'ARCHIVE DEST 2: ' || status || ' | ERROR: ' || NVL(error, 'NONE')
FROM v$archive_dest WHERE dest_id = 2;
```

---

## ✅ Checklist Final

- [ ] Nuevo primary responde en puerto correcto
- [ ] PDB está abierta y accesible
- [ ] DBeaver puede conectarse
- [ ] Tablas de prueba creadas correctamente
- [ ] Archive logs se están generando
- [ ] Listener responde correctamente
- [ ] No hay errores en alert.log

**🎯 Con esta guía deberías poder realizar un switch over exitoso y mantener la operatividad del sistema Vitalis con el mínimo tiempo de inactividad.**