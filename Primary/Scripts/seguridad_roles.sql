-- =============================================================================
-- SEGURIDAD ROLES VITALIS FINAL
-- =============================================================================

-- 1) CREACIÓN DE ROLES
CREATE ROLE VITALIS_ADMINISTRADOR IDENTIFIED BY "admin2025!";
CREATE ROLE VITALIS_MEDICO IDENTIFIED BY "medico2025!";
CREATE ROLE VITALIS_ADMINISTRATIVO IDENTIFIED BY "admin_op2025!";

-- 2) PARÁMETROS BASE SISTEMA (DES CBC PKCS5 BASE64)

INSERT INTO VITALIS_SCHEMA.vitalis_parametros (
    par_id, par_codigo, par_nombre, par_valor, par_descripcion, 
    par_tipo_dato, par_encriptado, par_modulo, par_estado
) VALUES (
    VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1001, 'CLAVE_MAESTRA_SISTEMA', 
    'RCEB29we0mSA3htXPT1c5ZWVCgWmxQwe',
    'Clave maestra encriptada para acceso a funcionalidades del sistema',
    'VARCHAR2', 'S', 'SEGURIDAD', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_parametros (
    par_id, par_codigo, par_nombre, par_valor, par_descripcion,
    par_tipo_dato, par_encriptado, par_modulo, par_estado
) VALUES (
    VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1002, 'ROL_ADMINISTRADOR', 'VITALIS_ADMINISTRADOR',
    'Nombre del rol de administrador del sistema', 'VARCHAR2', 'N', 'SEGURIDAD', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_parametros (
    par_id, par_codigo, par_nombre, par_valor, par_descripcion,
    par_tipo_dato, par_encriptado, par_modulo, par_estado
) VALUES (
    VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1003, 'ROL_MEDICO', 'VITALIS_MEDICO',
    'Nombre del rol de médico', 'VARCHAR2', 'N', 'SEGURIDAD', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_parametros (
    par_id, par_codigo, par_nombre, par_valor, par_descripcion,
    par_tipo_dato, par_encriptado, par_modulo, par_estado
) VALUES (
    VITALIS_SCHEMA.vitalis_parametros_seq01.NEXTVAL, 1004, 'ROL_ADMINISTRATIVO', 'VITALIS_ADMINISTRATIVO',
    'Nombre del rol administrativo', 'VARCHAR2', 'N', 'SEGURIDAD', 'A'
);


-- 3) PACKAGE SPEC
CREATE OR REPLACE PACKAGE PKG_SEGURIDAD_ROLES AS
    FUNCTION validar_clave_maestra(p_clave VARCHAR2) RETURN BOOLEAN;
    FUNCTION obtener_rol_asignado(p_usuario_id NUMBER) RETURN VARCHAR2;
    FUNCTION verificar_rol_activo(p_rol VARCHAR2) RETURN BOOLEAN;
END PKG_SEGURIDAD_ROLES;
/

-- 4) PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY PKG_SEGURIDAD_ROLES AS

    FUNCTION validar_clave_maestra(p_clave VARCHAR2) RETURN BOOLEAN IS
        v_valor varchar2(4000);
        v_clave_desencriptada VARCHAR2(200);
    BEGIN
        SELECT par_valor INTO v_valor
        FROM vitalis_parametros
        WHERE par_codigo = 1001 AND par_estado='A';

        v_clave_desencriptada := utl_raw.cast_to_varchar2(
                                  dbms_crypto.decrypt(
                                    utl_encode.base64_decode(utl_raw.cast_to_raw(v_valor)),
                                    dbms_crypto.des_cbc_pkcs5,
                                    utl_raw.cast_to_raw('V1t@l1s!')
                                  )
                                );

        RETURN (v_clave_desencriptada = p_clave);
    EXCEPTION WHEN OTHERS THEN RETURN FALSE;
    END validar_clave_maestra;


    FUNCTION obtener_rol_asignado(p_usuario_id NUMBER) RETURN VARCHAR2 IS
        v_tipo_personal VARCHAR2(20);
        v_perfil_nombre VARCHAR2(100);
        v_rol VARCHAR2(50);
    BEGIN
        SELECT p.per_tipo_personal,pf.prf_nombre
        INTO v_tipo_personal,v_perfil_nombre
        FROM vitalis_usuarios u
        JOIN vitalis_personas p ON u.usu_per_id=p.per_id
        JOIN vitalis_perfiles pf ON u.usu_prf_id=pf.prf_id
        WHERE u.usu_id=p_usuario_id AND u.usu_estado='A' AND p.per_estado='A' AND pf.prf_estado='A';

        IF UPPER(v_perfil_nombre) LIKE '%ADMIN%' THEN v_rol := 'VITALIS_ADMINISTRADOR';
        ELSIF UPPER(v_tipo_personal)='MEDICO' THEN v_rol:= 'VITALIS_MEDICO';
        ELSE v_rol:='VITALIS_ADMINISTRATIVO';
        END IF;

        RETURN v_rol;
    END obtener_rol_asignado;

    FUNCTION verificar_rol_activo(p_rol VARCHAR2) RETURN BOOLEAN IS
        v_count NUMBER := 0;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM SESSION_ROLES
        WHERE ROLE = UPPER(p_rol);
        
        RETURN (v_count > 0);
    EXCEPTION
        WHEN OTHERS THEN
            RETURN FALSE;
    END verificar_rol_activo;

END PKG_SEGURIDAD_ROLES;
/

-- 5) PROCEDURE LOGIN
CREATE OR REPLACE PROCEDURE PRC_LOGIN_SEGURO(
    p_usuario_login     VARCHAR2,
    p_password          VARCHAR2,
    p_clave_maestra     VARCHAR2,
    p_resultado         OUT NUMBER,  -- 0 OK / 1 usuario-pass incorrecto / 2 clave maestra incorrecta / 3 error
    p_mensaje           OUT VARCHAR2
) IS
    v_usuario_id          NUMBER;
    v_password_bd         VARCHAR2(200);
    v_intentos            NUMBER;
    v_bloqueado           CHAR(1);
    v_estado              CHAR(1);
