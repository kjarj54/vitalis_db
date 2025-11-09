-- Insertar usuarios con diferentes estados de actividad para pruebas de pre-email
INSERT INTO VITALIS_SCHEMA.vitalis_perfiles (
  prf_id,
  prf_nombre,
  prf_descripcion,
  prf_estado,
  prf_version
) VALUES (
  VITALIS_SCHEMA.vitalis_perfiles_seq01.NEXTVAL,
  'PRUEBA_PRE_EMAIL',
  'Perfil para pruebas de inactividad de usuarios',
  'A',
  1
);

-- guardar ID perfil creado
DECLARE
  v_prf_id NUMBER;
BEGIN
  SELECT prf_id INTO v_prf_id FROM (
    SELECT prf_id FROM VITALIS_SCHEMA.vitalis_perfiles
    WHERE prf_nombre='PRUEBA_PRE_EMAIL'
    ORDER BY prf_id DESC
  ) WHERE ROWNUM=1;

  -- USUARIO ACTIVO (10 días sin acceso)
  INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2,
    per_estado_civil, per_fecha_nacimiento, per_sexo,
    per_email, per_estado, per_tipo_personal
  ) VALUES (
    VITALIS_SCHEMA.vitalis_personas_seq01.NEXTVAL,
    'Carlos', 'Activo', 'Martinez',
    'Soltero', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'M',
    'carlos.activo@vitalis.com', 'A', 'ADMIN'
  );

  INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id, usu_login, usu_password,
    usu_fecha_creacion, usu_fecha_ultimo_acceso,
    usu_intentos_fallidos, usu_bloqueado, usu_estado,
    usu_per_id, usu_prf_id
  ) VALUES (
    VITALIS_SCHEMA.vitalis_usuarios_seq01.NEXTVAL,
    'carlos.activo', 'pass123',
    SYSDATE, TRUNC(SYSDATE) - 10,
    0, 'N', 'A',
    VITALIS_SCHEMA.vitalis_personas_seq01.CURRVAL, v_prf_id
  );

  -- USUARIO INACTIVO 95 días
  INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2,
    per_estado_civil, per_fecha_nacimiento, per_sexo,
    per_email, per_estado, per_tipo_personal
  ) VALUES (
    VITALIS_SCHEMA.vitalis_personas_seq01.NEXTVAL,
    'Juan', 'Dormido', 'Lopez',
    'Casado', TO_DATE('1985-03-10', 'YYYY-MM-DD'), 'M',
    'juan.dormido@vitalis.com', 'A', 'EMPLEADO'
  );

  INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id, usu_login, usu_password,
    usu_fecha_creacion, usu_fecha_ultimo_acceso,
    usu_intentos_fallidos, usu_bloqueado, usu_estado,
    usu_per_id, usu_prf_id
  ) VALUES (
    VITALIS_SCHEMA.vitalis_usuarios_seq01.NEXTVAL,
    'juan.dormido', 'pass123',
    SYSDATE, TRUNC(SYSDATE) - 95,
    0, 'N', 'A',
    VITALIS_SCHEMA.vitalis_personas_seq01.CURRVAL, v_prf_id
  );

  -- USUARIO INACTIVO 120 días
  INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2,
    per_estado_civil, per_fecha_nacimiento, per_sexo,
    per_email, per_estado, per_tipo_personal
  ) VALUES (
    VITALIS_SCHEMA.vitalis_personas_seq01.NEXTVAL,
    'Maria', 'Olvidada', 'Fernandez',
    'Divorciada', TO_DATE('1988-07-22', 'YYYY-MM-DD'), 'F',
    'maria.olvidada@vitalis.com', 'A', 'EMPLEADO'
  );

  INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id, usu_login, usu_password,
    usu_fecha_creacion, usu_fecha_ultimo_acceso,
    usu_intentos_fallidos, usu_bloqueado, usu_estado,
    usu_per_id, usu_prf_id
  ) VALUES (
    VITALIS_SCHEMA.vitalis_usuarios_seq01.NEXTVAL,
    'maria.olvidada', 'pass123',
    SYSDATE, TRUNC(SYSDATE) - 120,
    0, 'N', 'A',
    VITALIS_SCHEMA.vitalis_personas_seq01.CURRVAL, v_prf_id
  );

  -- USUARIO INACTIVO 150 días
  INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_id, per_nombre, per_apellido1, per_apellido2,
    per_estado_civil, per_fecha_nacimiento, per_sexo,
    per_email, per_estado, per_tipo_personal
  ) VALUES (
    VITALIS_SCHEMA.vitalis_personas_seq01.NEXTVAL,
    'Pedro', 'Ausente', 'Ramirez',
    'Soltero', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 'M',
    'pedro.ausente@vitalis.com', 'A', 'EMPLEADO'
  );

  INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_id, usu_login, usu_password,
    usu_fecha_creacion, usu_fecha_ultimo_acceso,
    usu_intentos_fallidos, usu_bloqueado, usu_estado,
    usu_per_id, usu_prf_id
  ) VALUES (
    VITALIS_SCHEMA.vitalis_usuarios_seq01.NEXTVAL,
    'pedro.ausente', 'pass123',
    SYSDATE, TRUNC(SYSDATE) - 150,
    0, 'N', 'A',
    VITALIS_SCHEMA.vitalis_personas_seq01.CURRVAL, v_prf_id
  );
