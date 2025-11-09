INSERT INTO VITALIS_SCHEMA.vitalis_tipos_planillas (
    tpl_id,
    tpl_codigo,
    tpl_nombre,
    tpl_descripcion,
    tpl_tipo_personal,
    tpl_estado,
    tpl_version
)
VALUES (
    VITALIS_SCHEMA.vitalis_tipos_planillas_seq01.NEXTVAL,
    100,
    'Planilla General',
    'Planilla de prueba para medicos y administrativos',
    'M',
    'A',
    1
);



