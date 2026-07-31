# Banco Andino Digital — Crédito Ágil 360

## 1. Objetivo de la solución

Permitir que una persona solicite un crédito de consumo desde canales digitales, complete su identidad y documentación, reciba una evaluación trazable y obtenga una decisión o derivación a revisión humana sin repetir información.

## 2. Actores

- Cliente solicitante.
- Analista de Riesgos.
- Ejecutivo de atención.
- Administrador de producto.
- Oficial de Cumplimiento.
- Servicios externos de identidad, buró y firma.

## 3. Épicas

1. Simulación y solicitud digital.
2. Identidad y consentimiento.
3. Evaluación crediticia.
4. Revisión y decisión humana.
5. Firma y desembolso.
6. Trazabilidad y operación.

## 4. Historias de usuario

### HU-BAN-01 — Simular crédito

**Como** cliente potencial, **quiero** simular monto, plazo y cuota, **para** evaluar una alternativa antes de iniciar la solicitud.

**Requisitos funcionales asociados:** RF-BAN-01, RF-BAN-02.

**Criterios de aceptación**

- **Dado** un monto y plazo válidos, **cuando** el cliente solicita una simulación, **entonces** el sistema muestra cuota estimada, tasa referencial, costo total y vigencia.
- **Dado** un valor fuera de los rangos permitidos, **cuando** se intenta simular, **entonces** se informa el rango aceptado sin perder los demás datos.
- La simulación puede guardarse y recuperarse mediante un enlace seguro durante 24 horas.

### HU-BAN-02 — Iniciar solicitud sin duplicados

**Como** cliente, **quiero** iniciar o retomar una solicitud, **para** continuar desde cualquier canal sin registrar una segunda operación.

**Requisitos funcionales asociados:** RF-BAN-03, RF-BAN-04, RF-BAN-05.

**Criterios de aceptación**

- El sistema asigna un identificador único e idempotente a cada solicitud.
- Si existe una solicitud activa para el mismo cliente y producto, se ofrece retomarla.
- El progreso se conserva por etapa y se sincroniza entre web, móvil y atención asistida.

### HU-BAN-03 — Validar identidad y consentimiento

**Como** cliente, **quiero** validar mi identidad y autorizar el uso de mis datos, **para** continuar de forma segura y transparente.

**Requisitos funcionales asociados:** RF-BAN-06, RF-BAN-07, RF-BAN-08.

**Criterios de aceptación**

- La identidad se valida con documento, prueba de vida y factor de posesión.
- El consentimiento registra versión del texto, fecha, canal, propósito y evidencia.
- Tres fallos consecutivos bloquean temporalmente el intento y generan una alerta.

### HU-BAN-04 — Adjuntar y validar documentos

**Como** cliente, **quiero** adjuntar documentos y conocer su estado, **para** corregirlos antes de la evaluación.

**Requisitos funcionales asociados:** RF-BAN-09, RF-BAN-10.

**Criterios de aceptación**

- Se aceptan formatos y tamaños configurados por producto.
- Cada archivo pasa por antivirus, clasificación, extracción y validación básica.
- Un documento observado muestra la causa y permite reemplazarlo sin reiniciar la solicitud.

### HU-BAN-05 — Obtener decisión explicable

**Como** analista de Riesgos, **quiero** ejecutar reglas y modelos con evidencias, **para** tomar decisiones consistentes y auditables.

**Requisitos funcionales asociados:** RF-BAN-11, RF-BAN-12, RF-BAN-13, RF-BAN-14.

**Criterios de aceptación**

- La evaluación conserva datos de entrada, versiones de reglas/modelos, resultado y motivos.
- Las fuentes externas se consultan una sola vez por ventana configurable, salvo autorización de reintento.
- Los casos fuera de política se rechazan; los casos ambiguos se derivan a revisión manual.
- El cliente recibe una explicación comprensible sin revelar lógica sensible antifraude.

### HU-BAN-06 — Revisar excepciones

**Como** analista, **quiero** gestionar una bandeja priorizada de excepciones, **para** resolver casos que requieren criterio humano.

**Requisitos funcionales asociados:** RF-BAN-15, RF-BAN-16, RF-BAN-17.

**Criterios de aceptación**

- La bandeja permite filtrar por antigüedad, riesgo, monto y motivo.
- Toda decisión manual exige motivo, comentario y usuario responsable.
- La reasignación conserva historial y no altera la evidencia original.

### HU-BAN-07 — Firmar y desembolsar

**Como** cliente aprobado, **quiero** revisar condiciones, firmar y recibir el desembolso, **para** completar el crédito digitalmente.

**Requisitos funcionales asociados:** RF-BAN-18, RF-BAN-19, RF-BAN-20.

**Criterios de aceptación**

- Las condiciones finales deben coincidir con la aprobación vigente.
- La firma genera evidencia verificable y documento inmutable.
- El desembolso es idempotente y su resultado se comunica al cliente.

