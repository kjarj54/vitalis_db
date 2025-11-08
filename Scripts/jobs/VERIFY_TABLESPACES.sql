BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'VITALIS_SCHEMA.JOB_VERIFICAR_TABLESPACES',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'VITALIS_SCHEMA.SP_JOB_VERIFICAR_TABLESPACES',
    start_date      => TRUNC(SYSDATE) + 6/24,
    repeat_interval => 'FREQ=DAILY; BYHOUR=6; BYMINUTE=0; BYSECOND=0',
    enabled         => TRUE,
    comments        => 'Verifica tablespaces con uso >85% - Ejecuta diariamente'
  );
  DBMS_OUTPUT.PUT_LINE('✅ Job JOB_VERIFICAR_TABLESPACES creado (DIARIO)');
END;
/