# Guía de Prompts para Stitch — 16 Pantallas del PRD

Este documento contiene los prompts estructurados según la skill `stitch-design-to-frontend` para diseñar en Stitch cada una de las 16 pantallas obligatorias del PRD §6 del sistema hospitalario **FCV Citas**, garantizando consistencia visual, diseño responsive (375px móvil y 1440px escritorio) y estados completos (`loading`, `empty`, `error`, `success`, `disabled`).

---

## 1. Sistema Visual y Tokens Base (Design System)

**Prompt para Configuración de Estilo / Tema en Stitch:**
```text
Crea un sistema de diseño médico premium, moderno y accesible para una plataforma hospitalaria llamada "FCV Citas".
- Paleta cromática:
  * Primario: Azul médico hospitalario (#0b57d0 / #1a73e8), confianza y pulcritud.
  * Secundario / Acento: Teal clínico (#00838f / #00a896).
  * Neutros: Superficie clara (#f8fafc), bordes sutiles (#e2e8f0), texto principal (#0f172a), texto atenuado (#64748b).
  * Estados: Aprobada/Completada (#16a34a), Solicitada/Pendiente (#ea580c), Rechazada/Cancelada (#dc2626), Inasistencia (#64748b).
- Tipografía: Inter o Roboto, jerarquía clara (H1: 28px/bold, H2: 20px/semibold, Body: 14-16px, Caption: 12px).
- Componentes: Tarjetas elevadas con sombra suave, botones redondeados (radius 8px), chips de estado coloreados, badges semánticos, inputs con foco accesible azul y mensajes de error descriptivos.
- Leyenda institucional: "Entorno académico y de laboratorio FCV — Datos sintéticos".
```

---

## 2. Pantallas Públicas y de Acceso (USER / Invitado)

### Pantalla 1 · Inicio de Sesión (Login)
```text
Diseña la pantalla de Inicio de Sesión (Login) de FCV Citas para escritorio y móvil (375px).
- Encabezado con logo hospitalario FCV y banner sutil "Entorno académico — Datos sintéticos".
- Formulario centrado con:
  * Campo de correo electrónico (tipo email, con icono y placeholder institucional).
  * Campo de contraseña (con opción de mostrar/ocultar).
  * Enlace "¿Olvidaste tu contraseña?" que conduce a recuperación.
  * Botón principal "Iniciar Sesión" con estado normal, hover y estado loading con spinner.
  * Enlace secundario "¿No tienes cuenta? Regístrate aquí".
- Banner de error genérico para credenciales inválidas ("Credenciales incorrectas. Verifique correo o contraseña").
```

### Pantalla 2 · Registro de Usuario Paciente
```text
Diseña la pantalla de Registro de Paciente en FCV Citas.
- Formulario de registro de dos columnas en escritorio y una columna en móvil:
  * Nombres y Apellidos.
  * Tipo de documento (Selector: Cédula de Ciudadanía CC, Tarjeta de Identidad TI, Pasaporte PA, Cédula de Extranjería CE) y Número de documento.
  * Correo electrónico y Teléfono móvil (+57).
  * Contraseña y confirmación de contraseña (con indicador de requisitos mínimos: 8 caracteres, alfanumérico).
- Botón "Crear Cuenta" deshabilitado mientras falten campos obligatorios.
- Alerta de éxito con botón para redirigir a Login y alertas de conflicto (409) para correo o documento ya registrados.
```

### Pantalla 3 · Recuperación de Contraseña (Forgot Password)
```text
Diseña la pantalla de Recuperación de Contraseña de FCV Citas.
- Formulario simple:
  * Explicación breve: "Ingresa tu correo para recibir las instrucciones de restablecimiento".
  * Campo de correo electrónico.
  * Botón "Enviar enlace de recuperación".
- Estado de éxito: mensaje confirmando el envío de instrucciones sin revelar si el correo existe o no (seguridad).
- En entorno de desarrollo: caja informativa que muestra el token temporal generado para fines de prueba.
```

### Pantalla 4 · Restablecimiento de Contraseña (Reset Password)
```text
Diseña la pantalla para definir Nueva Contraseña tras usar el token de recuperación.
- Campos:
  * Nueva contraseña.
  * Confirmación de nueva contraseña.
  * Token de seguridad (oculto o precargado desde URL).
- Botón "Actualizar Contraseña".
- Mensaje de confirmación y botón para iniciar sesión con la nueva credencial.
```

