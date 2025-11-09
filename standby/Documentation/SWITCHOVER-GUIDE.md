# Guía Manual: Convertir Standby en Primaria

## Introducción

Esta guía explica paso a paso cómo **activar una base de datos standby** para que funcione como base de datos primaria independiente. Este proceso te permite acceder completamente a todos los datos respaldados.

## ¿Qué vamos a hacer?

Vamos a **activar** la base de datos standby para que funcione como primaria:
- La base de datos **standby** se convierte en **primaria funcional**
- Tendrás acceso completo de lectura y escritura
- Podrás verificar que todos tus datos están respaldados correctamente
- **NO HAY PÉRDIDA DE DATOS** porque aplicamos todos los cambios antes de activar

## Prerrequisitos

1. ✅ Ambos contenedores (primary y standby) deben estar ejecutándose
2. ✅ La replicación Data Guard debe estar funcionando correctamente
3. ✅ No debe haber gaps en la aplicación de archive logs
4. ✅ Ambas bases de datos deben estar sincronizadas

## Proceso Manual Paso a Paso

### Paso 1: Verificar el Estado Inicial

**1.1. Conectar al contenedor standby:**
```bash
docker exec -it vitalis-standby /bin/bash
```

**1.2. Verificar el estado de la base de datos standby:**
```bash
sqlplus sys/VITALISSB as sysdba
```

```sql
-- Verificar que estamos en una standby
SELECT database_role, open_mode FROM v$database;
-- Resultado esperado: DATABASE_ROLE = 'PHYSICAL STANDBY', OPEN_MODE = 'MOUNTED'

-- Verificar que no hay gaps en la sincronización
SELECT * FROM v$archive_gap;
-- Resultado esperado: No rows selected (sin gaps)

-- Verificar el último log aplicado
SELECT sequence#, applied FROM v$archived_log WHERE applied = 'YES' ORDER BY sequence# DESC;

EXIT;
```

### Paso 2: Preparar la Standby para el Switchover

**2.1. Detener la aplicación automática de logs:**
```bash
sqlplus sys/VITALISSB as sysdba
```

```sql
-- Cancelar la aplicación automática de archive logs
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
-- Esto detiene el proceso automático de aplicación de logs
```

**¿Qué hace este comando?**
- Detiene el proceso `MRP` (Managed Recovery Process)
- La standby deja de aplicar automáticamente los archive logs que recibe
- Prepara la base de datos para el switchover

### Paso 3: Aplicar Todos los Logs Pendientes

**3.1. Forzar la aplicación de todos los logs disponibles:**
```sql
-- Aplicar todos los archive logs disponibles hasta el final
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE FINISH;
-- Este proceso puede tardar unos minutos dependiendo de la cantidad de logs
```

**¿Qué hace este comando?**
- Aplica TODOS los archive logs disponibles en la standby
- Asegura que la standby tenga exactamente los mismos datos que la primaria
- Una vez completado, la standby está lista para ser activada como primaria

**3.2. Verificar que la aplicación se completó:**
```sql
-- Verificar el estado después de FINISH
SELECT sequence#, applied FROM v$archived_log WHERE applied = 'YES' ORDER BY sequence# DESC;
-- Debe mostrar que se aplicaron todos los logs disponibles
```

### Paso 4: Activar la Standby como Nueva Primaria

**4.1. Activar la base de datos standby:**
```sql
-- COMANDO CRÍTICO: Convierte la standby en primaria
ALTER DATABASE ACTIVATE STANDBY DATABASE;
```

**⚠️ ¡IMPORTANTE!**
- Este comando es **IRREVERSIBLE**
- Una vez ejecutado, la antigua primaria NO PUEDE volver a ser primaria sin reconstrucción completa
- La base de datos cambia permanentemente de rol de STANDBY a PRIMARY

**¿Qué hace este comando?**
- Cambia el DATABASE_ROLE de 'PHYSICAL STANDBY' a 'PRIMARY'
- Reinicia la numeración de los SCN (System Change Numbers)
- Activa todos los procesos necesarios para funcionar como primaria
- Permite que la base de datos acepte transacciones de escritura

### Paso 5: Abrir la Nueva Base de Datos Primaria

**5.1. Abrir la base de datos para operaciones completas:**
```sql
-- Abrir la base de datos en modo READ WRITE
ALTER DATABASE OPEN;
```

**¿Qué hace este comando?**
- Cambia el OPEN_MODE de 'MOUNTED' a 'READ WRITE'
- Permite conexiones de usuarios
- Habilita operaciones de lectura y escritura
- Inicia todos los procesos de background necesarios