END;
/

-------------------------------------------------------------------------------------------------------------

--Indices dañados
-- Crear una tabla y un índice para dañarlo

CREATE TABLE VITALIS_SCHEMA.test_indice_danado (
  id NUMBER PRIMARY KEY,
  dato VARCHAR2(100)
) TABLESPACE VITALIS_DATA;

CREATE INDEX VITALIS_SCHEMA.idx_test_dato ON VITALIS_SCHEMA.test_indice_danado(dato)
TABLESPACE VITALIS_IDX;

-- Dañar el índice intencionalmente
ALTER INDEX VITALIS_SCHEMA.idx_test_dato UNUSABLE;

--------------------------------------------------------------------------------------------------------------
--Objetos inválidos
-- Crear un procedimiento que será inválido
CREATE OR REPLACE PROCEDURE SP_TEST_INVALIDO AS
  v_dato NUMBER;
BEGIN
  -- Esta tabla NO EXISTE, por lo que el procedimiento quedará inválido
  SELECT COUNT(*) INTO v_dato
  FROM tabla_que_no_existe_en_la_base_de_datos;
END;
/

--Verificar
SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'SP_TEST_INVALIDO';

--------------------------------------------------------------------------------------------------------------
--Tablespaces con uso >85%
-- Desde sys crear un tablespace de prueba
CREATE TABLESPACE VITALIS_DEMO
  DATAFILE '/opt/oracle/oradata/VITALIS/VITALISPDB1/VITALIS_DEMO01.dbf' 
  SIZE 50M
  AUTOEXTEND OFF;

ALTER USER VITALIS_SCHEMA QUOTA UNLIMITED ON VITALIS_DEMO;


--Desde VITALIS_SCHEMA crear una tabla grande para aumentar el uso del tablespace
DECLARE
  v_uso_actual NUMBER;
  v_contador NUMBER := 0;
BEGIN
  -- Eliminar tabla si existe
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TEMP_FILL_DEMO PURGE';
    DBMS_OUTPUT.PUT_LINE('→ Tabla anterior eliminada');
  EXCEPTION
    WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('→ Creando tabla nueva');
  END;
  
  -- Crear tabla base con datos grandes
  EXECUTE IMMEDIATE 'CREATE TABLE TEMP_FILL_DEMO 
                     TABLESPACE VITALIS_DEMO AS 
                     SELECT LEVEL AS id, 
                            RPAD(''A'', 4000, ''A'') AS data1,
                            RPAD(''B'', 4000, ''B'') AS data2,
                            RPAD(''C'', 4000, ''C'') AS data3,
                            RPAD(''D'', 4000, ''D'') AS data4
                     FROM dual CONNECT BY LEVEL <= 100';
  
  DBMS_OUTPUT.PUT_LINE('→ Tabla base creada con 100 registros');
  COMMIT;
  
  -- Insertar registros hasta superar el 85%
  FOR i IN 1..100 LOOP
    BEGIN
      EXECUTE IMMEDIATE 'INSERT /*+ APPEND */ INTO TEMP_FILL_DEMO 
                         SELECT id + ' || (i * 10000) || ', data1, data2, data3, data4 
                         FROM TEMP_FILL_DEMO 
                         WHERE ROWNUM <= 100';
      COMMIT;
      
      v_contador := v_contador + 100;
      
      -- Verificar uso cada 5 iteraciones
      IF MOD(i, 5) = 0 THEN
        SELECT ROUND((df.bytes - NVL(fs.bytes, 0)) / df.bytes * 100, 2)
        INTO v_uso_actual
        FROM 
          (SELECT tablespace_name, SUM(bytes) bytes 
           FROM sys.dba_data_files 
           WHERE tablespace_name = 'VITALIS_DEMO'
           GROUP BY tablespace_name) df
        LEFT JOIN 
          (SELECT tablespace_name, SUM(bytes) bytes 
           FROM sys.dba_free_space 
           WHERE tablespace_name = 'VITALIS_DEMO'
           GROUP BY tablespace_name) fs
        ON df.tablespace_name = fs.tablespace_name;
        
        DBMS_OUTPUT.PUT_LINE('→ Progreso: ' || v_uso_actual || '% (' || v_contador || ' registros)');
        
        -- Si superamos el 85%, salir
        IF v_uso_actual >= 85 THEN
          DBMS_OUTPUT.PUT_LINE('✓ Objetivo alcanzado: ' || v_uso_actual || '%');
          EXIT;
        END IF;
      END IF;
      
    EXCEPTION
      WHEN OTHERS THEN
        IF SQLCODE = -1653 THEN -- Tablespace lleno
          DBMS_OUTPUT.PUT_LINE('✓ Tablespace lleno');
          EXIT;
        ELSE
          DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
          EXIT;
        END IF;
    END;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('✓ Proceso completado - Total: ' || v_contador || ' registros');
END;
/
