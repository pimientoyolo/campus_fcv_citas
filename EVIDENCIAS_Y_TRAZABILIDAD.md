# Evidencias y Trazabilidad para Evaluación Final FCV Citas

Registro consolidado y formal de los incrementos de desarrollo correspondientes a las sesiones S2, S3, S4, S5 y S6 del laboratorio académico FCV Citas.

---

## 1. Matriz de Incrementos y Entregables

| Sesión | Incremento Técnico | Repositorios Afectados | HUs Abordadas | Estado DoD |
|---|---|---|---|---|
| **S2** | Acceso de usuarios, autenticación JWT, registro y login sin BFF | `citas-api`, `citas-web`, raíz | HU-001, HU-002, HU-003 | **100% Completada** |
| **S3** | Agendamiento, anti-double-booking (RN-01), concurrencia, calidad y pre-commit | `citas-api`, `citas-web`, raíz | HU-004, HU-005, HU-006 | **100% Completada** |
| **S4** | MVP completo: recuperación contraseña (RF-03), afiliaciones EPS (RF-04), reprogramaciones (RF-15/18), catálogos (RF-06) | `citas-api`, `citas-web`, raíz | HU-007, HU-008, HU-009, HU-010 | **100% Completada** |
| **S5** | Integración externa n8n (WF-001), API de recordatorios, seguridad de contenido no confiable e IPI | `citas-api`, `citas-web`, raíz | HU-011, HU-012 | **100% Completada** |
| **S6** | Cierre de plataforma: n8n WF-002 (Webhooks/Outbox), n8n WF-003 (Resumen Operativo), validación integral y merge a main | `citas-api`, `citas-web`, raíz | HU-013, HU-014 | **100% Completada** |

---

## 2. Registro Detallado por Sesión

### Sesión S2 — Acceso de Usuarios y Baseline
- **Repos:** `citas-api`, `citas-web`, raíz
- **Branch:** `develop`
- **HUs abordadas:** HU-001 (Registro), HU-002 (Sesión JWT), HU-003 (Interfaz de Acceso).
- **Pruebas ejecutadas:** `smoke-auth.mjs` (18/18 checks HTTP exitosos), `AuthIntegrationTest` (6/6 passing).
- **Evidencia documental:** `docs/wiki/llm-wiki/wiki/s2-evidencia.md`.

### Sesión S3 — Calidad, Concurrencia y Agendamiento
- **Repos:** `citas-api`, `citas-web`, raíz
- **Commits:**
  - `citas-api`: `0ccd3b3`
  - `citas-web`: `c2943bb`
  - Raíz: `7adc2ff`
- **HUs abordadas:** HU-004 (Disponibilidad), HU-005 (Agendar Cita), HU-006 (Gestión Médica y Administrativa).
- **Criterios completados:** Bloqueo atómico a nivel de BD (`assignSlots` con `appointmentId IS NULL`), concurrencia multihilo comprobada con `CyclicBarrier` (2 hilos simultáneos: 1 wins 201, 1 gets 409).
- **Hooks de Calidad:** `.githooks/pre-commit` instalado en los 3 repositorios, validando bloqueo de credenciales y ejecución de pruebas. Evidencia: `docs/evidence/s3/hooks.md`.

### Sesión S4 — MVP Funcional y Bucles Autónomos
- **Repos:** `citas-api`, `citas-web`, raíz
- **Commits:**
  - `citas-api`: `e109726`
  - `citas-web`: `dff69e4`
- **HUs abordadas:** HU-007 (Recuperar Contraseña), HU-008 (Perfil y Afiliaciones), HU-009 (Reprogramar Cita), HU-010 (Catálogos Configurables).
- **Migraciones Flyway:** V4 (Password Reset), V5 (Afiliaciones y EPS), V6 (Reprogramaciones), V7 (Integraciones).
- **Pruebas y Evidencias:**
  - `S4FeaturesIntegrationTest.java` (4 flujos end-to-end superados).
  - Bucles Builder/Verifier: `docs/evidence/s4/loops/LOOP-01.json`, `LOOP-02.json`, `LOOP-03.json`.
  - Siembra dinámica: `scripts/seed-demo.mjs` (disponibilidad activa para 14 días).
  - Resumen formal: `docs/evidence/s4/resumen-s4.md`.

### Sesión S5 — Agente Conectado, n8n y Seguridad
- **Repos:** `citas-api`, `citas-web`, raíz
- **Commits:**
  - `citas-api`: `ec24f88`
- **HUs abordadas:** HU-011 (Recordatorios n8n), HU-012 (Seguridad frente a contenido no confiable).
- **Entregables:**
  - Workflow n8n exportado: `automations/n8n/WF-001-appointment-reminders.json`.
  - Endpoint de integración: `GET /api/integrations/appointments/upcoming` y `POST /api/integrations/appointments/reminders`.
  - Salvaguardas de seguridad: `docs/wiki/llm-wiki/wiki/seguridad-contenido-no-confiable.md`.
  - Demo de sanitización: `docs/evidence/s5/untrusted-content-demo.json`.
  - Resumen formal: `docs/evidence/s5/resumen-s5.md`.

### Sesión S6 — Automatizaciones Reactivas y Cierre de Plataforma
- **Repos:** `citas-api`, `citas-web`, raíz
- **Commits:**
  - `citas-api`: `c8c462d`
  - `citas-web`: `1b7cee2`
- **HUs abordadas:** HU-013 (Notificación de estados vía Webhook), HU-014 (Resumen Operativo Diario).
- **Entregables:**
  - Workflow n8n exportado: `automations/n8n/WF-002-status-notifications.json`.
  - Workflow n8n exportado: `automations/n8n/WF-003-daily-operational-summary.json`.
  - Mecanismo Outbox en backend: `notification_events` con despacho y confirmación vía `/api/integrations/events/{id}/ack`.
  - Reporte consolidado: `GET /api/integrations/reports/daily-summary`.
  - Resumen formal: `docs/evidence/s6/resumen-s6.md`.
  - Suite de pruebas de integraciones: `co.fcv.citas.IntegrationEndpointsTest` (2/2 passing).

---

## 3. Estado Final de Calidad
- **Backend (`citas-api`):** 23/23 pruebas unitarias y de integración superadas (cero errores, cero fallos).
- **Frontend (`citas-web`):** Compilación de producción con TypeScript estricto y Vite superada (`vite build` exitoso).
- **Seguridad:** Pre-commit hooks activos en los 3 repositorios; cero secretos, JWT o hashes en texto plano versionados.
