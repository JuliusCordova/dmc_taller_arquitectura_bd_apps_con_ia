# Preguntas abiertas y validaciones — Crédito Ágil 360

## Principio

La información no disponible no se completa con supuestos. Cada punto debe ser resuelto por el stakeholder indicado o aceptado formalmente como dependencia antes del diseño detallado o desarrollo.

## Preguntas críticas de negocio y alcance

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-001 | ¿Cuál es el monto, plazo, tasa y vigencia permitidos por campaña y segmento? | Riesgos / Negocio | Evaluación y oferta |
| PQ-002 | ¿Cuáles son los valores base y metas de conversión, tiempo, abandono, mora temprana e intervención manual? | CEO / Negocio / Riesgos | Métricas de éxito |
| PQ-003 | ¿Qué capacidades exactas deben estar operativas para considerar cumplido el MVP de cuatro meses? | Sponsor / Producto | Alcance y planificación |
| PQ-004 | ¿El MVP incluye desembolso para todos los casos aprobados o solo para una campaña y perfiles determinados? | Negocio / Operaciones | Flujo end-to-end |

## Identidad, datos y consentimiento

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-005 | ¿Qué mecanismo de autenticación y recuperación de solicitud se utilizará por canal? | Seguridad / Canales | Continuidad omnicanal |
| PQ-006 | ¿Qué datos puede actualizar directamente el cliente y cuáles requieren verificación adicional? | Canales / Operaciones / Riesgos | Journey y calidad de datos |
| PQ-007 | ¿Qué datos se consideran vigentes y cuál es su periodo de vigencia? | Dueños de datos / Riesgos | Reutilización de datos |
| PQ-008 | ¿Cuál es el texto, alcance, vigencia y evidencia requerida para cada autorización de consulta? | Cumplimiento / Legal | Consentimiento |
| PQ-009 | ¿Cuál es la política de retención, clasificación y eliminación de documentos y datos de la solicitud? | Cumplimiento / Seguridad / Gobierno de Datos | Privacidad y almacenamiento |
| PQ-010 | ¿Qué datos sensibles pueden persistirse en la aplicación y cuáles deben consultarse bajo demanda? | Seguridad / Arquitectura / Gobierno de Datos | Diseño de datos |

## Reglas, evaluación y excepciones

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-011 | ¿Cuál es el catálogo inicial de reglas, su prioridad, vigencia, campaña y responsable? | Riesgos | Motor de reglas |
| PQ-012 | ¿Qué combinaciones exactas derivan a aprobación automática, rechazo, observación o revisión manual? | Riesgos | Decisión |
| PQ-013 | ¿Qué motivos internos pueden comunicarse al cliente y con qué redacción? | Riesgos / Cumplimiento / Canales | Mensajería |
| PQ-014 | ¿Cuál es la matriz de aprobación de excepciones y la segregación exigida por nivel? | Riesgos | Workflow de excepciones |
| PQ-015 | ¿Qué score o scores se utilizan, de qué fuente provienen y cómo deben versionarse? | Riesgos | Trazabilidad |
| PQ-016 | ¿Qué reglas determinan si un intento es nueva solicitud, reintento o duplicado? | Riesgos / Canales / Operaciones | Idempotencia |

## IA y agentes

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-017 | ¿Qué tipos documentales serán procesados por IA en el MVP? | Riesgos / Operaciones | Alcance IA |
| PQ-018 | ¿Cuál es el umbral de confianza por campo y documento? | Riesgos / Model Risk / Operaciones | Revisión humana |
| PQ-019 | ¿Qué modelos o proveedores están autorizados y qué datos pueden recibir? | Seguridad / Cumplimiento / Arquitectura | Selección tecnológica |
| PQ-020 | ¿Qué acciones puede realizar un agente de orientación y cuáles requieren confirmación humana? | Producto / Riesgos / Cumplimiento | Autonomía del agente |
| PQ-021 | ¿Cómo se medirán precisión, falsos positivos, falsos negativos, drift y calidad del resumen? | Riesgos / Model Risk | Monitoreo IA |
| PQ-022 | ¿Qué evidencia y logs deben conservarse de prompts, respuestas, herramientas y decisiones humanas? | Seguridad / Auditoría / Model Risk | AgentOps / auditoría |

