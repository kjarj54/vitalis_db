BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name        => 'VITALIS_SCHEMA.JOB_VERIFICAR_OBJETOS_INVALIDOS',
    job_type        => 'STORED_PROCEDURE',
    job_action      => 'VITALIS_SCHEMA.SP_JOB_VERIFICAR_OBJETOS_INVALIDOS',
    start_date      => TRUNC(SYSDATE) + 7/24,
    repeat_interval => 'FREQ=DAILY; BYHOUR=7; BYMINUTE=0; BYSECOND=0',
    enabled         => TRUE,
    comments        => 'Verifica objetos inválidos - Ejecuta diariamente'
  );
  DBMS_OUTPUT.PUT_LINE('✅ Job JOB_VERIFICAR_OBJETOS_INVALIDOS creado (DIARIO)');
END;
/