BEGIN
    p_resultado := 3;
    p_mensaje   := 'Error no identificado';

    BEGIN
        SELECT usu_id,usu_password,usu_intentos_fallidos,usu_bloqueado,usu_estado
        INTO v_usuario_id,v_password_bd,v_intentos,v_bloqueado,v_estado
        FROM vitalis_usuarios
        WHERE usu_login=p_usuario_login;

        IF v_estado='I' THEN
            p_resultado:=1; p_mensaje:='Usuario Inactivo'; RETURN;
        END IF;

        IF v_bloqueado='S' THEN
            p_resultado:=1; p_mensaje:='Usuario bloqueado'; RETURN;
        END IF;

        IF v_password_bd != p_password THEN
            UPDATE vitalis_usuarios
               SET usu_intentos_fallidos = usu_intentos_fallidos+1,
                   usu_bloqueado         = CASE WHEN usu_intentos_fallidos>=2 THEN 'S' ELSE 'N' END
             WHERE usu_id=v_usuario_id;
            COMMIT;
            p_resultado:=1; p_mensaje:='Credenciales incorrectas'; RETURN;
        END IF;

    EXCEPTION WHEN NO_DATA_FOUND THEN
        p_resultado:=1; p_mensaje:='Usuario no existe'; RETURN;
    END;


    -- validar clave maestra
    IF NOT PKG_SEGURIDAD_ROLES.validar_clave_maestra(p_clave_maestra) THEN
        p_resultado:=2;
        p_mensaje:='Clave maestra incorrecta';
        RETURN;
    END IF;

    UPDATE vitalis_usuarios
       SET usu_fecha_ultimo_acceso=SYSDATE,
           usu_intentos_fallidos=0
     WHERE usu_id=v_usuario_id;
    COMMIT;

    p_resultado := 0;
    p_mensaje   := 'Login OK';

END PRC_LOGIN_SEGURO;
/

-- 6) FUNCTION CLAVE MAESTRA
CREATE OR REPLACE FUNCTION FNC_GET_CLAVE_MAESTRA RETURN VARCHAR2 IS
    v_valor VARCHAR2(4000);
    v_clave_desencriptada VARCHAR2(4000);
BEGIN
    IF NOT PKG_SEGURIDAD_ROLES.verificar_rol_activo('VITALIS_ADMINISTRADOR') THEN
        RAISE_APPLICATION_ERROR(-20005,'No tiene permisos para obtener la clave maestra');
    END IF;
    SELECT par_valor INTO v_valor FROM vitalis_parametros WHERE par_codigo=1001 AND par_estado='A';
    v_clave_desencriptada:=UTL_RAW.cast_to_varchar2(
                                DBMS_CRYPTO.decrypt(
                                    UTL_ENCODE.base64_decode(UTL_RAW.cast_to_raw(v_valor)),
                                    DBMS_CRYPTO.DES_CBC_PKCS5,
                                    UTL_RAW.cast_to_raw('V1t@l1s!')
                                )
                            );
    RETURN v_clave_desencriptada;
END FNC_GET_CLAVE_MAESTRA;
/

-- 7) GRANTS
GRANT SELECT,INSERT,UPDATE,DELETE ON VITALIS_SCHEMA.vitalis_parametros TO VITALIS_ADMINISTRADOR;
GRANT EXECUTE ON VITALIS_SCHEMA.PKG_SEGURIDAD_ROLES TO VITALIS_ADMINISTRADOR;
GRANT EXECUTE ON VITALIS_SCHEMA.PRC_LOGIN_SEGURO TO VITALIS_ADMINISTRADOR;
GRANT EXECUTE ON VITALIS_SCHEMA.FNC_GET_CLAVE_MAESTRA TO VITALIS_ADMINISTRADOR;