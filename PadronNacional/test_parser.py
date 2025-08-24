from createPadron import PadronSQLGenerator

# Crear una instancia del generador
generator = PadronSQLGenerator()

# Leer las primeras 5 líneas del archivo para probar
print("Probando el parser con las primeras 5 líneas:")
print("=" * 60)

with open('PADRON_COMPLETO.txt', 'r', encoding='latin-1') as f:
    for i, line in enumerate(f):
        if i >= 5:
            break
        print(f'Línea {i+1}: {line.strip()}')
        parsed = generator.parse_padron_line(line)
        if parsed:
            print(f'  ✓ Procesada:')
            print(f'    Cédula: {parsed["cedula"]}')
            print(f'    Código: {parsed["codigo_electoral"]}')
            print(f'    Nombre: {parsed["nombre"]}')
            print(f'    Primer apellido: {parsed["primer_apellido"]}')
            print(f'    Segundo apellido: {parsed["segundo_apellido"]}')
        else:
            print(f'  ✗ No procesada')
        print()
