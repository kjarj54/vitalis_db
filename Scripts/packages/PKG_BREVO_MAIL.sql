CREATE OR REPLACE PACKAGE PKG_BREVO_MAIL AS
  PROCEDURE send_mail(
    p_to        VARCHAR2,
    p_subject   VARCHAR2,
    p_body_html CLOB
  );
END PKG_BREVO_MAIL;
/


CREATE OR REPLACE PACKAGE BODY PKG_BREVO_MAIL AS

  -- === Función auxiliar: obtiene parámetros ===
  FUNCTION get_param(p_name VARCHAR2) RETURN VARCHAR2 IS
    v_value VARCHAR2(4000);
  BEGIN
    SELECT par_valor INTO v_value
    FROM VITALIS_SCHEMA.VITALIS_PARAMETROS
    WHERE UPPER(par_nombre) = UPPER(p_name)
      AND par_estado = 'A';
    RETURN v_value;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;

  -- === Función: desencripta clave SMTP ===
  FUNCTION decrypt_key(p_encrypted VARCHAR2) RETURN VARCHAR2 IS
    v_key_raw RAW(2000);
    v_decrypted VARCHAR2(4000);
  BEGIN
    v_key_raw := UTL_RAW.cast_to_raw('V1t@l1s_Smtp$2025');  -- misma clave usada para cifrar
    v_decrypted := UTL_RAW.cast_to_varchar2(
      DBMS_CRYPTO.decrypt(
        src => UTL_ENCODE.base64_decode(UTL_RAW.cast_to_raw(p_encrypted)),
        typ => DBMS_CRYPTO.DES_CBC_PKCS5,
        key => v_key_raw
      )
    );
    RETURN v_decrypted;
  END;

  -- === Procedimiento principal de envío ===
  PROCEDURE send_mail(
    p_to        VARCHAR2,
    p_subject   VARCHAR2,
    p_body_html CLOB
  ) IS
    l_host      VARCHAR2(200) := get_param('SMTP_HOST');
    l_port      PLS_INTEGER   := TO_NUMBER(get_param('SMTP_PORT'));
    l_user      VARCHAR2(320) := get_param('SMTP_USER');
    l_pass_enc  VARCHAR2(4000):= get_param('SMTP_PASS');
    l_pass      VARCHAR2(4000):= decrypt_key(l_pass_enc);
    l_from      VARCHAR2(320) := get_param('SMTP_FROM');

    l_conn  UTL_SMTP.connection;
    l_crlf  CONSTANT VARCHAR2(2) := UTL_TCP.CRLF;

    FUNCTION b64(p_txt VARCHAR2) RETURN VARCHAR2 IS
    BEGIN
      RETURN REPLACE(REPLACE(
        UTL_RAW.cast_to_varchar2(
          UTL_ENCODE.base64_encode(UTL_RAW.cast_to_raw(p_txt))
        ), CHR(13), ''), CHR(10), '');
    END;
  BEGIN
    -- 1️⃣ Conexión SMTP
    l_conn := UTL_SMTP.open_connection(l_host, l_port);
    UTL_SMTP.ehlo(l_conn, 'oracle.local');

    -- 2️⃣ Autenticación LOGIN
    UTL_SMTP.command(l_conn, 'AUTH LOGIN');
    UTL_SMTP.command(l_conn, b64(l_user));
    UTL_SMTP.command(l_conn, b64(l_pass));

    -- 3️⃣ Envelope
    UTL_SMTP.mail(l_conn, l_from);
    UTL_SMTP.rcpt(l_conn, p_to);

    -- 4️⃣ Cuerpo HTML
    UTL_SMTP.open_data(l_conn);
    UTL_SMTP.write_data(l_conn,
      'Subject: '||p_subject||l_crlf||
      'From: '||l_from||l_crlf||
      'To: '||p_to||l_crlf||
      'MIME-Version: 1.0'||l_crlf||
      'Content-Type: text/html; charset=UTF-8'||l_crlf||l_crlf||
      p_body_html
    );
    UTL_SMTP.close_data(l_conn);

    -- 5️⃣ Cierre
    UTL_SMTP.quit(l_conn);
    DBMS_OUTPUT.put_line('✅ Correo enviado correctamente a '||p_to);
  EXCEPTION
    WHEN OTHERS THEN
      BEGIN
        IF l_conn IS NOT NULL THEN
          UTL_SMTP.quit(l_conn);
        END IF;
      EXCEPTION WHEN OTHERS THEN NULL; END;
      DBMS_OUTPUT.put_line('❌ Error al enviar correo: '||SQLERRM);
      RAISE;
  END;
END PKG_BREVO_MAIL;
/