### HU-BAN-08 — Auditar el ciclo completo

**Como** oficial de Cumplimiento, **quiero** consultar la línea de tiempo de una solicitud, **para** demostrar quién hizo qué, cuándo y con qué información.

**Requisitos funcionales asociados:** RF-BAN-21, RF-BAN-22.

**Criterios de aceptación**

- La línea de tiempo integra eventos de canales, reglas, personas e integraciones.
- Los eventos de auditoría no pueden modificarse desde funciones operativas.
- La búsqueda admite identificador de solicitud, cliente y rango de fechas según permisos.

## 5. Requisitos funcionales

| ID | Requisito |
|---|---|
| RF-BAN-01 | Configurar productos, montos, plazos, tasas y vigencias. |
| RF-BAN-02 | Calcular y presentar simulaciones con desglose de costos. |
| RF-BAN-03 | Crear una solicitud con identificador único. |
| RF-BAN-04 | Detectar solicitudes activas potencialmente duplicadas. |
| RF-BAN-05 | Guardar y reanudar progreso omnicanal. |
| RF-BAN-06 | Validar identidad con proveedores configurables. |
| RF-BAN-07 | Ejecutar prueba de vida y segundo factor. |
| RF-BAN-08 | Versionar y registrar consentimientos. |
| RF-BAN-09 | Cargar, reemplazar y consultar documentos. |
| RF-BAN-10 | Validar seguridad, tipo, legibilidad y consistencia documental. |
| RF-BAN-11 | Consultar fuentes internas y externas de riesgo. |
| RF-BAN-12 | Ejecutar reglas y modelos versionados. |
| RF-BAN-13 | Registrar motivos y evidencias de la decisión. |
| RF-BAN-14 | Clasificar el resultado en aprobado, rechazado o revisión. |
| RF-BAN-15 | Presentar bandeja de excepciones priorizada. |
| RF-BAN-16 | Permitir decisión manual con segregación de funciones. |
| RF-BAN-17 | Mantener historial de asignaciones y decisiones. |
| RF-BAN-18 | Generar contrato con condiciones aprobadas. |
| RF-BAN-19 | Integrar firma electrónica y custodiar evidencias. |
| RF-BAN-20 | Ordenar el desembolso de forma idempotente. |
| RF-BAN-21 | Registrar eventos inmutables del ciclo de vida. |
| RF-BAN-22 | Consultar expediente y línea de tiempo según permisos. |

## 6. Requisitos no funcionales

| ID | Categoría | Requisito medible |
|---|---|---|
| RNF-BAN-01 | Disponibilidad | 99.9% mensual para solicitud y consulta; degradación controlada ante proveedores externos. |
| RNF-BAN-02 | Rendimiento | p95 menor a 2 s en operaciones internas y menor a 8 s en evaluación sin contar esperas externas. |
| RNF-BAN-03 | Seguridad | Cifrado en tránsito y reposo, MFA para usuarios internos y mínimo privilegio. |
| RNF-BAN-04 | Privacidad | Minimización, propósito, retención configurable y atención de derechos del titular. |
| RNF-BAN-05 | Auditoría | Eventos críticos inmutables, correlacionados y conservados por el periodo normativo. |
| RNF-BAN-06 | Resiliencia | Reintentos con backoff, circuit breaker e idempotencia en firma y desembolso. |
| RNF-BAN-07 | Escalabilidad | Soportar 10 veces la carga promedio sin rediseño estructural. |
| RNF-BAN-08 | Accesibilidad | Cumplir WCAG 2.2 AA en la experiencia digital. |
| RNF-BAN-09 | Observabilidad | Métricas, logs, trazas y alertas por etapa, proveedor y regla. |
| RNF-BAN-10 | Explicabilidad | Toda decisión automatizada debe conservar motivos de negocio comprensibles y versión técnica. |

## 7. Diseño de solución en Figma

Archivo maestro: [DMC Taller — Casos de uso](https://www.figma.com/design/HZaI8Iec3Qm77zfvQAa1Nk)

### Pantallas propuestas

1. Dashboard de inicio y simulador.
2. Flujo guiado de solicitud con stepper.
3. Identidad, consentimiento y carga documental.
4. Resultado de evaluación y próximos pasos.
5. Bandeja del analista con filtros y SLA.
6. Expediente 360 con evidencia y línea de tiempo.

### Trazabilidad pantalla–historias

| Pantalla | Historias |
|---|---|
| Simulador | HU-BAN-01 |
| Solicitud guiada | HU-BAN-02, HU-BAN-03, HU-BAN-04 |
| Resultado | HU-BAN-05, HU-BAN-07 |
| Bandeja de Riesgos | HU-BAN-06 |
| Expediente 360 | HU-BAN-05, HU-BAN-08 |
