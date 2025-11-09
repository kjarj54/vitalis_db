BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'VITALIS_SCHEMA.JOB_INACTIVAR_USUARIOS',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'VITALIS_SCHEMA.SP_JOB_INACTIVAR_USUARIOS',
    start_date      => TRUNC(SYSDATE, 'MM') + 2/24,
    repeat_interval => 'FREQ=MONTHLY; BYMONTHDAY=1; BYHOUR=2; BYMINUTE=0; BYSECOND=0',
    enabled         => TRUE,
    comments        => 'Inactiva usuarios con más de 90 días sin acceso - Ejecuta mensualmente'
  );
  DBMS_OUTPUT.PUT_LINE('✅ Job JOB_INACTIVAR_USUARIOS creado (MENSUAL)');
END;
/