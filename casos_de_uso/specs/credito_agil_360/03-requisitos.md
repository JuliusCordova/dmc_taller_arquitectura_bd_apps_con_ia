# Requisitos funcionales y no funcionales

## Requisitos funcionales

| ID | Requisito | Prioridad | Fuente |
|---|---|---|---|
| RF-01 | Crear y recuperar una solicitud mediante identificador único entre canales autenticados | MVP | CEO/Canales |
| RF-02 | Diferenciar solicitud nueva de reintento y aplicar idempotencia | MVP | Riesgos/Canales |
| RF-03 | Permitir oferta o simulación de crédito personal | MVP | Canales |
| RF-04 | Precargar datos disponibles/vigentes y permitir confirmar o actualizar | MVP | CEO/Canales |
| RF-05 | Capturar autorización versionada para consultas | MVP | Canales; detalle por Legal |
| RF-06 | Solicitar y recibir documentos solo cuando correspondan | MVP | Riesgos/Canales |
| RF-07 | Extraer campos con documento origen y confianza, sin completar ausencias | Por decidir en MVP | CEO/Riesgos |
| RF-08 | Consultar identidad, ingresos, comportamiento interno, endeudamiento, alertas, score y exposición | MVP | Riesgos |
| RF-09 | Ejecutar reglas con versión y vigencia por campaña/segmento | MVP | CEO/Riesgos |
| RF-10 | Emitir aprobado, rechazado, observado o revisión manual con razones internas | MVP | Riesgos |
| RF-11 | Enrutar casos manuales y gestionar excepciones con segregación | MVP | Riesgos |
| RF-12 | Presentar estados del cliente, acciones pendientes y línea de tiempo | MVP | CEO/Canales |
| RF-13 | Enviar notificaciones seguras según preferencias permitidas | MVP | Canales |
| RF-14 | Generar/disponibilizar contrato, capturar aceptación y conservar versión | MVP | Canales |
| RF-15 | Solicitar y registrar desembolso idempotente | MVP | CEO/Riesgos |
| RF-16 | Registrar incidencia desde contact center sin cambiar decisión | MVP | Canales |
| RF-17 | Reprocesar integraciones fallidas sin perder progreso ni duplicar efectos | MVP | Riesgos/Canales |
| RF-18 | Emitir eventos de recorrido y métricas de negocio con minimización de datos | MVP | CEO/Canales |
| RF-19 | Reconstruir una decisión histórica inmutable | MVP | Riesgos |

## Reglas de negocio confirmadas

- RN-01: el MVP atiende créditos personales de clientes existentes con ingresos recurrentes.
- RN-02: la decisión crediticia se rige por políticas controladas y auditables; la IA no decide.
- RN-03: una decisión histórica no cambia aunque cambien datos maestros posteriores.
- RN-04: la excepción debe justificarse y, según nivel, autorizarse por supervisor.
- RN-05: contact center no modifica decisiones de Riesgos.
- RN-06: notificaciones no incluyen datos sensibles.
- RN-07: evaluación y desembolso no pueden ejecutarse dos veces por reintentos.

## Requisitos no funcionales

| ID | Requisito verificable | Métrica/umbral |
|---|---|---|
| RNF-01 Trazabilidad | Correlacionar solicitud, actor, canal, datos/fuentes, reglas, score, excepciones, contrato y desembolso | 100% de decisiones; retención POR RESPONDER |
| RNF-02 Inmutabilidad | Conservar snapshot histórico de decisión y evidencias | 100%; mecanismo POR DISEÑAR |
| RNF-03 Seguridad | Cifrado, mínimo privilegio, segregación, secretos administrados y protección de datos | Estándares/algoritmos POR RESPONDER |
| RNF-04 Privacidad | Minimización, separación analítica/financiera y no duplicación innecesaria | Clasificación/retención POR RESPONDER |
| RNF-05 Disponibilidad | Operar durante campañas y aislar fallas de legados/core | Objetivo y ventana POR RESPONDER |
| RNF-06 Capacidad | Soportar 8,000 simulaciones y 1,500 solicitudes/día; hasta 5x en primeras horas de campaña | Perfil horario/concurrencia POR RESPONDER |
| RNF-07 Rendimiento | Validaciones inmediatas; no congelar interfaz ante timeout | p95/p99 por etapa POR RESPONDER |
| RNF-08 Resiliencia | Reintentos controlados, timeout, circuit breaker, cola de reproceso y DLQ propuesta | Límites y recuperación POR RESPONDER |
| RNF-09 Idempotencia | Misma clave y operación producen un único efecto | 100% en evaluación/desembolso |
| RNF-10 Accesibilidad | Lenguaje claro, formularios cortos, validaciones inmediatas y lector de pantalla | Estándar/nivel POR RESPONDER |
| RNF-11 Observabilidad | Métricas, logs y trazas correlacionadas sin exponer datos sensibles | SLO/alertas POR RESPONDER |
| RNF-12 Explicabilidad | Razones internas y mensajes externos controlados; modelo IA monitoreado | Taxonomía/umbrales POR RESPONDER |
| RNF-13 Mantenibilidad | Reglas separadas del código de canal y versionadas | Aprobación y despliegue POR RESPONDER |
| RNF-14 Compatibilidad | Diseño mobile-first y soporte web/app/canales asistidos | Matriz de dispositivos POR RESPONDER |
| RNF-15 Continuidad | No comprometer el core ni exigir migración simultánea de legados | RTO/RPO y degradación POR RESPONDER |

