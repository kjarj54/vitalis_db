-- ========== PRUEBA 1: INSERT en planilla ==========

DECLARE
    v_tpl_id NUMBER;
BEGIN
    -- Obtener un tipo de planilla válido
    SELECT tpl_id INTO v_tpl_id 
    FROM VITALIS_SCHEMA.vitalis_tipos_planillas 
    WHERE ROWNUM = 1;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_planillas (
        pla_mes, pla_anio, pla_nombre, pla_fecha_generacion,
        pla_fecha_aprobacion, pla_usu_aprobador, pla_total_ingresos,
        pla_total_deducciones, pla_total_neto, pla_estado,
        pla_notificada, pla_tpl_id
    ) VALUES (
        1, 2026, 'TEST-PLANILLA-001', SYSDATE,
        SYSDATE, 'admin', 100000, 10000, 90000, 'G', 'N',
        v_tpl_id
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('   ✓ INSERT ejecutado correctamente');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en INSERT: ' || SQLERRM);
END;
/

-- ========== PRUEBA 2: UPDATE en planilla ==========

BEGIN
    UPDATE VITALIS_SCHEMA.vitalis_planillas
    SET pla_estado = 'A', 
        pla_notificada = 'S',
        pla_total_neto = 95000
    WHERE pla_nombre = 'TEST-PLANILLA-001';
    
    IF SQL%ROWCOUNT > 0 THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('   ✓ UPDATE ejecutado correctamente (' || SQL%ROWCOUNT || ' fila)');
    ELSE
        DBMS_OUTPUT.PUT_LINE('   ⚠ No se encontró la planilla para actualizar');
        ROLLBACK;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en UPDATE: ' || SQLERRM);
END;
/


-- ========== PRUEBA 3: DELETE en planilla ==========

DECLARE
    v_pla_id NUMBER;
BEGIN
    -- Obtener el ID antes de eliminar
    SELECT pla_id INTO v_pla_id
    FROM VITALIS_SCHEMA.vitalis_planillas
    WHERE pla_nombre = 'TEST-PLANILLA-001';
    
    DELETE FROM VITALIS_SCHEMA.vitalis_planillas
    WHERE pla_id = v_pla_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('   ✓ DELETE ejecutado correctamente (ID: ' || v_pla_id || ')');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('   ⚠ No se encontró la planilla para eliminar');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en DELETE: ' || SQLERRM);
END;
/

-- ============================================================================
-- PARTE 3: PRUEBAS DE TRIGGERS EN ESCALAS MENSUALES
-- ============================================================================

-- ========== PRUEBA 4: INSERT en escala mensual ==========

DECLARE
    v_esd_id NUMBER;
    v_csa_id NUMBER;
BEGIN
    -- Obtener IDs válidos
    SELECT esd_id INTO v_esd_id 
    FROM VITALIS_SCHEMA.vitalis_escalas_base 
    WHERE ROWNUM = 1;
    
    SELECT csa_id INTO v_csa_id 
    FROM VITALIS_SCHEMA.vitalis_centros_salud 
    WHERE ROWNUM = 1;
    
    INSERT INTO VITALIS_SCHEMA.vitalis_escalas_mensuales (
        esm_mes, esm_anio, esm_nombre, esm_fecha_creacion,
        esm_estado, esm_procesado, esm_esd_id, esm_csa_id
    ) VALUES (
        1, 2026, 'TEST-ESCALA-001', SYSDATE,
        'CONSTRUCCION', 'N',
        v_esd_id,
        v_csa_id
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('   ✓ INSERT ejecutado correctamente');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en INSERT: ' || SQLERRM);
END;
/


-- ========== PRUEBA 5: UPDATE en escala mensual ==========

BEGIN
    UPDATE VITALIS_SCHEMA.vitalis_escalas_mensuales
    SET esm_estado = 'VIGENTE',
        esm_procesado = 'S'
    WHERE esm_nombre = 'TEST-ESCALA-001';
    
    IF SQL%ROWCOUNT > 0 THEN
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('   ✓ UPDATE ejecutado correctamente (' || SQL%ROWCOUNT || ' fila)');
    ELSE
        DBMS_OUTPUT.PUT_LINE('   ⚠ No se encontró la escala para actualizar');
        ROLLBACK;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en UPDATE: ' || SQLERRM);
END;
/

-- ========== PRUEBA 6: DELETE en escala mensual ==========
DECLARE
    v_esm_id NUMBER;
    v_count NUMBER;
BEGIN
    -- Verificar cuántas filas existen
    SELECT COUNT(*) INTO v_count
    FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
    WHERE esm_nombre = 'TEST-ESCALA-001';
    
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('   ⚠ No se encontró la escala para eliminar');
    ELSIF v_count = 1 THEN
        -- Solo una fila, proceder normalmente
        SELECT esm_id INTO v_esm_id
        FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
        WHERE esm_nombre = 'TEST-ESCALA-001';
        
        DELETE FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
        WHERE esm_id = v_esm_id;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('   ✓ DELETE ejecutado correctamente (ID: ' || v_esm_id || ')');
    ELSE
        -- Múltiples filas, eliminar solo la más reciente
        SELECT esm_id INTO v_esm_id
        FROM (
            SELECT esm_id 
            FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
            WHERE esm_nombre = 'TEST-ESCALA-001'
            ORDER BY esm_fecha_creacion DESC
        ) WHERE ROWNUM = 1;
        
        DELETE FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
        WHERE esm_id = v_esm_id;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('   ✓ DELETE ejecutado correctamente (ID: ' || v_esm_id || ', ' || v_count || ' filas encontradas, eliminada la más reciente)');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('   ✗ ERROR en DELETE: ' || SQLERRM);
END;
/
-- ============================================================================
-- PARTE 4: VERIFICACIÓN DE RESULTADOS
-- ============================================================================
SELECT 
   *
FROM VITALIS_SCHEMA.vitalis_bitacoras b
LEFT JOIN VITALIS_SCHEMA.vitalis_usuarios u ON b.bit_usu_id = u.usu_id
ORDER BY b.bit_fecha DESC;

-- ============================================================================
-- ESTADÍSTICAS DE LAS PRUEBAS
-- ============================================================================

DECLARE
    v_total_planillas NUMBER;
    v_total_escalas NUMBER;
    v_total_inserts NUMBER;
    v_total_updates NUMBER;
    v_total_deletes NUMBER;
BEGIN
    -- Contar operaciones por tabla
    SELECT COUNT(*) INTO v_total_planillas
    FROM VITALIS_SCHEMA.vitalis_bitacoras
    WHERE bit_tabla = 'vitalis_planillas'
      AND bit_fecha >= TRUNC(SYSDATE);
    
    SELECT COUNT(*) INTO v_total_escalas
    FROM VITALIS_SCHEMA.vitalis_bitacoras
    WHERE bit_tabla = 'vitalis_escalas_mensuales'
      AND bit_fecha >= TRUNC(SYSDATE);
    
    -- Contar por tipo de operación
    SELECT 
        SUM(CASE WHEN bit_operacion = 'INSERT' THEN 1 ELSE 0 END),
        SUM(CASE WHEN bit_operacion = 'UPDATE' THEN 1 ELSE 0 END),
        SUM(CASE WHEN bit_operacion = 'DELETE' THEN 1 ELSE 0 END)
    INTO v_total_inserts, v_total_updates, v_total_deletes
    FROM VITALIS_SCHEMA.vitalis_bitacoras
    WHERE bit_tabla IN ('vitalis_planillas', 'vitalis_escalas_mensuales')
      AND bit_fecha >= TRUNC(SYSDATE);
    
    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Total registros en vitalis_planillas:        ' || v_total_planillas);
    DBMS_OUTPUT.PUT_LINE('Total registros en vitalis_escalas_mensuales: ' || v_total_escalas);
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Por tipo de operación:');
    DBMS_OUTPUT.PUT_LINE('  - INSERT: ' || v_total_inserts);
    DBMS_OUTPUT.PUT_LINE('  - UPDATE: ' || v_total_updates);
    DBMS_OUTPUT.PUT_LINE('  - DELETE: ' || v_total_deletes);
    DBMS_OUTPUT.PUT_LINE('  - TOTAL:  ' || (v_total_inserts + v_total_updates + v_total_deletes));
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Validar que se registraron todas las operaciones esperadas
    IF (v_total_inserts + v_total_updates + v_total_deletes) = 6 THEN
        DBMS_OUTPUT.PUT_LINE('✓✓✓ TODAS LAS PRUEBAS EJECUTADAS Y REGISTRADAS CORRECTAMENTE ✓✓✓');
    ELSE
        DBMS_OUTPUT.PUT_LINE('⚠⚠⚠ ADVERTENCIA: Se esperaban 6 registros, se encontraron ' || 
                             (v_total_inserts + v_total_updates + v_total_deletes) || ' ⚠⚠⚠');
    END IF;
END;
/
