CREATE USER VITALIS_APP IDENTIFIED BY "Vitalis#2025";
GRANT CREATE SESSION TO VITALIS_APP;
GRANT VITALIS_ADMINISTRADOR TO VITALIS_APP;
GRANT VITALIS_MEDICO TO VITALIS_APP;
GRANT VITALIS_ADMINISTRATIVO TO VITALIS_APP;

-- GRANTS NECESARIOS PARA VITALIS_APP
GRANT EXECUTE ON VITALIS_SCHEMA.PRC_LOGIN_SEGURO TO VITALIS_APP;
GRANT EXECUTE ON VITALIS_SCHEMA.PKG_SEGURIDAD_ROLES TO VITALIS_APP;
GRANT SELECT ON VITALIS_SCHEMA.vitalis_usuarios TO VITALIS_APP;
GRANT SELECT ON VITALIS_SCHEMA.vitalis_personas TO VITALIS_APP;
GRANT SELECT ON VITALIS_SCHEMA.vitalis_perfiles TO VITALIS_APP;
GRANT SELECT ON VITALIS_SCHEMA.vitalis_parametros TO VITALIS_APP;



INSERT INTO VITALIS_SCHEMA.vitalis_personas
(per_id,per_nombre,per_apellido1,per_apellido2,per_estado_civil,per_fecha_nacimiento,per_sexo,per_email,per_estado,per_tipo_personal)
VALUES (100,'Carlos','Activo','Uno','S','01-JAN-1990','M','carlos.demo@demo.com','A','ADMINISTRATIVO');

INSERT INTO VITALIS_SCHEMA.vitalis_perfiles
(prf_id,prf_nombre,prf_descripcion,prf_estado)
VALUES (100,'ADMINISTRADOR','perfil admin','A');

INSERT INTO VITALIS_SCHEMA.vitalis_usuarios
(usu_id,usu_login,usu_password,usu_fecha_creacion,usu_fecha_ultimo_acceso,usu_intentos_fallidos,usu_bloqueado,usu_estado,usu_per_id,usu_prf_id)
VALUES (100,'carlos.demo','pass123',SYSDATE,SYSDATE,0,'N','A',100,100);

COMMIT;


--TESTING LOGIN PROCEDURE
DECLARE v_r number; v_m varchar2(200);
BEGIN
  VITALIS_SCHEMA.PRC_LOGIN_SEGURO('carlos.demo','pass123','VITALIS2025_SECURE',v_r,v_m);
  dbms_output.put_line(v_r || ' ' || v_m);
END;
/
