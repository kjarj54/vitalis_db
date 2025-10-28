# Configuraciones de Conexión DBeaver - Post Switch Over

## 📋 Configuraciones para DBeaver después del Switch Over

### 🔄 ANTES del Switch Over (Configuración Original)

#### Conexión Primary Original:
- **Nombre**: Vitalis Primary (Original)
- **Driver**: Oracle
- **Host**: localhost
- **Port**: 1521
- **Database/SID**: VITALIS
- **Username**: sys as sysdba  
- **Password**: VITALIS-VITALISSB-1

#### Conexión Standby Original:
- **Nombre**: Vitalis Standby (Original)
- **Driver**: Oracle  
- **Host**: localhost
- **Port**: 1522
- **Database/SID**: VITALISSB
- **Username**: sys as sysdba
- **Password**: VITALIS-VITALISSB-1

---

### 🔄 DESPUÉS del Switch Over (Nueva Configuración)

#### Conexión Nuevo Primary (ex-Standby):
- **Nombre**: Vitalis NEW Primary (Post Switch Over)
- **Driver**: Oracle
- **Host**: localhost
- **Port**: 1522  ⚠️ **CAMBIÓ AL PUERTO DEL EX-STANDBY**
- **Database/SID**: VITALISSB
- **Username**: sys as sysdba
- **Password**: VITALIS-VITALISSB-1

#### Conexión PDB Principal:
- **Nombre**: Vitalis PDB (Post Switch Over)
- **Driver**: Oracle
- **Host**: localhost  
- **Port**: 1522  ⚠️ **CAMBIÓ AL PUERTO DEL EX-STANDBY**
- **Connection Type**: Service Name
- **Service Name**: VITALISBPDB1
- **Username**: sys as sysdba
- **Password**: VITALIS-VITALISSB-1

---

## 🔧 Configuración Manual en DBeaver

### Paso 1: Crear Nueva Conexión Post-Switch Over

1. **Abrir DBeaver**
2. **Clic derecho** en el panel de conexiones → **Nueva Conexión**
3. **Seleccionar**: Oracle
4. **Llenar datos**:
   ```
   Host: localhost
   Port: 1522
   Database: VITALISSB
   Username: sys as sysdba
   Password: VITALIS-VITALISSB-1
   ```
5. **Test Connection** para verificar
6. **Finish**

### Paso 2: Crear Conexión para PDB

1. **Nueva Conexión** → Oracle
2. **En la pestaña "Main"**:
   ```
   Host: localhost  
   Port: 1522
   Connection Type: Service name
   Service name: VITALISBPDB1
   Username: sys as sysdba
   Password: VITALIS-VITALISSB-1
   ```
3. **Test Connection**
4. **Finish**

---

## 🧪 Queries de Verificación en DBeaver

### Query 1: Verificar Estado de la Base de Datos
```sql
SELECT 
    name AS database_name,
    database_role,
    open_mode,
    switchover_status,
    CASE 
        WHEN database_role = 'PRIMARY' THEN '✅ ACTIVO COMO PRIMARY'
        WHEN database_role = 'PHYSICAL STANDBY' THEN '⏳ STANDBY'  
        ELSE '❓ ESTADO DESCONOCIDO'
    END AS status_description
FROM v$database;
```

### Query 2: Verificar PDBs Disponibles
```sql
SELECT 
    name,
    open_mode,
    CASE 
        WHEN open_mode = 'READ WRITE' THEN '✅ DISPONIBLE'
        WHEN open_mode = 'READ ONLY' THEN '📖 SOLO LECTURA'
        ELSE '❌ NO DISPONIBLE'
    END AS availability
FROM v$pdbs 
WHERE name != 'PDB$SEED'
ORDER BY name;
```

