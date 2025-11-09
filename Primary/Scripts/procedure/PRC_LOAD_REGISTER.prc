CREATE OR REPLACE PROCEDURE PRC_LOAD_REGISTER(
    p_file_location IN VARCHAR2,
    p_file_name IN VARCHAR2
) IS
    v_file UTL_FILE.FILE_TYPE;
    v_line VARCHAR2(500);
    v_cedula VARCHAR2(12);
    v_codigo_elec VARCHAR2(6);
    v_relleno VARCHAR2(1);
    v_fecha_caduc VARCHAR2(8);
    v_junta VARCHAR2(5);
    v_nombre VARCHAR2(30);
    v_apellido1 VARCHAR2(30);
    v_apellido2 VARCHAR2(30);
    v_provincia VARCHAR2(15);
    v_canton VARCHAR2(25);
    v_distrito VARCHAR2(40);
    v_fecha_cadu DATE;
    v_pad_id NUMBER;
    v_count NUMBER := 0;
    v_error_count NUMBER := 0;
    v_pos NUMBER;
    v_campo NUMBER;
BEGIN
    -- Abrir el archivo
    v_file := UTL_FILE.FOPEN(p_file_location, p_file_name, 'R', 32767);
    
    DBMS_OUTPUT.PUT_LINE('Iniciando carga del Padrón Nacional...');
    
    LOOP
        BEGIN
            -- Leer línea por línea
            UTL_FILE.GET_LINE(v_file, v_line);
            
            -- Parsear la línea separada por comas
            -- Formato: CEDULA,CODELEC,RELLENO,FECHACADUC,JUNTA,NOMBRE,APELLIDO1,APELLIDO2
            v_pos := 1;
            v_campo := 1;
            
            -- Campo 1: CEDULA
            v_cedula := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 1));
            
            -- Campo 2: CODELEC
            v_codigo_elec := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 2));
            
            -- Campo 3: RELLENO (ignorar)
            v_relleno := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 3));
            
            -- Campo 4: FECHACADUC
            v_fecha_caduc := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 4));
            
            -- Campo 5: JUNTA
            v_junta := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 5));
            
            -- Campo 6: NOMBRE
            v_nombre := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 6));
            
            -- Campo 7: APELLIDO1
            v_apellido1 := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 7));
            
            -- Campo 8: APELLIDO2
            v_apellido2 := TRIM(REGEXP_SUBSTR(v_line, '[^,]+', 1, 8));
            
            -- Validar que la cédula no esté vacía
            IF v_cedula IS NULL OR LENGTH(v_cedula) = 0 THEN
                v_error_count := v_error_count + 1;
                CONTINUE;
            END IF;
            
            -- Convertir fecha de YYYYMMDD a DATE
            BEGIN
                IF v_fecha_caduc IS NOT NULL AND LENGTH(v_fecha_caduc) = 8 THEN
                    v_fecha_cadu := TO_DATE(v_fecha_caduc, 'YYYYMMDD');
                ELSE
                    v_fecha_cadu := TO_DATE('31/12/2099', 'DD/MM/YYYY');
                END IF;
            EXCEPTION
                WHEN OTHERS THEN
                    v_fecha_cadu := TO_DATE('31/12/2099', 'DD/MM/YYYY');
            END;
            
            -- Obtener información de provincia, cantón y distrito desde Distelec
            -- El archivo Distelec.txt está separado por comas: CODELE,PROVINCIA,CANTON,DISTRITO
            BEGIN
                DECLARE
                    v_distelec_file UTL_FILE.FILE_TYPE;
                    v_distelec_line VARCHAR2(500);
                    v_codigo_buscar VARCHAR2(6);
                    v_found BOOLEAN := FALSE;
                BEGIN
                    v_distelec_file := UTL_FILE.FOPEN(p_file_location, 'Distelec.txt', 'R', 32767);
                    
                    LOOP
                        BEGIN
                            UTL_FILE.GET_LINE(v_distelec_file, v_distelec_line);
                            
                            -- Extraer el código electoral (primer campo)
                            v_codigo_buscar := TRIM(REGEXP_SUBSTR(v_distelec_line, '[^,]+', 1, 1));
                            
                            IF v_codigo_buscar = v_codigo_elec THEN
                                -- Extraer provincia, cantón y distrito
                                v_provincia := TRIM(REGEXP_SUBSTR(v_distelec_line, '[^,]+', 1, 2));
                                v_canton := TRIM(REGEXP_SUBSTR(v_distelec_line, '[^,]+', 1, 3));
                                v_distrito := TRIM(REGEXP_SUBSTR(v_distelec_line, '[^,]+', 1, 4));
                                v_found := TRUE;
                                EXIT;
                            END IF;
                        EXCEPTION
                            WHEN NO_DATA_FOUND THEN
                                EXIT;
                        END;
                    END LOOP;
                    
                    UTL_FILE.FCLOSE(v_distelec_file);
                    
                    IF NOT v_found THEN
                        v_provincia := 'DESCONOCIDO';
                        v_canton := 'DESCONOCIDO';
                        v_distrito := 'DESCONOCIDO';
                    END IF;
                EXCEPTION
                    WHEN OTHERS THEN
                        IF UTL_FILE.IS_OPEN(v_distelec_file) THEN
                            UTL_FILE.FCLOSE(v_distelec_file);
                        END IF;
                        v_provincia := 'DESCONOCIDO';
                        v_canton := 'DESCONOCIDO';
                        v_distrito := 'DESCONOCIDO';
                END;
            END;
            
            -- Obtener el siguiente ID de la secuencia
            SELECT VITALIS_SCHEMA.vitalis_padron_nacional_seq01.NEXTVAL 
            INTO v_pad_id 
            FROM DUAL;
            
            -- Insertar el registro
            INSERT INTO VITALIS_SCHEMA.vitalis_padron_nacional (
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
                v_pad_id,
                v_cedula,
                v_nombre,
                v_apellido1,
                v_apellido2,
                v_codigo_elec,
                v_fecha_cadu,
                v_junta,
                v_provincia,
                v_canton,
                v_distrito
            );
            
            v_count := v_count + 1;
            
            -- Commit cada 1000 registros para mejor performance
            IF MOD(v_count, 1000) = 0 THEN
                COMMIT;
                DBMS_OUTPUT.PUT_LINE('Procesados ' || v_count || ' registros...');
            END IF;
            
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                EXIT; -- Fin del archivo
            WHEN DUP_VAL_ON_INDEX THEN
                v_error_count := v_error_count + 1;
                CONTINUE; -- Cédula duplicada, continuar
            WHEN OTHERS THEN
                v_error_count := v_error_count + 1;
                DBMS_OUTPUT.PUT_LINE('Error en línea: ' || SQLERRM);
                CONTINUE;
        END;
    END LOOP;
    
    -- Cerrar el archivo
    UTL_FILE.FCLOSE(v_file);
    
    -- Commit final
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Carga completada!');
    DBMS_OUTPUT.PUT_LINE('Total de registros insertados: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Total de errores: ' || v_error_count);
    
EXCEPTION
    WHEN OTHERS THEN
        IF UTL_FILE.IS_OPEN(v_file) THEN
            UTL_FILE.FCLOSE(v_file);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Error fatal: ' || SQLERRM);
        ROLLBACK;
        RAISE;
END PRC_LOAD_REGISTER;
/
