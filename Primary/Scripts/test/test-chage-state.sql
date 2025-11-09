BEGIN
  FOR rec IN (
    SELECT esm_id FROM VITALIS_SCHEMA.vitalis_escalas_mensuales
    WHERE esm_estado = 'CONSTRUCCION'
  ) LOOP
    VITALIS_SCHEMA.cambiar_estado_escala_mensual(rec.esm_id, 'VIGENTE');
    VITALIS_SCHEMA.cambiar_estado_escala_mensual(rec.esm_id, 'EN REVISION');
    VITALIS_SCHEMA.cambiar_estado_escala_mensual(rec.esm_id, 'LISTA PARA PAGO');
  END LOOP;
END;
/