### Query 3: Crear Usuario de Prueba en PDB
```sql
-- Cambiar a PDB
ALTER SESSION SET CONTAINER=VITALISBPDB1;

-- Crear usuario de aplicación
CREATE USER app_vitalis IDENTIFIED BY VitalisApp2025;
GRANT CONNECT, RESOURCE TO app_vitalis;
GRANT CREATE SESSION TO app_vitalis;

-- Crear tabla de prueba
CREATE TABLE app_vitalis.test_post_switchover (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    evento VARCHAR2(100),
    fecha_evento DATE DEFAULT SYSDATE
);

-- Insertar datos de prueba  
INSERT INTO app_vitalis.test_post_switchover (evento) VALUES ('Switch Over ejecutado correctamente');
INSERT INTO app_vitalis.test_post_switchover (evento) VALUES ('DBeaver conectado exitosamente');
INSERT INTO app_vitalis.test_post_switchover (evento) VALUES ('Sistema operativo post-failover');
COMMIT;

-- Verificar datos
SELECT * FROM app_vitalis.test_post_switchover ORDER BY id;
```

### Query 4: Verificar Archive Logs
```sql
-- Volver a CDB  
ALTER SESSION SET CONTAINER=CDB$ROOT;

SELECT 
    dest_name,
    status,
    SUBSTR(destination, 1, 50) AS destination,
    CASE 
        WHEN status = 'VALID' THEN '✅ OK'
        WHEN status = 'ERROR' THEN '❌ ERROR' 
        ELSE '⚠️ ' || status
    END AS status_icon
FROM v$archive_dest 
WHERE dest_name IN ('LOG_ARCHIVE_DEST_1', 'LOG_ARCHIVE_DEST_2')
ORDER BY dest_name;
```

---

## 🔄 Configuración Automática para DBeaver

### Script SQL para Configuración Rápida
```sql
-- Ejecutar en la conexión CDB post-switch over

-- Crear usuario dedicado para DBeaver  
CREATE USER dbeaver_admin IDENTIFIED BY DBeaver2025;
GRANT DBA TO dbeaver_admin;
GRANT CREATE SESSION TO dbeaver_admin;

-- En PDB también
ALTER SESSION SET CONTAINER=VITALISBPDB1;
CREATE USER dbeaver_pdb IDENTIFIED BY DBeaver2025;
GRANT DBA TO dbeaver_pdb;
GRANT CREATE SESSION TO dbeaver_pdb;

-- Volver a CDB
ALTER SESSION SET CONTAINER=CDB$ROOT;
```

### Nueva Conexión con Usuario Dedicado:
- **Host**: localhost
- **Port**: 1522
- **SID**: VITALISSB
- **Username**: dbeaver_admin
- **Password**: DBeaver2025

---

## ⚠️ Troubleshooting DBeaver

### Error: "Listener refused the connection"
**Solución**: Verificar que el puerto sea 1522 (no 1521)

### Error: "Invalid username/password"  
**Solución**: 
1. Verificar que la contraseña sea: `VITALIS-VITALISSB-1`
2. Asegurarse de usar `sys as sysdba` como username

### Error: "Service name not found"
**Solución**: Para PDB, usar `VITALISBPDB1` como service name

### Error: "Cannot connect to database"
**Solución**: 
```bash
# Verificar que el contenedor esté corriendo
docker ps | grep vitalis-standby

# Verificar que el listener esté activo
docker exec -it vitalis-standby lsnrctl status
```

---

## 📝 Resumen de Puertos Post-Switch Over

| Servicio | Puerto Original | Puerto Post-Switch Over | Observaciones |
|----------|----------------|-------------------------|---------------|
| Primary Original | 1521 | N/A (puede estar caído) | |  
| Nuevo Primary (ex-Standby) | 1522 | 1522 | **USAR ESTE PUERTO** |
| PDB Principal | 1522 | 1522 | Service: VITALISBPDB1 |

**🎯 Clave**: Después del switch over, **TODAS las conexiones deben usar el puerto 1522**, que corresponde al contenedor que era standby y ahora es primary.