-- ========================================
-- Script de Configuración SMTP Brevo
-- Inserta/actualiza todos los parámetros
-- ========================================

DECLARE
  v_key_raw   RAW(2000) := UTL_RAW.cast_to_raw('V1t@l1s_Smtp$2025');
  v_pass_real VARCHAR2(4000) := 'xsmtpsib-458963d823867013303bece14f894246d70016df47718bf9ba664830244d22fe-zFBxPwfpS5zKBkXJ';
  v_encrypted VARCHAR2(4000);
BEGIN
  -- 1️⃣ Encriptar contraseña SMTP
  v_encrypted := UTL_RAW.cast_to_varchar2(
    UTL_ENCODE.base64_encode(
      DBMS_CRYPTO.encrypt(
        src => UTL_RAW.cast_to_raw(v_pass_real),
        typ => DBMS_CRYPTO.DES_CBC_PKCS5,
        key => v_key_raw
      )
    )
  );

  -- 2️⃣ Host SMTP
  MERGE INTO VITALIS_SCHEMA.VITALIS_PARAMETROS p
  USING (SELECT 'SMTP_HOST' AS nombre FROM dual) src
  ON (UPPER(p.par_nombre) = src.nombre)
  WHEN MATCHED THEN
    UPDATE SET par_valor = 'smtp-relay.brevo.com', 
               par_estado = 'A', 
               par_encriptado = 'N',
               par_descripcion = 'Servidor SMTP Brevo',
               par_tipo_dato = 'VARCHAR2',
               par_modulo = 'NOTIFICACIONES'
  WHEN NOT MATCHED THEN
    INSERT (par_id, par_codigo, par_nombre, par_valor, par_descripcion, par_tipo_dato, par_encriptado, par_modulo, par_estado)
    VALUES (VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1, 'SMTP_HOST', 'smtp-relay.brevo.com',
            'Servidor SMTP Brevo', 'VARCHAR2', 'N', 'NOTIFICACIONES', 'A');

  -- 3️⃣ Puerto SMTP
  MERGE INTO VITALIS_SCHEMA.VITALIS_PARAMETROS p
  USING (SELECT 'SMTP_PORT' AS nombre FROM dual) src
  ON (UPPER(p.par_nombre) = src.nombre)
  WHEN MATCHED THEN
    UPDATE SET par_valor = '587', 
               par_estado = 'A', 
               par_encriptado = 'N',
               par_descripcion = 'Puerto SMTP Brevo',
               par_tipo_dato = 'NUMBER',
               par_modulo = 'NOTIFICACIONES'
  WHEN NOT MATCHED THEN
    INSERT (par_id, par_codigo, par_nombre, par_valor, par_descripcion, par_tipo_dato, par_encriptado, par_modulo, par_estado)
    VALUES (VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1, 'SMTP_PORT', '587',
            'Puerto SMTP Brevo', 'NUMBER', 'N', 'NOTIFICACIONES', 'A');

  -- 4️⃣ Usuario SMTP
  MERGE INTO VITALIS_SCHEMA.VITALIS_PARAMETROS p
  USING (SELECT 'SMTP_USER' AS nombre FROM dual) src
  ON (UPPER(p.par_nombre) = src.nombre)
  WHEN MATCHED THEN
    UPDATE SET par_valor = '9a109b001@smtp-brevo.com', 
               par_estado = 'A', 
               par_encriptado = 'N',
               par_descripcion = 'Usuario SMTP Brevo',
               par_tipo_dato = 'VARCHAR2',
               par_modulo = 'NOTIFICACIONES'
  WHEN NOT MATCHED THEN
    INSERT (par_id, par_codigo, par_nombre, par_valor, par_descripcion, par_tipo_dato, par_encriptado, par_modulo, par_estado)
    VALUES (VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1, 'SMTP_USER', '9a109b001@smtp-brevo.com',
            'Usuario SMTP Brevo', 'VARCHAR2', 'N', 'NOTIFICACIONES', 'A');

  -- 5️⃣ Contraseña SMTP (encriptada)
  MERGE INTO VITALIS_SCHEMA.VITALIS_PARAMETROS p
  USING (SELECT 'SMTP_PASS' AS nombre FROM dual) src
  ON (UPPER(p.par_nombre) = src.nombre)
  WHEN MATCHED THEN
    UPDATE SET par_valor = v_encrypted, 
               par_encriptado = 'S', 
               par_estado = 'A',
               par_descripcion = 'Clave SMTP Brevo encriptada',
               par_tipo_dato = 'VARCHAR2',
               par_modulo = 'NOTIFICACIONES'
  WHEN NOT MATCHED THEN
    INSERT (par_id, par_codigo, par_nombre, par_valor, par_descripcion, par_tipo_dato, par_encriptado, par_modulo, par_estado)
    VALUES (VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1, 'SMTP_PASS', v_encrypted,
            'Clave SMTP Brevo encriptada', 'VARCHAR2', 'S', 'NOTIFICACIONES', 'A');

  -- 6️⃣ Remitente por defecto
  MERGE INTO VITALIS_SCHEMA.VITALIS_PARAMETROS p
  USING (SELECT 'SMTP_FROM' AS nombre FROM dual) src
  ON (UPPER(p.par_nombre) = src.nombre)
  WHEN MATCHED THEN
    UPDATE SET par_valor = 'jamesriveranu@gmail.com', 
               par_estado = 'A', 
               par_encriptado = 'N',
               par_descripcion = 'Remitente SMTP Brevo',
               par_tipo_dato = 'VARCHAR2',
               par_modulo = 'NOTIFICACIONES'
  WHEN NOT MATCHED THEN
    INSERT (par_id, par_codigo, par_nombre, par_valor, par_descripcion, par_tipo_dato, par_encriptado, par_modulo, par_estado)
    VALUES (VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1, 'SMTP_FROM', 'jamesriveranu@gmail.com',
            'Remitente SMTP Brevo', 'VARCHAR2', 'N', 'NOTIFICACIONES', 'A');

  COMMIT;
  
  -- ✅ Confirmación
  DBMS_OUTPUT.put_line('✅ Parámetros SMTP configurados correctamente:');
  DBMS_OUTPUT.put_line('   → SMTP_HOST: smtp-relay.brevo.com');
  DBMS_OUTPUT.put_line('   → SMTP_PORT: 587');
  DBMS_OUTPUT.put_line('   → SMTP_USER: 9a109b001@smtp-brevo.com');
  DBMS_OUTPUT.put_line('   → SMTP_PASS: [encriptada]');
  DBMS_OUTPUT.put_line('   → SMTP_FROM: jamesriveranu@gmail.com');
  
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.put_line('❌ Error al configurar parámetros: '||SQLERRM);
    RAISE;
END;
/

-- ========================================
-- Verificar parámetros insertados
-- ========================================
SELECT par_nombre, 
       CASE 
         WHEN par_encriptado = 'S' THEN '[ENCRIPTADO]'
         ELSE par_valor
       END as valor,
       par_encriptado,
       par_estado,
       par_modulo
FROM VITALIS_SCHEMA.VITALIS_PARAMETROS
WHERE UPPER(par_nombre) IN ('SMTP_HOST', 'SMTP_PORT', 'SMTP_USER', 'SMTP_PASS', 'SMTP_FROM')
ORDER BY par_nombre;