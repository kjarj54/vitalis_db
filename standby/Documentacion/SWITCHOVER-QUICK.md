# Guía Rápida de Switchover - Standby a Primary

## Objetivo
Convertir la base de datos standby (VITALISSB) en la nueva base de datos primaria funcional para poder acceder y verificar que los datos se respaldaron correctamente.

## Pasos Simples

### 1. Conectar al contenedor standby
```bash
docker exec -it vitalis-standby /bin/bash
```

### 2. Ejecutar el script de switchover
```bash
cd /home/oracle/scripts
./switchover_to_primary.sh

./fix_listener.sh
```

**¡Eso es todo!** El script hace automáticamente todos los pasos necesarios.

### 3. Verificar que funciona

Después del switchover, puedes conectarte para verificar:

**Conectar a la CDB (Container Database):**
```bash
sqlplus sys/VITALISSB@localhost:1521/VITALISSB as sysdba
```

**Conectar a la PDB (donde están tus datos):**
```bash
sqlplus sys/VITALISSB@localhost:1521/VITALISBPDB1 as sysdba
```

### 4. Comandos útiles para verificar datos

Una vez conectado a la PDB, puedes verificar tus datos:

```sql
-- Ver todas las tablas del usuario VITALIS
SELECT table_name FROM all_tables WHERE owner = 'VITALIS';

-- Ver datos de ejemplo de una tabla
SELECT * FROM VITALIS.TU_TABLA WHERE ROWNUM <= 10;

-- Verificar estado de la base de datos
SELECT database_role, open_mode FROM v$database;
```

## Acceso desde fuera del contenedor

Desde tu máquina local, puedes conectarte usando el puerto **1522**:

```bash
# Para CDB
sqlplus sys/VITALISSB@localhost:1522/VITALISSB as sysdba

# Para PDB  
sqlplus sys/VITALISSB@localhost:1522/VITALISPDB1 as sysdba
```

## ¿Qué hace el script automáticamente?

1. ✅ Detiene la replicación desde el primary
2. ✅ Aplica todos los logs pendientes
3. ✅ Activa la standby como nueva primary
4. ✅ Abre la base de datos en modo lectura/escritura
5. ✅ Abre la PDB para acceso completo
6. ✅ Verifica que todo esté funcionando

## Resultado Final

Después del switchover tendrás:
- ✅ Base de datos completamente funcional en puerto **1522**
- ✅ Acceso completo de lectura y escritura
- ✅ PDB `VITALISPDB1` disponible con todos tus datos
- ✅ Todos los datos respaldados y accesibles

---
**Nota**: Una vez hecho el switchover, la antigua primary quedará desactualizada. Solo usa este procedimiento cuando quieras que la standby sea tu nueva base de datos principal.
