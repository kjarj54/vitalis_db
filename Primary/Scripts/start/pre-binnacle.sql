
/*
=====================================================
AUDITORÍA SIMPLE PARA PLANILLAS Y ESCALAS MENSUALES
Base de Datos: Vitalis - Oracle 19c
Fecha: 2025-11-11
=====================================================

TABLAS AUDITADAS:
1. vitalis_planillas
2. vitalis_escalas_mensuales

Usa la estructura actual de vitalis_bitacoras
=====================================================
*/

-- ========================================
-- PACKAGE PARA FUNCIONES DE AUDITORÍA
-- ========================================

CREATE OR REPLACE PACKAGE VITALIS_SCHEMA.PKG_AUDITORIA AS
    -- Función para obtener el usuario actual
    FUNCTION get_usuario_actual RETURN NUMBER;
    
    -- Función para obtener IP del cliente
    FUNCTION get_ip_usuario RETURN VARCHAR2;
    
    -- Procedimiento para registrar cambios
    PROCEDURE registrar_cambio(
        p_tabla VARCHAR2,
        p_operacion VARCHAR2,
        p_pk_tabla NUMBER,
        p_valores_anteriores CLOB,
        p_valores_nuevos CLOB
    );
END PKG_AUDITORIA;
/

CREATE OR REPLACE PACKAGE BODY VITALIS_SCHEMA.PKG_AUDITORIA AS

    -- Obtener usuario actual del contexto de aplicación
    FUNCTION get_usuario_actual RETURN NUMBER IS
        v_usuario_id NUMBER;
    BEGIN
        -- Intenta obtener el usuario del contexto de aplicación
        BEGIN
            v_usuario_id := SYS_CONTEXT('VITALIS_CTX', 'USUARIO_ID');
        EXCEPTION
            WHEN OTHERS THEN
                v_usuario_id := NULL;
        END;
        
        RETURN v_usuario_id;
    END get_usuario_actual;

    -- Obtener IP del usuario
    FUNCTION get_ip_usuario RETURN VARCHAR2 IS
    BEGIN
        RETURN SYS_CONTEXT('USERENV', 'IP_ADDRESS');
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'UNKNOWN';
    END get_ip_usuario;

    -- Registrar cambio en bitácoras
    PROCEDURE registrar_cambio(
        p_tabla VARCHAR2,
        p_operacion VARCHAR2,
        p_pk_tabla NUMBER,
        p_valores_anteriores CLOB,
        p_valores_nuevos CLOB
    ) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        INSERT INTO VITALIS_SCHEMA.vitalis_bitacoras (
            bit_id,
            bit_tabla,
            bit_operacion,
            bit_pk_tabla,
            bit_usuario_id,
            bit_usu_id,
            bit_fecha,
            bit_valores_anteriores,
            bit_valores_nuevos,
            bit_ip_usuario
        ) VALUES (
            VITALIS_SCHEMA.vitalis_bitacoras_seq01.NEXTVAL,
            p_tabla,
            p_operacion,
            p_pk_tabla,
            get_usuario_actual(),
            get_usuario_actual(),
            SYSDATE,
            p_valores_anteriores,
            p_valores_nuevos,
            get_ip_usuario()
        );
        
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            -- No lanzar error para no afectar la transacción principal
            NULL;
    END registrar_cambio;

END PKG_AUDITORIA;
/


-- ========================================
-- VISTAS PARA CONSULTAR AUDITORÍA
-- ========================================

-- Vista para ver cambios en PLANILLAS
CREATE OR REPLACE VIEW VITALIS_SCHEMA.v_auditoria_planillas AS
SELECT 
    b.bit_id,
    b.bit_operacion,
    b.bit_pk_tabla AS pla_id,
    b.bit_fecha,
    b.bit_ip_usuario,
    u.usu_login AS usuario,
    p.per_nombre || ' ' || p.per_apellido1 || ' ' || p.per_apellido2 AS nombre_usuario,
    b.bit_valores_anteriores,
    b.bit_valores_nuevos
