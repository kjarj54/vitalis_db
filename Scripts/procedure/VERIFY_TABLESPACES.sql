CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_TABLESPACES AS
  v_alerta    BOOLEAN := FALSE;
  v_html      CLOB;
  v_error     VARCHAR2(4000);
  v_detalles  CLOB := '';
  v_count     NUMBER := 0;
BEGIN
  -- Verificar tablespaces con uso > 85%
  FOR rec IN (
    SELECT 
      df.tablespace_name,
      ROUND((df.bytes - NVL(fs.bytes, 0)) / df.bytes * 100, 2) AS uso_porcentaje,
      ROUND(df.bytes / 1024 / 1024, 2) AS total_mb,
      ROUND((df.bytes - NVL(fs.bytes, 0)) / 1024 / 1024, 2) AS usado_mb,
      ROUND(NVL(fs.bytes, 0) / 1024 / 1024, 2) AS libre_mb
    FROM 
      (SELECT tablespace_name, SUM(bytes) bytes 
       FROM sys.dba_data_files 
       WHERE tablespace_name IN ('VITALIS_DATA', 'VITALIS_IDX', 'VITALIS_DEMO')
       GROUP BY tablespace_name) df
    LEFT JOIN 
      (SELECT tablespace_name, SUM(bytes) bytes 
       FROM sys.dba_free_space 
       WHERE tablespace_name IN ('VITALIS_DATA', 'VITALIS_IDX', 'VITALIS_DEMO')
       GROUP BY tablespace_name) fs
    ON df.tablespace_name = fs.tablespace_name
    WHERE ROUND((df.bytes - NVL(fs.bytes, 0)) / df.bytes * 100, 2) > 85
  ) LOOP
    v_alerta := TRUE;
    v_count := v_count + 1;
    v_detalles := v_detalles || 
      '<tr style="background-color: #fadbd8;">' ||
      '<td style="padding: 8px; border: 1px solid #ddd;"><strong>' || rec.tablespace_name || '</strong></td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: right;"><strong style="color: #c0392b; font-size: 16px;">' || 
        rec.uso_porcentaje || '%</strong></td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: right;">' || rec.total_mb || ' MB</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: right;">' || rec.usado_mb || ' MB</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: right;">' || rec.libre_mb || ' MB</td>' ||
      '</tr>';
  END LOOP;
  
  IF v_alerta THEN
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje, jol_registros_afectados)
    VALUES
      ('JOB_VERIFICAR_TABLESPACES', SYSDATE, 'F', 'Tablespaces con uso > 85% detectados', v_count);
    
    v_html := '<html><body style="font-family: Arial, sans-serif;">' ||
              '<h2 style="color: #e74c3c;">⚠️ Alerta: Tablespaces con Alto Uso</h2>' ||
              '<p>Se detectaron <strong style="color: #c0392b; font-size: 18px;">' || v_count || 
              '</strong> tablespace(s) con uso superior al 85%:</p>' ||
              '<table style="border-collapse: collapse; width: 100%; margin: 20px 0;">' ||
              '<thead><tr style="background-color: #34495e; color: white;">' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Tablespace</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Uso %</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Total</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Usado</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Libre</th>' ||
              '</tr></thead>' ||
              '<tbody>' || v_detalles || '</tbody>' ||
              '</table>' ||
              '<hr style="border: 1px solid #ecf0f1;">' ||
              '<p><strong>Fecha:</strong> ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') || '</p>' ||
              '<p style="color: #e74c3c;"><strong>⚡ Acción requerida:</strong> Extender los tablespaces o liberar espacio.</p>' ||
              '<p style="color: #7f8c8d; font-size: 12px;">Sistema Vitalis - Monitoreo Automático</p>' ||
              '</body></html>';
    
    PKG_BREVO_MAIL.send_mail(
      p_to        => 'james.rivera.nunez@gmail.com',
      p_subject   => 'Vitalis - ALERTA CRÍTICA: Tablespaces (' || v_count || ')',
      p_body_html => v_html
    );
  ELSE
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_TABLESPACES', SYSDATE, 'E', 'Todos los tablespaces dentro del límite');
  END IF;
  
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    v_error := SUBSTR(SQLERRM, 1, 4000);
    ROLLBACK;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_TABLESPACES', SYSDATE, 'F', v_error);
    COMMIT;
    RAISE;
END SP_JOB_VERIFICAR_TABLESPACES;
/