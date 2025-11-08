CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.SP_JOB_VERIFICAR_OBJETOS_INVALIDOS AS
  v_alerta    BOOLEAN := FALSE;
  v_html      CLOB;
  v_error     VARCHAR2(4000);
  v_detalles  CLOB := '';
  v_count     NUMBER := 0;
BEGIN
  FOR rec IN (
    SELECT object_type, object_name, status
    FROM sys.dba_objects
    WHERE owner = 'VITALIS_SCHEMA'
      AND status = 'INVALID'
    ORDER BY object_type, object_name
  ) LOOP
    v_alerta := TRUE;
    v_count := v_count + 1;
    v_detalles := v_detalles || 
      '<tr>' ||
      '<td style="padding: 8px; border: 1px solid #ddd;">' || rec.object_type || '</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd;"><strong>' || rec.object_name || '</strong></td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: center; color: #e74c3c; font-weight: bold;">' || 
        rec.status || '</td>' ||
      '</tr>';
  END LOOP;
  
  IF v_alerta THEN
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje, jol_registros_afectados)
    VALUES
      ('JOB_VERIFICAR_OBJETOS_INVALIDOS', SYSDATE, 'F', 'Objetos inválidos detectados', v_count);
    
    v_html := '<html><body style="font-family: Arial, sans-serif;">' ||
              '<h2 style="color: #e67e22;">⚠️ Alerta: Objetos Inválidos</h2>' ||
              '<p>Se encontraron <strong style="color: #e67e22; font-size: 18px;">' || v_count || 
              '</strong> objeto(s) inválido(s) en VITALIS_SCHEMA:</p>' ||
              '<table style="border-collapse: collapse; width: 100%; margin: 20px 0;">' ||
              '<thead><tr style="background-color: #e67e22; color: white;">' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Tipo</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Nombre</th>' ||
              '<th style="padding: 10px; border: 1px solid #ddd;">Estado</th>' ||
              '</tr></thead>' ||
              '<tbody>' || v_detalles || '</tbody>' ||
              '</table>' ||
              '<hr style="border: 1px solid #ecf0f1;">' ||
              '<p><strong>Fecha:</strong> ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') || '</p>' ||
              '<p style="color: #e67e22;"><strong>⚡ Acción requerida:</strong> Recompilar los objetos inválidos.</p>' ||
              '<p style="color: #7f8c8d; font-size: 12px;">Sistema Vitalis - Monitoreo Automático</p>' ||
              '</body></html>';
    
    PKG_BREVO_MAIL.send_mail(
      p_to        => 'james.rivera.nunez@gmail.com',
      p_subject   => 'Vitalis - ALERTA: Objetos Inválidos (' || v_count || ')',
      p_body_html => v_html
    );
  ELSE
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_OBJETOS_INVALIDOS', SYSDATE, 'E', 'No se encontraron objetos inválidos');
  END IF;
  
  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    v_error := SUBSTR(SQLERRM, 1, 4000);
    ROLLBACK;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_VERIFICAR_OBJETOS_INVALIDOS', SYSDATE, 'F', v_error);
    COMMIT;
    RAISE;
END SP_JOB_VERIFICAR_OBJETOS_INVALIDOS;
/