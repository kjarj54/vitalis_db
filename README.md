# Vitalis DB - Sistema de Administración de Centros de Salud

![Vitalis Logo](Vitalis.svg)

## 📋 Descripción del Proyecto

Vitalis DB es un sistema integral de administración de bases de datos diseñado específicamente para la gestión de centros de salud. Este proyecto forma parte del curso de **Administración de Bases de Datos** de la Universidad Nacional Sede Región Brunca, desarrollado durante el II Ciclo del 2025.

El sistema proporciona una solución completa para la administración del personal médico y administrativo, gestión de planillas, control financiero, y mantenimiento de bases de datos con alta disponibilidad mediante implementación de servidores standby.

## 🎯 Objetivos

- **Diseño y Administración**: Aplicar conocimientos prácticos sobre diseño y administración de bases de datos mediante modelos relacionales para sistemas de centros de salud.
- **Soluciones Reales**: Implementar soluciones funcionales para administrar funcionalidad, seguridad y manejo de notificaciones.
- **Alta Disponibilidad**: Desarrollar e implementar un servidor de respaldo para garantizar la continuidad del servicio.

## 🏥 Funcionalidades Principales

### 👥 Administración del Personal
- Auto registro de personal médico y administrativo
- Sistema de aprobación por administradores
- Generación automática de usuarios del sistema
- Gestión de perfiles y permisos
- Registro de información bancaria para pagos
- Control de documentación requerida

### 🏢 Administración de Centros de Salud
- Registro y gestión de centros de salud
- Control de puestos médicos y turnos
- Gestión de procedimientos médicos
- Escalas base y mensuales de atención
- Control de cobros y pagos por servicios

### 💰 Administración de Planillas
- Creación de tipos de planillas personalizadas
- Generación automática de planillas mensuales
- Comprobantes de pago automáticos vía email
- Control de movimientos y deducciones
- Reportes de depósitos bancarios

### 📊 Administración Financiera
- Resúmenes mensuales de ingresos y gastos
- Reportes por centro de salud
- Control detallado de transacciones financieras

## 🔐 Características de Seguridad

### Seguridad a Nivel de Base de Datos
- **Roles implementados**: Administrador, Médico, Administrativo
- **Autenticación**: Sistema de claves encriptadas
- **Perfiles de usuario**: Control granular de accesos por pantalla
- **Procedimientos seguros**: Asignación automática de permisos

### Sistema de Notificaciones
- **Configuración parametrizada**: Correo, claves y destinatarios
- **Encriptación**: Claves de correo encriptadas para mayor seguridad
- **Envío directo**: Notificaciones enviadas directamente desde Oracle

## 📁 Estructura del Proyecto

> **⚠️ En Desarrollo**: La documentación detallada de scripts y estructura de carpetas será actualizada próximamente.

```
vitalis_db/
├── 📄 Proyecto I.pdf              # Especificaciones del proyecto
├── 📄 README.md                   # Este archivo
├── 🗃️ vitalis_script.SQL          # Scripts principales de la BD
├── 📄 Vitalis-Diccionario.pdf     # Diccionario de datos
├── 🖼️ Vitalis.svg                 # Logo del proyecto
├── 📄 Vitalis.txp                 # Modelo de base de datos
├── 📁 PadronNacional/             # Datos del padrón nacional
├── 📁 standby/                    # Configuración del servidor standby
├── 📁 tablespace/                 # Scripts de tablespaces
└── 📁 Triggers/                   # Triggers de la base de datos
```

## 🛠️ Tecnologías Utilizadas

- **Base de Datos**: Oracle 19c
- **Sistema Operativo**: Linux/Windows
- **Contenedores**: Docker & Docker Compose
- **Backup y Replicación**: Oracle Data Guard
- **Automatización**: Scripts Bash/Shell

## 🚀 Instalación y Configuración

### Prerrequisitos
- Oracle Database 19c
- Docker y Docker Compose
- Sistema operativo Linux o Windows
- Acceso a red para configuración standby

### Pasos de Instalación

