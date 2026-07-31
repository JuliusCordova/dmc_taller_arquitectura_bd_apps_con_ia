# Seguros Horizonte — Siniestro Fácil

## 1. Objetivo

Permitir que un asegurado registre un siniestro, adjunte evidencias, reciba seguimiento transparente y obtenga resolución ágil, combinando automatización con revisión humana y controles antifraude.

## 2. Actores

Asegurado, ajustador, analista de Siniestros, investigador de Fraude, proveedor externo, supervisor y auditor.

## 3. Épicas

1. Registro del siniestro.
2. Evidencias y cobertura.
3. Triage y fraude.
4. Inspección y ajuste.
5. Resolución y pago.
6. Trazabilidad operativa.

## 4. Historias de usuario

### HU-SEG-01 — Registrar un siniestro
**Como** asegurado, **quiero** reportar el evento desde el móvil, **para** iniciar la atención sin ir a una oficina.

**Criterios de aceptación**
- Se genera un número único de siniestro y acuse inmediato.
- El formulario se adapta al tipo de póliza y evento.
- El usuario puede guardar y continuar luego sin duplicar el caso.

### HU-SEG-02 — Verificar cobertura
**Como** analista, **quiero** validar póliza, vigencia, coberturas y deducible, **para** determinar si el evento puede atenderse.

**Criterios de aceptación**
- La verificación conserva versión de póliza y reglas aplicadas.
- Una inconsistencia deriva el caso a revisión, no lo elimina.
- El cliente recibe una explicación comprensible del resultado.

### HU-SEG-03 — Adjuntar evidencias
**Como** asegurado, **quiero** cargar fotos, videos y documentos, **para** sustentar el siniestro.

**Criterios de aceptación**
- El sistema valida formato, tamaño, malware, calidad y metadatos disponibles.
- Se informa qué evidencia falta o debe repetirse.
- Cada reemplazo conserva trazabilidad de versiones.

### HU-SEG-04 — Priorizar automáticamente
**Como** supervisor de Siniestros, **quiero** clasificar severidad, urgencia y complejidad, **para** asignar recursos y cumplir SLA.

**Criterios de aceptación**
- El triage genera prioridad, ruta sugerida y motivos.
- Eventos críticos generan alerta inmediata.
- El supervisor puede modificar la prioridad dejando justificación.

### HU-SEG-05 — Detectar señales de fraude
**Como** investigador, **quiero** visualizar alertas y relaciones relevantes, **para** investigar casos sospechosos sin frenar los legítimos.

**Criterios de aceptación**
- Las señales muestran fuente, peso, fecha y explicación operativa.
- Una alerta no rechaza automáticamente el siniestro.
- El acceso a información sensible queda restringido y auditado.

### HU-SEG-06 — Gestionar inspección
**Como** ajustador, **quiero** agendar, ejecutar y documentar la inspección, **para** emitir una recomendación sustentada.

**Criterios de aceptación**
- Se asigna ajustador según zona, especialidad y disponibilidad.
- El informe incluye evidencias, estimación y firma del responsable.
- Los cambios posteriores generan una nueva versión.

### HU-SEG-07 — Aprobar y pagar
**Como** analista, **quiero** emitir resolución y ordenar el pago, **para** cerrar el siniestro de forma controlada.

**Criterios de aceptación**
- La resolución exige cobertura, monto, deducible y autorización según umbral.
- El pago es idempotente y conciliable.
- El cliente recibe resolución, monto, fecha y canal de pago.

### HU-SEG-08 — Consultar seguimiento
**Como** asegurado, **quiero** ver el estado y próximos pasos, **para** saber qué ocurre sin llamar al contact center.

**Criterios de aceptación**
- La línea de tiempo presenta hitos en lenguaje sencillo.
- Las tareas pendientes indican responsable y fecha objetivo.
- No se exponen señales antifraude ni notas internas.

## 5. Requisitos funcionales

| ID | Requisito |
|---|---|
| RF-SEG-01 | Crear siniestros con identificador único e idempotencia. |
| RF-SEG-02 | Adaptar formularios por producto, cobertura y evento. |
| RF-SEG-03 | Validar póliza, vigencia, cobertura, exclusiones y deducible. |
| RF-SEG-04 | Gestionar carga, versión y clasificación de evidencias. |
| RF-SEG-05 | Ejecutar controles de seguridad y calidad sobre archivos. |
| RF-SEG-06 | Clasificar severidad, urgencia y complejidad. |
| RF-SEG-07 | Calcular SLA y ruta operativa sugerida. |
| RF-SEG-08 | Ejecutar reglas/modelos antifraude versionados. |
| RF-SEG-09 | Mostrar señales explicables y relaciones relevantes. |
| RF-SEG-10 | Crear y gestionar investigaciones separadas del expediente visible al cliente. |
| RF-SEG-11 | Asignar ajustadores por reglas configurables. |
| RF-SEG-12 | Agendar inspecciones y notificar participantes. |
| RF-SEG-13 | Registrar informes, estimaciones y evidencias de inspección. |
| RF-SEG-14 | Gestionar reservas y cambios con historial. |
| RF-SEG-15 | Emitir resolución con niveles de autorización. |
| RF-SEG-16 | Generar orden de pago idempotente. |
| RF-SEG-17 | Mantener línea de tiempo operativa y vista simplificada para cliente. |
| RF-SEG-18 | Registrar auditoría inmutable de decisiones y accesos. |

## 6. Requisitos no funcionales

| ID | Categoría | Requisito medible |
|---|---|---|
| RNF-SEG-01 | Disponibilidad | 99.9% mensual para registro y seguimiento de siniestros. |
| RNF-SEG-02 | Rendimiento | p95 menor a 2 s en consulta y menor a 10 s en triage automático. |
| RNF-SEG-03 | Seguridad | Cifrado, MFA interno, segregación de funciones y acceso por necesidad. |
| RNF-SEG-04 | Privacidad | Separar datos operativos, médicos y antifraude con políticas específicas. |
| RNF-SEG-05 | Evidencia | Archivos con hash, versión, origen y cadena de custodia. |
| RNF-SEG-06 | Resiliencia | Operación degradada y reintentos controlados ante integraciones externas. |
| RNF-SEG-07 | Escalabilidad | Absorber picos de catástrofe de 20 veces el volumen promedio. |
| RNF-SEG-08 | Accesibilidad | WCAG 2.2 AA y experiencia móvil prioritaria. |
| RNF-SEG-09 | Observabilidad | Métricas por etapa, SLA, proveedor, error y señal antifraude. |
| RNF-SEG-10 | Explicabilidad | Triage y fraude deben conservar motivos comprensibles y versión técnica. |

## 7. Diseño en Figma

Archivo: [DMC Taller — Casos de uso](https://www.figma.com/design/HZaI8Iec3Qm77zfvQAa1Nk)

### Pantallas
1. Inicio y selección de póliza.
2. Registro guiado del siniestro.
3. Captura de evidencias desde móvil.
4. Seguimiento del asegurado.
5. Bandeja operativa con prioridad y SLA.
6. Expediente de ajuste y panel antifraude.

| Pantalla | Historias |
|---|---|
| Registro guiado | HU-SEG-01, HU-SEG-02 |
| Evidencias | HU-SEG-03 |
| Seguimiento | HU-SEG-08 |
| Bandeja operativa | HU-SEG-04, HU-SEG-06 |
| Expediente y fraude | HU-SEG-05, HU-SEG-07 |
