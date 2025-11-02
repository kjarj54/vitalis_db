#!/bin/bash

echo "=== INICIANDO SWITCHOVER: STANDBY -> PRIMARY ==="
echo "Este proceso convertirá la base de datos standby en primaria"
echo

# Verificar estado actual
echo "1. Verificando estado actual de la base de datos standby..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
SET PAGESIZE 0
SELECT 'Estado actual: ' || DATABASE_ROLE FROM V\$DATABASE;
SELECT 'Modo de acceso: ' || OPEN_MODE FROM V\$DATABASE;
EXIT;
EOF

echo
echo "2. Deteniendo la aplicación de logs en standby..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;
EXIT;
EOF

echo "3. Finalizando la aplicación de todos los logs pendientes..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE FINISH;
EXIT;
EOF

echo "4. Activando la base de datos standby como primaria..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
ALTER DATABASE ACTIVATE STANDBY DATABASE;
EXIT;
EOF

echo "5. Abriendo la base de datos en modo READ WRITE..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
ALTER DATABASE OPEN;
EXIT;
EOF

echo "6. Abriendo la PDB..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
ALTER PLUGGABLE DATABASE $ORACLE_MAIN_PDB OPEN;
EXIT;
EOF

echo "7. Verificando el estado final..."
sqlplus -s sys/$ORACLE_PWD as sysdba <<EOF
SET PAGESIZE 0
SELECT 'Nuevo estado: ' || DATABASE_ROLE FROM V\$DATABASE;
SELECT 'Modo de acceso: ' || OPEN_MODE FROM V\$DATABASE;
SELECT 'PDB Estado: ' || NAME || ' - ' || OPEN_MODE FROM V\$PDBS WHERE NAME = '$ORACLE_MAIN_PDB';
EXIT;
EOF

echo
echo "=== SWITCHOVER COMPLETADO ==="
echo "La base de datos standby ahora es la nueva primaria"
echo "Puedes conectarte usando:"
echo "  - CDB: sqlplus sys/$ORACLE_PWD@localhost:1521/$ORACLE_SID as sysdba"
echo "  - PDB: sqlplus sys/$ORACLE_PWD@localhost:1521/$ORACLE_MAIN_PDB as sysdba"
echo
