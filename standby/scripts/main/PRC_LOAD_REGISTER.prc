create or replace procedure PRC_LOAD_REGISTER(p_file_name VARCHAR2) is
    l_file UTL_FILE.FILE_TYPE;
    l_line VARCHAR2(32767);
    l_pad_id NUMBER;
    l_cedula VARCHAR2(12);
    l_codigo_elec VARCHAR2(6);
    l_fecha_caduc DATE;
    l_junta VARCHAR2(5);
    l_nombre VARCHAR2(30);
    l_apellido1 VARCHAR2(30);
    l_apellido2 VARCHAR2(30);
    l_provincia VARCHAR2(15);
    l_canton VARCHAR2(25);
    l_distrito VARCHAR2(40);
    
    -- Variables para buscar en Distelec
    CURSOR c_distelec(p_codigo VARCHAR2) IS
        SELECT SUBSTR(TRIM(SUBSTR(linea, 7, 10)), 1, 15) as provincia,
               SUBSTR(TRIM(SUBSTR(linea, 17, 20)), 1, 25) as canton,
               SUBSTR(TRIM(SUBSTR(linea, 37, 34)), 1, 40) as distrito
        FROM (SELECT l_line as linea FROM DUAL)
        WHERE SUBSTR(linea, 1, 6) = p_codigo;
        
BEGIN
    -- Abrir archivo del padrón
    l_file := UTL_FILE.FOPEN('PADRON_DIR', p_file_name, 'R');
    
    LOOP
        BEGIN
            -- Leer línea del archivo
            UTL_FILE.GET_LINE(l_file, l_line);
            
            -- Extraer datos según posiciones fijas documentadas
            l_cedula := TRIM(SUBSTR(l_line, 1, 9));
            l_codigo_elec := TRIM(SUBSTR(l_line, 10, 6));
            -- Saltar posición 16 (relleno)
            
            -- Convertir fecha de formato YYYYMMDD a DATE
            BEGIN
                l_fecha_caduc := TO_DATE(TRIM(SUBSTR(l_line, 17, 8)), 'YYYYMMDD');
            EXCEPTION
                WHEN OTHERS THEN
                    l_fecha_caduc := NULL;
            END;
            
            l_junta := TRIM(SUBSTR(l_line, 25, 5));
            l_nombre := TRIM(SUBSTR(l_line, 30, 30));
            l_apellido1 := TRIM(SUBSTR(l_line, 60, 26));
            l_apellido2 := TRIM(SUBSTR(l_line, 86, 26));
            
            -- Buscar información geográfica basada en código electoral
            BEGIN
                -- Buscar provincia, cantón y distrito usando el código electoral
                -- Nota: Necesitarás cargar primero el archivo Distelec.txt en una tabla temporal
                -- o usar una función para buscar esta información
                SELECT SUBSTR(TRIM(SUBSTR(distelec_line, 7, 10)), 1, 15),
                       SUBSTR(TRIM(SUBSTR(distelec_line, 17, 20)), 1, 25),
                       SUBSTR(TRIM(SUBSTR(distelec_line, 37, 34)), 1, 40)
                INTO l_provincia, l_canton, l_distrito
                FROM (
                    -- Aquí deberías tener una tabla temporal con los datos de Distelec.txt
                    -- o implementar una función que lea el archivo Distelec.txt
                    SELECT '101001,SAN JOSE,CENTRAL,HOSPITAL' as distelec_line FROM DUAL
                    WHERE SUBSTR('101001,SAN JOSE,CENTRAL,HOSPITAL', 1, 6) = l_codigo_elec
                );
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    l_provincia := 'NO ENCONTRADO';
                    l_canton := 'NO ENCONTRADO';
                    l_distrito := 'NO ENCONTRADO';
            END;
            
            -- Obtener siguiente ID de la secuencia
            SELECT vitalis_padron_nacional_seq01.NEXTVAL INTO l_pad_id FROM DUAL;
            
            -- Insertar registro en la tabla
            INSERT INTO vitalis_padron_nacional (
                pad_id,
                pad_cedula,
                pad_nombre,
                pad_apellido1,
                pad_apellido2,
                pad_codigo_elec,
                pad_fecha_cadu,
                pad_junta_recep,
                pad_provincia,
                pad_canton,
                pad_distrito
            ) VALUES (
                l_pad_id,
                l_cedula,
                l_nombre,
                l_apellido1,
                l_apellido2,
                l_codigo_elec,
                l_fecha_caduc,
                l_junta,
                l_provincia,
                l_canton,
                l_distrito
            );
            
            -- Commit cada 1000 registros para mejor performance
            IF MOD(l_pad_id, 1000) = 0 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Procesados ' || l_pad_id || ' registros...');
            END IF;
            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                EXIT; -- Fin del archivo
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error procesando línea: ' || l_line);
                DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
                -- Continuar con la siguiente línea
        END;
    END LOOP;
    
    -- Cerrar archivo
    UTL_FILE.FCLOSE(l_file);
    
    -- Commit final
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Carga del padrón nacional completada exitosamente.');
    
EXCEPTION
    WHEN OTHERS THEN
        -- Cerrar archivo si está abierto
        IF UTL_FILE.IS_OPEN(l_file) THEN
            UTL_FILE.FCLOSE(l_file);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Error en el procedimiento: ' || SQLERRM);
        RAISE;
        
end PRC_LOAD_REGISTER;
/
