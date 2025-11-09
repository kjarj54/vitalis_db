CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.SP_JOB_INACTIVAR_USUARIOS AS
  v_afectados NUMBER := 0;
  v_html      CLOB;
  v_error     VARCHAR2(4000);
  v_detalles  CLOB := '';
BEGIN
  -- Inactivar usuarios sin actividad por más de 90 días
  FOR rec IN (
    SELECT usu_id, usu_login, usu_fecha_ultimo_acceso,
           TRUNC(SYSDATE) - TRUNC(usu_fecha_ultimo_acceso) AS dias_inactivo
    FROM VITALIS_SCHEMA.vitalis_usuarios
    WHERE usu_estado = 'A'
      AND usu_fecha_ultimo_acceso < TRUNC(SYSDATE) - 90
  ) LOOP
    v_afectados := v_afectados + 1;
    
    -- Actualizar estado
    UPDATE VITALIS_SCHEMA.vitalis_usuarios
       SET usu_estado = 'I'
     WHERE usu_id = rec.usu_id;
    
    -- Agregar detalle para email
    v_detalles := v_detalles || 
      '<tr>' ||
      '<td style="padding: 8px; border: 1px solid #ddd;">' || rec.usu_login || '</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: center;">' || 
        TO_CHAR(rec.usu_fecha_ultimo_acceso, 'DD/MM/YYYY') || '</td>' ||
      '<td style="padding: 8px; border: 1px solid #ddd; text-align: center;"><strong style="color: #c0392b;">' || 
        rec.dias_inactivo || ' días</strong></td>' ||
      '</tr>';
  END LOOP;

  -- Registrar log
  INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
    (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje, jol_registros_afectados)
  VALUES
    ('JOB_INACTIVAR_USUARIOS', SYSDATE, 'E', 'Usuarios inactivados correctamente', v_afectados);
  
  COMMIT;
  
  -- Notificar al DBA solo si hay usuarios inactivados
  IF v_afectados > 0 THEN
    BEGIN
      v_html := '<html><body style="font-family: Arial, sans-serif;">' ||
                '<h2 style="color: #e74c3c;">Usuarios Inactivados por Inactividad</h2>' ||
                '<p>Se han inactivado <strong style="color: #c0392b; font-size: 18px;">' || 
                v_afectados || '</strong> usuario(s) con más de 90 días de inactividad:</p>' ||
                '<table style="border-collapse: collapse; width: 100%; margin: 20px 0;">' ||
                '<thead><tr style="background-color: #34495e; color: white;">' ||
                '<th style="padding: 10px; border: 1px solid #ddd;">Usuario</th>' ||
                '<th style="padding: 10px; border: 1px solid #ddd;">Último Acceso</th>' ||
                '<th style="padding: 10px; border: 1px solid #ddd;">Días Inactivo</th>' ||
                '</tr></thead>' ||
                '<tbody>' || v_detalles || '</tbody>' ||
                '</table>' ||
                '<hr style="border: 1px solid #ecf0f1;">' ||
                '<p><strong>Fecha de ejecución:</strong> ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') || '</p>' ||
                '<p><strong>Job:</strong> JOB_INACTIVAR_USUARIOS</p>' ||
                '<p style="color: #7f8c8d; font-size: 12px;">Sistema Vitalis - Monitoreo Automático</p>' ||
                '</body></html>';
      
      PKG_BREVO_MAIL.send_mail(
        p_to        => 'james.rivera.nunez@gmail.com',
        p_subject   => 'Vitalis - Usuarios Inactivados: ' || v_afectados,
        p_body_html => v_html
      );
    EXCEPTION
      WHEN OTHERS THEN
        v_error := SUBSTR(SQLERRM, 1, 4000);
        INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
          (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
        VALUES
          ('JOB_INACTIVAR_USUARIOS', SYSDATE, 'E', 'Procesado OK pero error al enviar email: ' || v_error);
        COMMIT;
    END;
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    v_error := SUBSTR(SQLERRM, 1, 4000);
    ROLLBACK;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_jobs_logs
      (jol_job_nombre, jol_fecha_ejecucion, jol_estado, jol_mensaje)
    VALUES
      ('JOB_INACTIVAR_USUARIOS', SYSDATE, 'F', v_error);
    COMMIT;
    
    BEGIN
      v_html := '<html><body style="font-family: Arial, sans-serif;">' ||
                '<h2 style="color: #e74c3c;">Error en Job: Inactivar Usuarios</h2>' ||
                '<p><strong>Error:</strong> ' || v_error || '</p>' ||
                '<p><strong>Fecha:</strong> ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') || '</p>' ||
                '</body></html>';
      
      PKG_BREVO_MAIL.send_mail(
        p_to        => 'james.rivera.nunez@gmail.com',
        p_subject   => 'Vitalis - ERROR en Job Inactivar Usuarios',
        p_body_html => v_html
      );
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    
    RAISE;
END SP_JOB_INACTIVAR_USUARIOS;
/