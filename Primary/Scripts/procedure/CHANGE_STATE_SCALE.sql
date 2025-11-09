CREATE OR REPLACE PROCEDURE cambiar_estado_escala_mensual (
    p_esm_id        IN NUMBER,       -- ID de la escala mensual a cambiar
    p_nuevo_estado  IN VARCHAR2      -- Nuevo estado deseado
) AS
    v_estado_actual VARCHAR2(30);
BEGIN
    -- 1. Verificar si existe la escala
    SELECT esm_estado
      INTO v_estado_actual
      FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
     WHERE esm_id = p_esm_id;

    -- 2. Validar transiciones de estado permitidas
    IF (v_estado_actual = 'CONSTRUCCION' AND p_nuevo_estado = 'VIGENTE') OR
       (v_estado_actual = 'VIGENTE' AND p_nuevo_estado = 'EN REVISION') OR
       (v_estado_actual = 'EN REVISION' AND p_nuevo_estado = 'LISTA PARA PAGO') OR
       (v_estado_actual = 'LISTA PARA PAGO' AND p_nuevo_estado = 'PROCESADA') THEN

        -- 3. Actualizar el estado
        UPDATE VITALIS_SCHEMA.vitalis_escalas_mensuales
           SET esm_estado = p_nuevo_estado
         WHERE esm_id = p_esm_id;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Escala ' || p_esm_id ||
                             ' cambiada de "' || v_estado_actual ||
                             '" a "' || p_nuevo_estado || '".');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transicion no permitida: ' || v_estado_actual ||
                             ' -> ' || p_nuevo_estado || '.');
        DBMS_OUTPUT.PUT_LINE('Permitidas:');
        DBMS_OUTPUT.PUT_LINE('  CONSTRUCCION -> VIGENTE');
        DBMS_OUTPUT.PUT_LINE('  VIGENTE -> EN REVISION');
        DBMS_OUTPUT.PUT_LINE('  EN REVISION -> LISTA PARA PAGO');
        DBMS_OUTPUT.PUT_LINE('  LISTA PARA PAGO -> PROCESADA');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No se encontro la escala mensual con ID ' || p_esm_id);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inesperado: ' || SQLERRM);
END;