BEGIN
    VITALIS_SCHEMA.generar_planilla_mensual(
        p_mes     => 11,
        p_anio    => 2025,
        p_tpl_id  => 1,      -- ID del tipo de planilla que insertaste
        p_usuario => 'ADMIN'
    );
END;
/

--- Ver resultados
SELECT pla_id, pla_nombre, pla_total_ingresos, pla_total_neto
FROM VITALIS_SCHEMA.vitalis_planillas
ORDER BY pla_id DESC;

--- Ver detalles de la planilla generada
SELECT pld_id, pld_per_id, pld_total_neto, pld_pla_id
FROM VITALIS_SCHEMA.vitalis_planillas_detalle
ORDER BY pld_id DESC;