-- Crear secuencia para la tabla de logs de jobs
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.VITALIS_JOBS_LOGS_TGR01 
BEFORE INSERT ON VITALIS_SCHEMA.VITALIS_JOBS_LOGS 
FOR EACH ROW
BEGIN
  IF :new.jol_id IS NULL OR :new.jol_id <= 0 THEN
    :new.jol_id := VITALIS_SCHEMA.VITALIS_JOBS_LOGS_SEQ01.NEXTVAL;
  END IF;
END;
/
-- Compilar los procedimientos antes de la ejecución
ALTER PROCEDURE VITALIS_SCHEMA.SP_JOB_INACTIVAR_USUARIOS COMPILE;
ALTER PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_INDICES COMPILE;
ALTER PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_OBJETOS_INVALIDOS COMPILE;
ALTER PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_TABLESPACES COMPILE;
-- Verificar que todos estén VALID
SELECT object_name, object_type, status
FROM user_objects
WHERE object_name LIKE 'SP_JOB%'
   OR object_name = 'PKG_BREVO_MAIL'
ORDER BY object_type, object_name;

-----------------------------------------------------------------------------------------------------------------------
BEGIN
  DBMS_OUTPUT.PUT_LINE('==============================================');
  DBMS_OUTPUT.PUT_LINE('PRUEBA DE JOBS VITALIS');
  DBMS_OUTPUT.PUT_LINE('==============================================');
  
  DBMS_OUTPUT.PUT_LINE('1. Ejecutando SP_JOB_INACTIVAR_USUARIOS...');
  SP_JOB_INACTIVAR_USUARIOS;
  DBMS_OUTPUT.PUT_LINE('   ✅ Completado');
  
  DBMS_OUTPUT.PUT_LINE('2. Ejecutando SP_JOB_VERIFICAR_INDICES...');
  SP_JOB_VERIFICAR_INDICES;
  DBMS_OUTPUT.PUT_LINE('   ✅ Completado');
  
  DBMS_OUTPUT.PUT_LINE('3. Ejecutando SP_JOB_VERIFICAR_TABLESPACES...');
  SP_JOB_VERIFICAR_TABLESPACES;
  DBMS_OUTPUT.PUT_LINE('   ✅ Completado');
  
  DBMS_OUTPUT.PUT_LINE('4. Ejecutando SP_JOB_VERIFICAR_OBJETOS_INVALIDOS...');
  SP_JOB_VERIFICAR_OBJETOS_INVALIDOS;
  DBMS_OUTPUT.PUT_LINE('   ✅ Completado');
  
  DBMS_OUTPUT.PUT_LINE('==============================================');
  DBMS_OUTPUT.PUT_LINE('✅ TODOS LOS JOBS EJECUTADOS EXITOSAMENTE');
  DBMS_OUTPUT.PUT_LINE('==============================================');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('❌ ERROR: ' || SQLERRM);
END;
/

-- Ver resultados en la tabla de logs
SELECT jol_job_nombre, 
       TO_CHAR(jol_fecha_ejecucion, 'DD/MM/YYYY HH24:MI:SS') AS fecha,
       jol_estado, 
       jol_mensaje,
       NVL(jol_registros_afectados, 0) AS registros_afectados
FROM vitalis_jobs_logs
WHERE jol_fecha_ejecucion >= TRUNC(SYSDATE)
ORDER BY jol_fecha_ejecucion DESC;