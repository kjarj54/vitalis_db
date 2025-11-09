CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_INDICES AS
  v_alerta    BOOLEAN := FALSE;
  v_html      CLOB;
  v_error     VARCHAR2(4000);
  v_detalles  CLOB := '';
  v_count     NUMBER := 0;
BEGIN
  FOR rec IN (
    SELECT index_name, table_name, status, tablespace_name
    FROM sys.dba_indexes
    WHERE owner = 'VITALIS_SCHEMA'
      AND status IN ('UNUSABLE', 'INVALID')
    ORDER BY index_name
  ) LOOP
    v_alerta := TRUE;
    v_count := v_count + 1;
    v_detalles := v_detalles || 
      '<tr style="background-color: #fdecea;">' ||
      '<td style="padding: 8px; border: 1px solid #ddd;"><strong>' || rec.index_name || '</strong></td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd;">' || rec.table_name || '</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: center;"><span style="color: #c0392b; font-weight: bold;">' || 
        rec.status || '</span></td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd;">' || rec.tablespace_name || '</td>' ||
      '</tr>';
  END LOOP;
  
  IF v_alerta THEN
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje, jol_registros_afectados)
    VALUES
      ('JOB_VERIFICAR_INDICES', SYSDATE, 'F', 'Índices dañados detectados', v_count);
    
    v_html := '<html><body style="font-family: Arial, sans-serif;">' ||
              '<h2 style="color: #c0392b;">Alerta: Índices Dañados</h2>' ||
              '<p>Se detectaron <strong style="color: #c0392b; font-size: 18px;">' || v_count || 
              '</strong> índice(s) con problemas:</p>' ||
              '<table style="border-collapse: collapse; width: 100%; margin: 20px 0;">' ||
              '<thead><tr style="background-color: #c0392b; color: white;">' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Índice</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Tabla</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Estado</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Tablespace</th>' ||
              '</tr></thead>' ||
              '<tbody>' || v_detalles || '</tbody>' ||
              '</table>' ||
              '<hr style="border: 1px solid #ecf0f1;">' ||
              '<p><strong>Fecha:</strong> ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') || '</p>' ||
              '<p style="color: #c0392b;"><strong>Acción requerida:</strong> Reconstruir los índices dañados.</p>' ||
              '<p style="color: #7f8c8d; font-size: 12px;">Sistema Vitalis - Monitoreo Automático</p>' ||
              '</body></html>';
    
    PKG_BREVO_MAIL.send_mail(
      p_to        => 'james.rivera.nunez@gmail.com',
      p_subject   => 'Vitalis - ALERTA: Índices Dañados (' || v_count || ')',
      p_body_html => v_html
    );
  ELSE
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_INDICES', SYSDATE, 'E', 'Todos los índices en buen estado');
  END IF;
  
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    v_error := SUBSTR(SQLERRM, 1, 4000);
    ROLLBACK;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_INDICES', SYSDATE, 'F', v_error);
    COMMIT;
    RAISE;
END SP_JOB_VERIFICAR_INDICES;
/