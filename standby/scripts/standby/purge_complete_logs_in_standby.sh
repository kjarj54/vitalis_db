#!/bin/bash
export ORACLE_HOME=/opt/oracle/product/19c/dbhome_1
export ORACLE_SID=VITALIS
export ORACLE_STANDBY_SID=VITALISSB

# Script que se ejecuta en el primary para limpiar logs en standby via SSH
ssh oracle@vitalis-standby "/home/oracle/scripts/delete_obsolete_vitalis.sh"