FROM VITALIS_SCHEMA.vitalis_bitacoras b
LEFT JOIN VITALIS_SCHEMA.vitalis_usuarios u ON b.bit_usu_id = u.usu_id
LEFT JOIN VITALIS_SCHEMA.vitalis_personas p ON u.usu_per_id = p.per_id
WHERE b.bit_tabla = 'vitalis_planillas'
ORDER BY b.bit_fecha DESC;

-- Vista para ver cambios en ESCALAS MENSUALES
CREATE OR REPLACE VIEW VITALIS_SCHEMA.v_auditoria_escalas_mensuales AS
SELECT 
    b.bit_id,
    b.bit_operacion,
    b.bit_pk_tabla AS esm_id,
    b.bit_fecha,
    b.bit_ip_usuario,
    u.usu_login AS usuario,
    p.per_nombre || ' ' || p.per_apellido1 || ' ' || p.per_apellido2 AS nombre_usuario,
    b.bit_valores_anteriores,
    b.bit_valores_nuevos
FROM VITALIS_SCHEMA.vitalis_bitacoras b
LEFT JOIN VITALIS_SCHEMA.vitalis_usuarios u ON b.bit_usu_id = u.usu_id
LEFT JOIN VITALIS_SCHEMA.vitalis_personas p ON u.usu_per_id = p.per_id
WHERE b.bit_tabla = 'vitalis_escalas_mensuales'
ORDER BY b.bit_fecha DESC;

-- ========================================
-- PROCEDIMIENTO PARA ESTABLECER CONTEXTO
-- ========================================

CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.set_usuario_contexto(
    p_usuario_id IN NUMBER
) AS
BEGIN
    -- Este procedimiento debe ser llamado al inicio de cada sesión
    -- desde la aplicación para establecer el usuario actual
    DBMS_SESSION.SET_CONTEXT('VITALIS_CTX', 'USUARIO_ID', p_usuario_id);
END;
/

-- ========================================
-- GRANTS
-- ========================================

-- Dar permisos de ejecución al package
GRANT EXECUTE ON VITALIS_SCHEMA.PKG_AUDITORIA TO PUBLIC;
GRANT EXECUTE ON VITALIS_SCHEMA.set_usuario_contexto TO PUBLIC;

-- Dar permisos de consulta a las vistas
GRANT SELECT ON VITALIS_SCHEMA.v_auditoria_planillas TO PUBLIC;
GRANT SELECT ON VITALIS_SCHEMA.v_auditoria_escalas_mensuales TO PUBLIC;



------------------------------------------------------------------------------------------------------------------------------------------------


/*
SCRIPT DE DATOS DE PRUEBA
Para probar el sistema de bitácoras
Fecha: 09/11/2025
*/

-- ============================================================================
-- PASO 1: INSERTAR DATOS BÁSICOS NECESARIOS
-- ============================================================================

-- 1. Insertar un Perfil
INSERT INTO VITALIS_SCHEMA.vitalis_perfiles (
    prf_nombre, prf_descripcion, prf_estado
) VALUES (
    'Administrador', 'Perfil de administrador del sistema', 'A'
);

-- 2. Insertar una Persona
INSERT INTO VITALIS_SCHEMA.vitalis_personas (
    per_nombre, per_apellido1, per_apellido2, 
    per_estado_civil, per_fecha_nacimiento, per_sexo, 
    per_email, per_estado, per_tipo_personal
) VALUES (
    'Juan', 'Perez', 'Lopez',
    'Soltero', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'M',
    'juan.perez@vitalis.com', 'A', 'ADMINISTRATIVO'
);

-- 3. Insertar Usuario (usando el perfil y persona recién creados)
INSERT INTO VITALIS_SCHEMA.vitalis_usuarios (
    usu_login, usu_password, usu_fecha_creacion, 
    usu_fecha_ultimo_acceso, usu_intentos_fallidos, 
    usu_bloqueado, usu_estado, 
    usu_per_id, usu_prf_id
) VALUES (
    'admin', 'admin123', SYSDATE,
    SYSDATE, 0,
    'N', 'A',
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com'),
    (SELECT prf_id FROM VITALIS_SCHEMA.vitalis_perfiles WHERE prf_nombre = 'Administrador')
);