---

## 3. Pantallas del Paciente (USER)

### Pantalla 5 · Dashboard del Paciente (Home USER)
```text
Diseña el Dashboard principal del Paciente autenticado en FCV Citas.
- Barra de navegación superior con identidad del usuario (Nombre, Rol USER), sede de preferencia y botón "Cerrar Sesión".
- Resumen rápido:
  * Tarjeta de bienvenida con información de afiliación (EPS, Régimen, Plan actual).
  * Widget de "Próxima Cita": tarjeta destacada con fecha, hora, médico, especialidad, sede (HIC o ICV) y estado (APPROVED).
  * Botones de acción rápida: "Agendar Nueva Cita" y "Ver Mis Citas".
- Sección inferior con accesos informativos a sedes: Hospital Internacional de Colombia (HIC) e Instituto Cardiovascular (ICV).
```

### Pantalla 6 · Búsqueda y Consulta de Disponibilidad
```text
Diseña la pantalla interactiva de Consulta de Disponibilidad de Citas Médicas.
- Barra de filtros:
  * Selector de Sede (Todas, HIC - Piedecuesta, ICV - Floridablanca).
  * Selector de Especialidad (Medicina General 30m, Cardiología 60m, Pediatría 30m, Dermatología 30m, Ortopedia 30m).
  * Selector de Profesional médico (opcional, filtrado según especialidad y sede).
  * Selector de Fecha (calendario accesible, fechas pasadas deshabilitadas).
- Grilla de horarios disponibles:
  * Bloques horarios matutinos (08:00 - 12:00) y vespertinos (14:00 - 18:00).
  * Slots de 30 o 60 minutos según especialidad (indicador visual de duración).
  * Estado vacío amigable cuando no hay turnos disponibles con recomendación de seleccionar otra fecha.
```

### Pantalla 7 · Confirmación y Solicitud de Cita
```text
Diseña el modal/pantalla de Confirmación de Cita Médica.
- Resumen del turno seleccionado: Especialidad, Profesional, Sede con dirección completa, Fecha y Horario exacto.
- Aviso de regla de negocio:
  * Para Medicina General: "Confirmación inmediata (Aprobación automática)".
  * Para Especialidades: "Esta solicitud requiere revisión administrativa previa (Estado Solicitada)".
- Botones "Confirmar Cita" y "Volver / Cambiar Horario".
- Feedback de éxito con ID de reserva o conflicto (409) si el slot fue tomado simultáneamente.
```

### Pantalla 8 · Mis Citas e Historial (USER)
```text
Diseña la pantalla "Mis Citas" del Paciente.
- Filtros por pestañas: "Próximas", "Históricas", "Todas" y filtro por estado.
- Listado de tarjetas de citas:
  * Fecha, hora, sede, médico, especialidad y duración.
  * Chip de estado: Verde (APPROVED), Naranja (REQUESTED), Gris (COMPLETED), Rojo (REJECTED / CANCELLED).
  * Para citas rechazadas: caja destacada con el "Motivo de rechazo indicado por administración".
- Acciones por cita:
  * Botón "Cancelar Cita" (solo para citas futuras no terminales, con modal de confirmación).
  * Botón "Reprogramar" (para citas aprobadas futuras).
  * Botón "Ver Historial de Auditoría" (despliega línea de tiempo de cambios de estado).
```

### Pantalla 9 · Solicitud de Reprogramación de Cita
```text
Diseña la pantalla de Solicitud de Reprogramación para el paciente.
- Panel superior fijo: Cita original actual (fecha, hora, médico y sede que se conservan vigentes).
- Panel inferior: Selección del nuevo horario disponible con el MISMO médico y especialidad.
- Mensaje informativo: "Tu cita original se mantendrá reservada hasta que la administración apruebe el nuevo horario".
- Botón "Enviar Solicitud de Reprogramación".
```

