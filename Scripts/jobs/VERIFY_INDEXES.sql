BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'VITALIS_SCHEMA.JOB_VERIFICAR_INDICES',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'VITALIS_SCHEMA.SP_JOB_VERIFICAR_INDICES',
    start_date      => TRUNC(SYSDATE) + 8/24,
    repeat_interval => 'FREQ=DAILY; BYHOUR=8; BYMINUTE=0; BYSECOND=0',
    enabled         => TRUE,
    comments        => 'Verifica índices dañados o unusable - Ejecuta diariamente'
  );
  DBMS_OUTPUT.PUT_LINE('✅ Job JOB_VERIFICAR_INDICES creado (DIARIO)');
END;
/