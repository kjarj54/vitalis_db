DECLARE
  -- === Config SMTP (Brevo) ===
  l_host        VARCHAR2(200) := 'smtp-relay.brevo.com';
  l_port        PLS_INTEGER   := 587;
  l_user        VARCHAR2(320) := '9a109b001@smtp-brevo.com';      -- Usuario SMTP (Iniciar sesión)
  l_password    VARCHAR2(320) := RTRIM('xsmtpsib-458963d823867013303bece14f894246d70016df47718bf9ba664830244d22fe-zFBxPwfpS5zKBkXJ');    -- Clave SMTP (desde pestaña SMTP)

  -- === Remitente/destinatario de prueba ===
  l_from        VARCHAR2(320) := 'jamesriveranu@gmail.com';       -- remitente verificado en Brevo
  l_to          VARCHAR2(320) := 'james.rivera.nunez@gmail.com';  -- destinatario

  -- === Contenido ===
  l_subject     VARCHAR2(200) := 'Prueba Brevo: Hola desde Oracle';
  l_body_html   CLOB := '<h2>Hola</h2><p>Correo de prueba enviado <b>directamente desde Oracle</b> vía Brevo SMTP.</p>';

  -- === Internos ===
  l_conn        UTL_SMTP.connection;
  l_open        BOOLEAN := FALSE;
  l_crlf        CONSTANT VARCHAR2(2) := UTL_TCP.CRLF;

  -- Base64 UNA sola línea (sin CR/LF)
  FUNCTION b64_1line(p_txt VARCHAR2) RETURN VARCHAR2 IS
    s VARCHAR2(32767);
  BEGIN
    s := UTL_RAW.cast_to_varchar2(UTL_ENCODE.base64_encode(UTL_RAW.cast_to_raw(p_txt)));
    s := REPLACE(REPLACE(s, CHR(13), ''), CHR(10), '');  -- quita CR/LF
    RETURN s;
  END;
BEGIN
  -- 1) Conexión
  l_conn := UTL_SMTP.open_connection(l_host, l_port);
  l_open := TRUE;

  -- 2) EHLO (anuncia AUTH y extensiones)
  UTL_SMTP.ehlo(l_conn, 'oracle.local');  -- usa un alias local cualquiera

  -- 3) AUTH LOGIN (en 1 línea base64 cada uno, sin saltos)
  UTL_SMTP.command(l_conn, 'AUTH LOGIN');
  UTL_SMTP.command(l_conn, b64_1line(l_user));
  UTL_SMTP.command(l_conn, b64_1line(l_password));

  -- 4) Envelope
  UTL_SMTP.mail(l_conn, l_from);
  UTL_SMTP.rcpt(l_conn, l_to);

  -- 5) DATA
  UTL_SMTP.open_data(l_conn);
  UTL_SMTP.write_data(l_conn, 'Subject: ' || l_subject || l_crlf);
  UTL_SMTP.write_data(l_conn, 'From: '    || l_from    || l_crlf);
  UTL_SMTP.write_data(l_conn, 'To: '      || l_to      || l_crlf);
  UTL_SMTP.write_data(l_conn, 'MIME-Version: 1.0' || l_crlf);
  UTL_SMTP.write_data(l_conn, 'Content-Type: text/html; charset=UTF-8' || l_crlf || l_crlf);
  UTL_SMTP.write_data(l_conn, l_body_html);
  UTL_SMTP.close_data(l_conn);

  -- 6) Cierre
  UTL_SMTP.quit(l_conn);
  l_open := FALSE;

  DBMS_OUTPUT.put_line('OK: correo enviado.');
EXCEPTION
  WHEN OTHERS THEN
    BEGIN
      IF l_open THEN UTL_SMTP.quit(l_conn); END IF;
    EXCEPTION WHEN OTHERS THEN NULL; END;
    DBMS_OUTPUT.put_line('FALLO: '||SQLERRM);
    RAISE;
END;
/