**5.2. Abrir la PDB (Pluggable Database):**
```sql
-- Abrir la PDB donde están los datos del usuario
ALTER PLUGGABLE DATABASE VITALISPDB1 OPEN;
```

### 5.3 Ejecutar el script de fix listener
```bash
cd /home/oracle/scripts
./fix_listener.sh
```


**¿Qué hace este comando?**
- Abre la PDB que contiene los datos del sistema Vitalis
- Permite acceso a las tablas y datos del usuario
- Habilita conexiones directas a la PDB

### Paso 6: Verificación Final

**6.1. Verificar el nuevo estado:**
```sql
-- Verificar que ahora somos PRIMARY
SELECT database_role, open_mode FROM v$database;
-- Resultado esperado: DATABASE_ROLE = 'PRIMARY', OPEN_MODE = 'READ WRITE'

-- Verificar estado de la PDB
SELECT name, open_mode FROM v$pdbs WHERE name = 'VITALISBPDB1';
-- Resultado esperado: OPEN_MODE = 'READ WRITE'

-- Verificar que podemos hacer operaciones de escritura
CREATE TABLE test_switchover (id NUMBER, fecha DATE DEFAULT SYSDATE);
INSERT INTO test_switchover (id) VALUES (1);
COMMIT;

-- Verificar la tabla creada
SELECT * FROM test_switchover;

-- Limpiar la tabla de prueba
DROP TABLE test_switchover;

EXIT;
```

## Verificación de Acceso a los Datos

### Desde dentro del contenedor:

**Conectar a la CDB:**
```bash
sqlplus sys/VITALISSB@localhost:1521/VITALISSB as sysdba
```

**Conectar a la PDB:**
```bash
sqlplus sys/VITALISSB@localhost:1521/VITALISBPDB1 as sysdba
```

### Desde fuera del contenedor (tu máquina local):

**Conectar a la CDB:**
```bash
sqlplus sys/VITALISSB@localhost:1522/VITALISSB as sysdba
```

**Conectar a la PDB:**
```bash
sqlplus sys/VITALISSB@localhost:1522/VITALISBPDB1 as sysdba
```

## Comandos Útiles para Verificar Datos

```sql
-- Ver esquemas/usuarios en la PDB
SELECT username FROM all_users ORDER BY username;

-- Ver tablas del usuario VITALIS (ajustar según tu esquema)
SELECT table_name FROM all_tables WHERE owner = 'VITALIS';

-- Ver datos de ejemplo de una tabla específica
SELECT * FROM VITALIS.TU_TABLA WHERE ROWNUM <= 10;

-- Verificar tablespaces
SELECT tablespace_name, status FROM dba_tablespaces;

-- Verificar datafiles
SELECT file_name, tablespace_name, status FROM dba_data_files;
```

## Qué Sucede Después

Después de la activación:

1. **Tu standby ahora es una primaria completamente funcional**
   - Acceso completo de lectura y escritura
   - Todos los datos están disponibles
   - Puedes verificar que el respaldo funcionó correctamente

2. **La antigua primaria sigue funcionando independientemente**
   - No se ve afectada por este proceso
   - Cada una funciona por separado

3. **Uso recomendado**:
   - Usa la nueva primaria para verificar tus datos
   - Confirma que todo se respaldó correctamente
   - Realiza las pruebas que necesites

## Resumen del Proceso

| Paso | Comando | Propósito |
|------|---------|-----------|
| 1 | `ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL` | Detiene aplicación automática de logs |
| 2 | `ALTER DATABASE RECOVER MANAGED STANDBY DATABASE FINISH` | Aplica todos los logs pendientes |
| 3 | `ALTER DATABASE ACTIVATE STANDBY DATABASE` | **Activa la standby como primaria** |
| 4 | `ALTER DATABASE OPEN` | Abre la base de datos para operaciones |
| 5 | `ALTER PLUGGABLE DATABASE VITALISBPDB1 OPEN` | Abre la PDB con tus datos |

## Estados de la Base de Datos

| Estado | DATABASE_ROLE | OPEN_MODE | Descripción |
|--------|---------------|-----------|-------------|
| Inicial | PHYSICAL STANDBY | MOUNTED | Standby lista para recibir logs |
| Post-FINISH | PHYSICAL STANDBY | MOUNTED | Todos los logs aplicados |
| Post-ACTIVATE | PRIMARY | MOUNTED | Ahora es primaria pero cerrada |
| Final | PRIMARY | READ WRITE | Primaria completamente funcional |

---

**🎯 Resultado Final**: Tendrás tu base de datos standby funcionando como primaria independiente, con acceso completo a todos los datos respaldados del sistema Vitalis para verificar que todo se respaldó correctamente.
