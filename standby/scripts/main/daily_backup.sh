#!/bin/bash
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export ORACLE_SID=VITALIS
export ORACLE_STANDBY_SID=VITALISSB
SOURCE_FOLDER="/opt/oracle/oradata/VITALIS/recovery_files/VITALIS"
DEST_FOLDER="/opt/oracle/oradata/VITALISSB/recovery_files"

# Realizar el respaldo con RMAN
$ORACLE_HOME/bin/rman target sys/VITALIS-VITALISSB-1@VITALIS <<EOF
BACKUP DATABASE PLUS ARCHIVELOG;
EOF

# Transferir los archivos generados a la standby usando SCP
scp -r "${SOURCE_FOLDER}" oracle@vitalis-standby:"${DEST_FOLDER}"