-- 4. Insertar Tipo de Planilla
INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas (
    tpl_codigo, tpl_nombre, tpl_descripcion, 
    tpl_tipo_personal, tpl_estado
) VALUES (
    1, 'Planilla Médica', 'Planilla para personal médico', 'M', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas (
    tpl_codigo, tpl_nombre, tpl_descripcion, 
    tpl_tipo_personal, tpl_estado
) VALUES (
    2, 'Planilla Admin', 'Planilla para personal administrativo', 'A', 'A'
);

-- 5. Insertar datos geográficos básicos
INSERT INTO VITALIS_SCHEMA.vitalis_paises (
    pai_codigo, pai_nombre, pai_estado
) VALUES (
    'CR', 'Costa Rica', 'A'
);

INSERT INTO VITALIS_SCHEMA.vitalis_provincia (
    pai_id, pro_codigo, pro_nombre, pro_estado, pro_version
) VALUES (
    (SELECT pai_id FROM VITALIS_SCHEMA.vitalis_paises WHERE pai_codigo = 'CR'),
    '1', 'San José', 'A', 1
);

INSERT INTO VITALIS_SCHEMA.vitalis_cantones (
    can_codigo, can_nombre, can_estado, can_pro_id
) VALUES (
    1, 'Central', 'A',
    (SELECT pro_id FROM VITALIS_SCHEMA.vitalis_provincia WHERE pro_nombre = 'San José')
);

INSERT INTO VITALIS_SCHEMA.vitalis_distritos (
    dis_codigo, dis_nombre, dis_estado, dis_version, dis_can_id
) VALUES (
    1, 'Carmen', 'A', 1,
    (SELECT can_id FROM VITALIS_SCHEMA.vitalis_cantones WHERE can_nombre = 'Central')
);

-- 6. Insertar Centro de Salud
INSERT INTO VITALIS_SCHEMA.vitalis_centros_salud (
    csa_codigo, csa_nombre, csa_direccion_exacta, 
    csa_telefono, csa_email, csa_contacto_principal, 
    csa_telefono_contacto, csa_estado, csa_dis_id
) VALUES (
    1, 'Centro Vitalis', '100m norte del parque central',
    '2222-3333', 'info@vitalis.com', 'Dr. Rodriguez',
    '8888-9999', 'A',
    (SELECT dis_id FROM VITALIS_SCHEMA.vitalis_distritos WHERE dis_nombre = 'Carmen')
);

-- 7. Insertar Puesto Turno
INSERT INTO VITALIS_SCHEMA.vitalis_puestos_turnos (
    put_dia_semana, put_monto_cobrar, put_monto_pagar, 
    put_tipo_pago, put_fecha_inicio, put_fecha_fin, 
    put_max_personas, put_min_persona, put_nombre, 
    put_hora_inicio, put_hora_fin, put_especialidad, 
    put_salario, put_csa_id, put_per_id
) VALUES (
    1, 5000, 4000,
    'TURNO', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'),
    3, 1, 'Turno Mañana',
    TIMESTAMP '2025-01-01 08:00:00', TIMESTAMP '2025-01-01 16:00:00', 'Medicina General',
    450000,
    (SELECT csa_id FROM VITALIS_SCHEMA.vitalis_centros_salud WHERE csa_nombre = 'Centro Vitalis'),
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com')
);

-- 8. Insertar Escala Base
INSERT INTO VITALIS_SCHEMA.vitalis_escalas_base (
    esd_dia_semana, esd_estado, esd_fecha_creacion, 
    esd_nombre, esd_dia_inicio, esd_dia_fin, 
    esd_per_id, esd_put_id
) VALUES (
    1, 'A', SYSDATE,
    'Escala Base Prueba', TO_DATE('2025-11-01', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'),
    (SELECT per_id FROM VITALIS_SCHEMA.vitalis_personas WHERE per_email = 'juan.perez@vitalis.com'),
    (SELECT put_id FROM VITALIS_SCHEMA.vitalis_puestos_turnos WHERE put_nombre = 'Turno Mañana')
);

COMMIT;

