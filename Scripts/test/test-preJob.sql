SELECT 'Usuarios inactivos >90 días' AS tipo, COUNT(*) AS cantidad
FROM vitalis_usuarios
WHERE usu_estado = 'A'
  AND usu_fecha_ultimo_acceso < TRUNC(SYSDATE) - 90
UNION ALL
SELECT 'Índices dañados', COUNT(*)
FROM sys.dba_indexes
WHERE owner = 'VITALIS_SCHEMA'
  AND status IN ('UNUSABLE', 'INVALID')
UNION ALL
SELECT 'Objetos inválidos', COUNT(*)
FROM sys.dba_objects
WHERE owner = 'VITALIS_SCHEMA'
  AND status = 'INVALID'
UNION ALL
SELECT 'Tablespaces con uso >85%', COUNT(*)
FROM (
  SELECT df.tablespace_name,
         ROUND((df.bytes - NVL(fs.bytes, 0)) / df.bytes * 100, 2) AS uso_porcentaje
  FROM (SELECT tablespace_name, SUM(bytes) bytes FROM sys.dba_data_files
        WHERE tablespace_name IN ('VITALIS_DATA','VITALIS_IDX','VITALIS_TEST_DATA')
        GROUP BY tablespace_name) df
  LEFT JOIN (SELECT tablespace_name, SUM(bytes) bytes FROM sys.dba_free_space
             WHERE tablespace_name IN ('VITALIS_DATA','VITALIS_IDX','VITALIS_TEST_DATA')
             GROUP BY tablespace_name) fs
  ON df.tablespace_name = fs.tablespace_name
  WHERE ROUND((df.bytes - NVL(fs.bytes, 0)) / df.bytes * 100, 2) > 85
);