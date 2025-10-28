# 🔄 Switch Over Vitalis - Guía Rápida

## 🚨 Cuando el Primary falle, sigue estos pasos:

### ⚡ Paso 1: Ejecutar Switch Over Automático
```bash
# Conectar al contenedor standby
docker exec -it vitalis-standby bash

# Ejecutar script automático
cd /home/oracle/scripts
chmod +x switchover_to_primary.sh
./switchover_to_primary.sh
```

### ⚡ Paso 2: Verificar que funcionó
```bash
# En el mismo contenedor, ejecutar:
chmod +x ../test/check_status.sh
../test/check_status.sh
```

### ⚡ Paso 3: Conectar con DBeaver
- **Host**: localhost
- **Puerto**: **1522** (¡Importante! No 1521)
- **SID**: VITALISSB  
- **Usuario**: sys as sysdba
- **Contraseña**: VITALIS-VITALISSB-1

Para PDB:
- **Service Name**: VITALISBPDB1 (mismo puerto 1522)

### ⚡ Paso 4: Probar que funciona
```sql
-- En DBeaver, ejecutar:
SELECT name, database_role, open_mode FROM v$database;
-- Debe mostrar: VITALISSB | PRIMARY | READ WRITE

-- Para probar PDB:
ALTER SESSION SET CONTAINER=VITALISBPDB1;
CREATE TABLE test_ok (id NUMBER, mensaje VARCHAR2(50));
INSERT INTO test_ok VALUES (1, 'Switch Over OK');
COMMIT;
```

---

## 📁 Archivos Creados para Switch Over

| Archivo | Propósito | Ubicación |
|---------|-----------|-----------|
| `SWITCHOVER-GUIDE.md` | Guía completa detallada | `/standby/` |
| `switchover_to_primary.sh` | Script automático | `/scripts/standby/` |
| `check_status.sh` | Verificación rápida | `/scripts/test/` |
| `verify_switchover.sql` | Verificación SQL | `/scripts/test/` |
| `DBEAVER-CONFIG.md` | Configuración DBeaver | `/standby/` |

---

## ⚠️ IMPORTANTE - Configuración VS Code

**ANTES DE EJECUTAR**, verifica que TODOS los archivos .sh tengan terminación LF:

1. Abrir cada archivo .sh en VS Code
2. En la barra inferior derecha, verificar que diga "LF" 
3. Si dice "CRLF", hacer clic y cambiar a "LF"
4. Guardar el archivo

**Archivos a verificar**:
- `switchover_to_primary.sh`
- `check_status.sh`
- `initialize_vitalis.sh` (ambos)
- Todos los scripts en `/scripts/main/` y `/scripts/standby/`

---

## 🧪 Proceso de Testing Completo

### 1. Simular Falla del Primary
```bash
# Detener solo el primary para simular falla
docker stop vitalis-primary
```

### 2. Ejecutar Switch Over
```bash
docker exec -it vitalis-standby bash
cd /home/oracle/scripts
./switchover_to_primary.sh
```

### 3. Verificar Funcionamiento
```bash
# Verificar estado
../test/check_status.sh

# Conectar con sqlplus
sqlplus sys/VITALIS-VITALISSB-1@VITALISSB as sysdba
```

### 4. Prueba con DBeaver
- Crear nueva conexión con puerto 1522
- Probar conexión a CDB y PDB
- Crear tablas de prueba

### 5. Opcional: Restaurar Primary como Standby
```bash
# Levantar primary nuevamente
docker start vitalis-primary

# Reconfigurar como nuevo standby (requiere recreación completa)
```

---

## 📞 Comandos de Emergencia

### Reset Completo (Solo si todo falla)
```bash
docker-compose down -v
docker-compose up -d
# Luego ejecutar configuración inicial desde cero
```

### Verificación Manual de Estado
```sql
SELECT 
    'DB: ' || name || 
    ' | ROL: ' || database_role || 
    ' | MODO: ' || open_mode 
FROM v$database;
```

### Verificar Listener
```bash
docker exec -it vitalis-standby lsnrctl status
```

---

## ✅ Checklist Final

- [ ] Switch over ejecutado sin errores
- [ ] Estado muestra PRIMARY y READ WRITE  
- [ ] DBeaver conecta al puerto 1522
- [ ] PDB responde correctamente
- [ ] Tablas de prueba creadas exitosamente
- [ ] No hay errores en logs de Oracle

**🎯 Con esta guía simplificada, el switch over debería completarse en menos de 5 minutos.**