## Integraciones y resiliencia

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-023 | ¿Cuáles son las fuentes internas y externas exactas, propietarios, contratos, SLA y límites? | Arquitectura / Riesgos | Integración |
| PQ-024 | ¿Qué operaciones deben ser síncronas y cuáles pueden continuar de forma asíncrona? | Arquitectura / Producto | Experiencia y diseño |
| PQ-025 | ¿Qué política de reintentos, timeout, backoff y circuito aplica a cada integración? | Arquitectura / Operaciones | Resiliencia |
| PQ-026 | ¿Cómo se confirma de forma confiable que un desembolso fue ejecutado por el core? | Operaciones / Core bancario | Idempotencia financiera |
| PQ-027 | ¿Qué identificadores de correlación existen en los sistemas legados? | Arquitectura / Dueños de sistema | Trazabilidad distribuida |

## Requisitos no funcionales pendientes

| ID | Pregunta | Responsable sugerido | Impacto |
|---|---|---|---|
| PQ-028 | ¿Cuál es el SLA de disponibilidad y la ventana de servicio? | Negocio / Operaciones | Disponibilidad |
| PQ-029 | ¿Cuáles son los tiempos máximos por simulación, consulta de estado, evaluación y desembolso? | Negocio / Canales / Riesgos | Rendimiento |
| PQ-030 | ¿Cuál es la concurrencia pico esperada durante campañas, además del factor de cinco mencionado? | Canales / Operaciones | Escalabilidad |
| PQ-031 | ¿Cuáles son RTO y RPO por componente y proceso? | Continuidad / Operaciones | Recuperación |
| PQ-032 | ¿Qué estándares de accesibilidad, navegadores y versiones móviles deben soportarse? | Canales / UX | Compatibilidad |
| PQ-033 | ¿Qué eventos, métricas, alertas y periodo de retención requiere observabilidad? | Operaciones / Canales / Riesgos | Monitoreo |
| PQ-034 | ¿Qué controles de cifrado, enmascaramiento, DLP, segregación y auditoría son obligatorios? | Seguridad / Cumplimiento | Seguridad |

## Validaciones por stakeholder

### CEO / Sponsor

- alcance real del MVP de cuatro meses;
- resultados y métricas objetivo;
- aceptación del enfoque incremental por clientes existentes con ingresos recurrentes.

### Riesgos de Crédito

- catálogo de reglas y estados de decisión;
- criterios de revisión manual;
- matriz de excepciones;
- datos, scores y fuentes utilizados;
- contenido interno y externo de motivos;
- umbral y controles de IA.

### Canales Digitales

- journey y estados visibles;
- continuidad omnicanal;
- mensajes, notificaciones y preferencias;
- accesibilidad y eventos analíticos.

### Cumplimiento, Legal y Seguridad

- autorizaciones y consentimiento;
- privacidad, retención y minimización;
- acceso por rol;
- uso de IA y transferencia de datos;
- evidencias contractuales y de auditoría.

### Operaciones y Core bancario

- aceptación contractual;
- solicitud y confirmación de desembolso;
- reintentos e idempotencia;
- recuperación ante fallas;
- RTO y RPO.

## Validaciones del prototipo Figma

El prototipo es deliberadamente preliminar. Debe validarse:

1. orden de pasos del journey;
2. datos que se muestran y pueden editarse;
3. texto de autorización;
4. estados y mensajes al cliente;
5. datos visibles para asesor, analista y supervisor;
6. acciones permitidas por rol;
7. prioridad y contenido de la bandeja manual;
8. visualización de trazabilidad;
9. manejo de errores y reintentos;
10. accesibilidad.
