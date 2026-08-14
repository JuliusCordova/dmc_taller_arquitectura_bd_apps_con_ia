# Arquitectura y datos — propuesta preliminar

Esta sección es **PROPUESTA**, no una selección tecnológica aprobada.

## Principios

- Solicitud única como agregado de proceso y correlación omnicanal.
- Separación entre experiencia, orquestación, decisión, documentos, contratos y desembolso.
- Políticas versionadas fuera de los canales.
- Snapshots de decisión inmutables; datos maestros referenciados y no copiados sin necesidad.
- Adaptadores para legados/core; evolución incremental.
- Comandos idempotentes y eventos trazables.

## Contextos/capacidades

| Capacidad | Responsabilidad | Datos principales |
|---|---|---|
| Canales/BFF | Experiencia móvil/web/asistida, validación superficial | Sesión, vista, preferencias |
| Originación | Ciclo de solicitud, continuidad, estados, pendientes | Solicitud, canal, estado |
| Cliente/Consentimiento | Referencias a maestro, confirmación/actualización, autorizaciones | Cliente ref., consentimiento |
| Documentos | Carga, seguridad, metadatos, extracción y confianza | Documento, campos extraídos |
| Integración de datos | Adaptadores internos/externos y normalización | Respuestas, fuente, vigencia |
| Decisión | Score, reglas versionadas, razones, snapshot | Evaluación, decisión, versión |
| Trabajo manual | Bandeja, revisión, excepción y autorización | Tarea, justificación, aprobador |
| Contrato | Documento contractual y evidencia de aceptación | Contrato/version/aceptación |
| Desembolso | Comando idempotente, resultado y conciliación | Operación, clave, referencia core |
| Notificaciones | Preferencias, plantillas y envío seguro | Evento, plantilla, entrega |
| Auditoría/Observabilidad | Evidencia, métricas, trazas y eventos de recorrido | Audit log, telemetría |

## Flujo propuesto

1. Canal autentica y solicita iniciar/continuar.
2. Originación resuelve deduplicación y devuelve la solicitud única.
3. Cliente confirma datos y consentimiento.
4. Orquestador consulta fuentes mediante adaptadores; fallas transitorias pasan a reproceso.
5. Decisión crea snapshot, aplica score/reglas vigentes y emite resultado.
6. Casos requeridos crean tarea manual/excepción; el resto continúa.
7. Cliente recibe estado/acción, revisa condiciones y acepta contrato.
8. Desembolso envía comando idempotente al core y registra resultado.

## Síncrono vs. asíncrono

| Operación | Propuesta | Justificación |
|---|---|---|
| Validación de formulario y recuperación | Síncrona | Respuesta inmediata al usuario |
| Creación/continuación idempotente | Síncrona con persistencia | Identidad del proceso antes de avanzar |
| Consultas rápidas indispensables | Síncrona con timeout | Decisión inmediata cuando sea posible |
| Consultas lentas/no disponibles | Asíncrona y reprocesable | No congelar ni perder progreso |
| Evaluación | Síncrona si dependencias listas; asíncrona en caso contrario | Soportar preaprobados y degradación |
| Documentos/IA | Asíncrona | Latencia variable y revisión por confianza |
| Notificaciones/analítica | Asíncrona | Desacoplar del camino crítico |
| Desembolso | Comando persistido + integración idempotente | Evitar doble efecto y tolerar timeout |

## Datos maestros y transaccionales

| Tipo | Datos | Tratamiento propuesto |
|---|---|---|
| Maestro/referencia | Identidad, contacto, dirección, empleo, cuentas, productos | Referenciar sistema de registro; cache/replica solo con vigencia y propósito aprobados |
| Transaccional | Solicitud, simulación, consentimiento, documento, evaluación, decisión, excepción, contrato, desembolso, notificación | Persistencia propia con correlación y auditoría |
| Snapshot de decisión | Valores exactos y procedencia usados, regla/score/versiones | Inmutable; no se reescribe por cambios maestros |
| Analítica | Eventos de etapa, error, abandono, latencia y conversión | Seudonimizar/minimizar; separar de información financiera |

## Estados

El modelo interno detallado está POR DISEÑAR. La vista externa confirmada incluye: borrador, información pendiente, en evaluación, requiere documento, requiere validación, aprobado, no aprobado, pendiente de aceptación, listo para desembolso, desembolsado y cancelado. Toda transición debe registrar actor/origen, tiempo, causa y correlación.

## IA y agentes

- Usos permitidos: extracción documental, detección de inconsistencias, orientación y resumen para analista.
- Prohibido: inventar campos o sustituir políticas controladas en la decisión.
- Salida documental: valor, confianza, referencia exacta al documento/modelo/versión.
- Debe existir revisión humana bajo un umbral POR RESPONDER, monitoreo, responsable, límites, evaluación y reversión.
- Cualquier agente debe operar con herramientas limitadas, autorización explícita, registro de acciones y sin autoridad para aprobar o desembolsar por sí mismo.

## Contratos por especificar antes de construir

OpenAPI/eventos, esquema de solicitud y snapshot, catálogo/versionado de reglas, taxonomía de razones, máquina de estados, claves de idempotencia, timeout/reintentos, contrato del core, seguridad/autenticación y política de datos.

