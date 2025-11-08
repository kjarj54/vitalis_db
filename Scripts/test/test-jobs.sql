BEGIN
  DBMS_OUTPUT.PUT_LINE('==============================================');
  DBMS_OUTPUT.PUT_LINE('INICIO DE EJECUCIÓN DE JOBS VITALIS');
  DBMS_OUTPUT.PUT_LINE('Hora de inicio: ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('==============================================');
  DBMS_OUTPUT.PUT_LINE(' ');

  DBMS_OUTPUT.PUT_LINE('Ejecutando SP_JOB_INACTIVAR_USUARIOS...');
  SP_JOB_INACTIVAR_USUARIOS;
  DBMS_OUTPUT.PUT_LINE('Completado: SP_JOB_INACTIVAR_USUARIOS');
  DBMS_OUTPUT.PUT_LINE(' ');

  DBMS_OUTPUT.PUT_LINE('Ejecutando SP_JOB_VERIFICAR_INDICES...');
  SP_JOB_VERIFICAR_INDICES;
  DBMS_OUTPUT.PUT_LINE('Completado: SP_JOB_VERIFICAR_INDICES');
  DBMS_OUTPUT.PUT_LINE(' ');

  DBMS_OUTPUT.PUT_LINE('Ejecutando SP_JOB_VERIFICAR_TABLESPACES...');
  SP_JOB_VERIFICAR_TABLESPACES;
  DBMS_OUTPUT.PUT_LINE('Completado: SP_JOB_VERIFICAR_TABLESPACES (DEBE ENVIAR CORREO DE ALERTA)');
  DBMS_OUTPUT.PUT_LINE(' ');

  DBMS_OUTPUT.PUT_LINE('Ejecutando SP_JOB_VERIFICAR_OBJETOS_INVALIDOS...');
  SP_JOB_VERIFICAR_OBJETOS_INVALIDOS;
  DBMS_OUTPUT.PUT_LINE('Completado: SP_JOB_VERIFICAR_OBJETOS_INVALIDOS (DEBE ENVIAR CORREO DE ALERTA)');
  DBMS_OUTPUT.PUT_LINE(' ');

  DBMS_OUTPUT.PUT_LINE('==============================================');
  DBMS_OUTPUT.PUT_LINE('FINALIZADO TODOS LOS JOBS');
  DBMS_OUTPUT.PUT_LINE('Hora de fin: ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS'));
  DBMS_OUTPUT.PUT_LINE('==============================================');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR durante la ejecución: ' || SQLERRM);
END;
/



-- Usar el log de los jobs para saber que ha ocurrido en el área de jobs 
SELECT jol_job_nombre, 
       TO_CHAR(jol_fecha_ejecucion, 'DD/MM/YYYY HH24:MI:SS') AS fecha,
       jol_estado, 
       jol_mensaje,
       NVL(jol_registros_afectados, 0) AS registros_afectados
FROM vitalis_jobs_logs
WHERE jol_fecha_ejecucion >= TRUNC(SYSDATE)
ORDER BY jol_fecha_ejecucion DESC
FETCH FIRST 5 ROWS ONLY;

