-- Test para verificar datos en tablas de escalas mensuales
SELECT * FROM VITALIS_SCHEMA.vitalis_escalas_mensuales;

-- Test para verificar datos en tablas de escalas mensuales a detalle
SELECT * FROM VITALIS_SCHEMA.vitalis_escalas_mensuales_detalle ORDER BY emd_fecha;