### Pantalla 10 · Perfil y Afiliación del Paciente
```text
Diseña la pantalla de Perfil y Afiliación del Paciente.
- Sección 1: Datos Personales (Nombres, Apellidos, Tipo/Número Documento en solo lectura, Teléfono editable, Email no editable).
- Sección 2: Afiliación en Salud:
  * Selector de Régimen (Contributivo, Subsidiado, Especial).
  * Selector de Entidad EPS.
  * Selector de Plan de EPS asociado.
  * Botón "Guardar Afiliación".
```

---

## 4. Pantallas del Profesional de la Salud (PROFESSIONAL)

### Pantalla 11 · Dashboard del Profesional Médico
```text
Diseña el Dashboard principal para Médicos en FCV Citas.
- Encabezado: "Dr(a). Nombre — Matrícula Profesional — Especialidades".
- Tarjeta de resumen del día: citas programadas para hoy, citas atendidas, inasistencias.
- Accesos directos: "Gestionar Disponibilidad de Horarios" y "Ver Agenda del Día".
```

### Pantalla 12 · Gestión de Bloques de Disponibilidad
```text
Diseña la pantalla para que el Médico publique sus bloques de consulta.
- Formulario de creación de bloque:
  * Fecha de disponibilidad (mínimo fecha actual).
  * Sede de atención (solo sedes autorizadas para este médico).
  * Hora de inicio y Hora de fin.
  * Vista previa: muestra la cantidad de turnos de 30 min que se crearán automáticamente.
- Listado / Calendario de bloques existentes con opción de eliminar o editar bloques futuros que no tengan citas comprometidas.
```

### Pantalla 13 · Agenda Médica del Profesional
```text
Diseña la vista de Agenda de Consultas para el Médico.
- Controles de fecha (Hoy, vista por día / semana) y filtro de sede.
- Lista cronológica de pacientes citados:
  * Horario, Paciente, Tipo de documento, Especialidad y Estado de cita.
- Acciones de cierre de consulta:
  * Botón "Marcar Atendida" (pasa a COMPLETED).
  * Botón "Registrar Inasistencia" (pasa a NO_SHOW, con campo opcional para observaciones).
```

---

## 5. Pantallas de Administración (ADMIN)

### Pantalla 14 · Dashboard Administrativo y Bandeja de Citas
```text
Diseña la Bandeja Administrativa de Aprobación de Citas en FCV Citas.
- Pestañas principales:
  * Pestaña 1: "Citas Especializadas Solicitadas (REQUESTED)"
  * Pestaña 2: "Solicitudes de Reprogramación (PENDING)"
- Filtros rápidos por sede, especialidad, médico y rango de fechas.
- Tabla interactiva con datos completos de paciente, horario y especialista.
- Acciones directas por fila:
  * Botón verde "Aprobar Cita" (confirma y asigna definitivamente).
  * Botón rojo "Rechazar Cita" (abre modal obligatorio exigiendo el motivo de rechazo).
```

### Pantalla 15 · CRUD de Profesionales y Asignaciones
```text
Diseña el módulo de Gestión de Profesionales Médicos para el Administrador.
- Tabla de profesionales: Código, Matrícula, Nombre, Especialidades (indicando cuál es la primaria), Sedes asignadas y Estado (Activo/Inactivo).
- Botón "Nuevo Profesional" que abre modal/formulario:
  * Creación del usuario (nombres, documento, correo institucional, contraseña inicial).
  * Código profesional y Matrícula médica.
  * Selección múltiple de Especialidades con selector de especialidad primaria.
  * Selección de Sedes habilitadas (HIC, ICV o ambas).
- Opciones de edición y switch para activar/desactivar profesional sin borrado físico.
```

### Pantalla 16 · Gestión de Especialidades y Catálogos EPS/Planes
```text
Diseña el módulo de Catálogos Configurables para el Administrador.
- Pestaña 1: Especialidades Médicas (Nombre, Código, Duración 30 o 60 min, Tipo General vs Especializada, Requiere Aprobación Admin Sí/No, Switch Activa/Inactiva).
- Pestaña 2: EPS y Planes (Lista de EPS con sus respectivos Planes de salud asociados, formulario para crear EPS y agregar planes con su código y nombre, switch de activación).
- Advertencia visual: "Los catálogos con transacciones asociadas no pueden eliminarse físicamente, solo desactivarse".
```
