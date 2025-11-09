BEGIN
    -- Medicos
    VITALIS_SCHEMA.generar_escala_mensual(1, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(3, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(4, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(5, 10, 2025, 1);

    -- Administrativos
    VITALIS_SCHEMA.generar_escala_mensual(2, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(6, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(7, 10, 2025, 1);
    VITALIS_SCHEMA.generar_escala_mensual(8, 10, 2025, 1);
END;
/