> **⚠️ En Desarrollo**: Los scripts de instalación y configuración detallados serán proporcionados próximamente.

1. **Clonación del repositorio**
   ```bash
   git clone https://github.com/kjarj54/vitalis_db.git
   cd vitalis_db
   ```

2. **Configuración de la base de datos principal**
   - Ejecutar scripts de tablespace
   - Importar modelo de datos
   - Configurar usuarios y permisos

3. **Configuración del servidor standby**
   - Configurar Docker containers
   - Establecer replicación automática
   - Configurar backups programados

## 📈 Características de Alta Disponibilidad

### Sistema Standby
- **Servidores separados**: Principal y standby independientes
- **Actualización automática**: Archivos de actualización cada 5 minutos o 50 MB
- **Transferencia programada**: Sincronización cada 10 minutos
- **Limpieza automática**: Eliminación de archivos obsoletos (3 días)
- **Backup diario**: Respaldo automático transferido al standby

### Monitoreo y Notificaciones
- **Inactividad de usuarios**: Proceso mensual de desactivación automática
- **Control de tablespace**: Verificación diaria (límite 85%)
- **Objetos inválidos**: Detección y notificación diaria
- **Índices dañados**: Verificación y notificación automática

## 👨‍💻 Equipo de Desarrollo

| Desarrollador | GitHub Profile | Rol |
|---------------|----------------|-----|
| **Kevin Arauz** | [@kjarj54](https://github.com/kjarj54) | Lead Developer |
| **Kevin Fallas** | [@kevtico20](https://github.com/kevtico20) | Database Administrator |
| **James Rivera** | [@JamesRiveran](https://github.com/JamesRiveran) | Backend Developer |

## 🏫 Institución Académica

**Universidad Nacional Sede Región Brunca**  
Facultad de Ciencias Exactas y Naturales  
Escuela de Informática  

**Curso**: Administración de Bases de Datos  
**Profesor**: Máster Carlos Carranza Blanco  
**Período**: II Ciclo 2025  

## 📄 Licencia

**Copyright © 2025 - Equipo Vitalis DB**

Este proyecto es de autoría original de Kevin Arauz, Kevin Fallas y James Rivera. Desarrollado para fines académicos en la Universidad Nacional Sede Región Brunca.

**Todos los derechos reservados.** Ver [LICENSE](LICENSE) para términos y condiciones completas de uso.

**Resumen de términos:**
- ✅ Permitido: Visualización y estudio académico
- ❌ Prohibido: Uso comercial, redistribución, copia para entregables
- 📧 Contacto: A través de los perfiles de GitHub de los desarrolladores

## 🔄 Estado del Desarrollo

| Componente | Estado | Última Actualización |
|------------|--------|---------------------|
| 📊 Modelo de Base de Datos | ✅ Completado | Octubre 2025 |
| 🗃️ Scripts SQL | 🚧 En Desarrollo | Octubre 2025 |
| 🐳 Docker Configuration | 🚧 En Desarrollo | Octubre 2025 |
| 📋 Documentación | 🚧 En Desarrollo | Octubre 2025 |
| 🔧 Scripts de Automatización | ⏳ Pendiente | - |
| 🧪 Testing | ⏳ Pendiente | - |

## 📞 Soporte y Contribuciones

Para reportar problemas, sugerir mejoras o contribuir al proyecto:

1. Crear un [Issue](../../issues) describiendo el problema o sugerencia
2. Para contribuciones, crear un Fork y Pull Request
3. Seguir las convenciones de código establecidas
4. Incluir documentación para nuevas funcionalidades

## 📚 Documentación Adicional

- [Proyecto I.pdf](Proyecto%20I.pdf) - Especificaciones completas del proyecto
- [Vitalis-Diccionario.pdf](Vitalis-Diccionario.pdf) - Diccionario de datos detallado
- [Manual de Instalación](standby/oracle-docker-guide.md) - Guía de instalación Oracle con Docker

---

**Desarrollado con ❤️ por el equipo Vitalis DB**  
*Universidad Nacional - Sede Región Brunca - 2025*