
INSERT INTO VITALIS_SCHEMA.vitalis_planillas (
    pla_id, pla_mes, pla_anio, pla_nombre, 
    pla_fecha_generacion, pla_fecha_aprobacion, 
    pla_usu_aprobador, pla_total_ingresos, 
    pla_total_deducciones, pla_total_neto, 
    pla_estado, pla_notificada, pla_tpl_id
) VALUES (
    9999, 11, 2025, 'Planilla Prueba Noviembre 2025',
    SYSDATE, SYSDATE, 'ADMIN',
    500000, 100000, 400000,
    'G', 'N', 1
);
COMMIT;

-- TEST 2: UPDATE en planillas
UPDATE VITALIS_SCHEMA.vitalis_planillas
SET 
    pla_estado = 'A',
    pla_total_neto = 450000,
    pla_fecha_aprobacion = SYSDATE
WHERE pla_id = 9999;
COMMIT;
-- TEST 3: DELETE en planillas
DELETE FROM VITALIS_SCHEMA.vitalis_planillas
WHERE pla_id = 9999;
COMMIT;

-- ========================================
-- PASO 4: PRUEBAS PARA vitalis_escalas_mensuales
-- ========================================


-- TEST 4: INSERT en escalas mensuales
INSERT INTO VITALIS_SCHEMA.vitalis_escalas_mensuales (
    esm_id, esm_mes, esm_anio, esm_nombre,
    esm_fecha_creacion, esm_estado, esm_procesado,
    esm_esd_id, esm_csa_id
) VALUES (
    9999, 11, 2025, 'Escala Prueba Nov',
    SYSDATE, 'ACTIVO', 'N',
    1, 1
);
COMMIT;
-- TEST 5: UPDATE en escalas mensuales
UPDATE VITALIS_SCHEMA.vitalis_escalas_mensuales
SET 
    esm_estado = 'PROCESADO',
    esm_procesado = 'S'
WHERE esm_id = 9999;
COMMIT;
-- TEST 6: DELETE en escalas mensuales
DELETE FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
WHERE esm_id = 9999;
COMMIT;




-- ========================================
-- PASO 5: RESUMEN DE TODAS LAS OPERACIONES
-- ========================================

-- Todas las operaciones de prueba en PLANILLAS
SELECT * FROM VITALIS_SCHEMA.v_auditoria_planillas
WHERE pla_id = 9999
ORDER BY bit_fecha ASC;

-- Todas las operaciones de prueba en ESCALAS MENSUALES
SELECT * FROM VITALIS_SCHEMA.v_auditoria_escalas_mensuales
WHERE esm_id = 9999
ORDER BY bit_fecha ASC;

-- ========================================
-- PASO 6: CONSULTAS ÚTILES DE AUDITORÍA
-- ========================================

-- Últimos 10 cambios en planillas
SELECT 
    bit_id,
    bit_operacion,
    pla_id,
    TO_CHAR(bit_fecha, 'YYYY-MM-DD HH24:MI:SS') AS fecha,
    usuario,
    nombre_usuario
FROM VITALIS_SCHEMA.v_auditoria_planillas
WHERE ROWNUM <= 10
ORDER BY bit_fecha DESC;

-- Últimos 10 cambios en escalas mensuales
SELECT 
    bit_id,
    bit_operacion,
    esm_id,
    TO_CHAR(bit_fecha, 'YYYY-MM-DD HH24:MI:SS') AS fecha,
    usuario,
    nombre_usuario
FROM VITALIS_SCHEMA.v_auditoria_escalas_mensuales
WHERE ROWNUM <= 10
ORDER BY bit_fecha DESC;

-- Conteo de operaciones por tipo
SELECT 
    bit_tabla,
    bit_operacion,
    COUNT(*) AS total_operaciones
FROM VITALIS_SCHEMA.vitalis_bitacoras
WHERE bit_tabla IN ('vitalis_planillas', 'vitalis_escalas_mensuales')
AND TRUNC(bit_fecha) = TRUNC(SYSDATE)
GROUP BY bit_tabla, bit_operacion
ORDER BY bit_tabla, bit_operacion;
