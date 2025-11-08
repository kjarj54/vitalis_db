-- Tabla para registrar ejecuciones de jobs
CREATE TABLE VITALIS_SCHEMA.vitalis_jobs_logs(
  jol_id NUMBER NOT NULL,
  jol_job_nombre VARCHAR2(100) NOT NULL,
  jol_fecha_ejecucion DATE NOT NULL,
  jol_estado CHAR(1) NOT NULL,  -- E=Exitoso, F=Fallido
  jol_mensaje VARCHAR2(4000),
  jol_registros_afectados NUMBER DEFAULT 0,
  CONSTRAINT vitalis_jobs_logs_pk PRIMARY KEY (jol_id),
  CONSTRAINT vitalis_jobs_logs_ck01 CHECK (jol_estado IN ('E','F'))
)
TABLESPACE VITALIS_DATA;

-- Secuencia
CREATE SEQUENCE VITALIS_SCHEMA.vitalis_jobs_logs_seq01
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  MINVALUE 0
  NOCACHE;

-- Trigger
CREATE OR REPLACE TRIGGER VITALIS_SCHEMA.vitalis_jobs_logs_TGR01 
BEFORE INSERT ON VITALIS_SCHEMA.vitalis_jobs_logs 
FOR EACH ROW
BEGIN
  IF :new.jol_id IS NULL OR :new.jol_id <= 0 THEN
    :new.jol_id := VITALIS_SCHEMA.vitalis_jobs_logs_seq01.NEXTVAL;
  END IF;
END;

CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.sp_registrar_job_log (
  p_nombre_job IN VARCHAR2,
  p_estado IN CHAR,
  p_mensaje IN VARCHAR2,
  p_registros IN NUMBER DEFAULT 0
) AS
BEGIN
  INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs (
    jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje, jol_registros_afectados
  ) VALUES (
    p_nombre_job, SYSDATE, p_estado, p_mensaje, p_registros
  );
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
END;
/
