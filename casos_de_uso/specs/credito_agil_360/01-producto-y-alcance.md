# Producto y alcance

## Resultado esperado

Crédito Ágil 360 unificará la originación de créditos personales para que una misma solicitud continúe entre canales, use información bancaria vigente, ejecute políticas controladas y auditables, comunique el estado y complete el desembolso sin duplicidades.

## Objetivos confirmados

- Aumentar la conversión de ofertas a desembolsos sin deteriorar la mora temprana.
- Reducir el tiempo desde solicitud hasta decisión y el abandono por etapa.
- Reducir solicitudes con intervención manual.
- Permitir cambiar reglas sin reconstruir la aplicación.
- Entregar un MVP operativo de extremo a extremo en cuatro meses para una campaña de clientes con abono de sueldo.

## Alcance

### MVP confirmado

- Crédito personal.
- Clientes existentes con ingresos recurrentes; campaña inicial de abono de sueldo.
- Inicio desde app, web, agencia o contact center y continuidad sobre una solicitud única.
- Oferta o simulación, confirmación/actualización de datos, autorización de consultas, información faltante, documentos cuando corresponda, evaluación, comunicación de estado, aceptación contractual y desembolso.
- Decisión automática, observación, revisión manual o rechazo mediante políticas versionadas.
- Gestión de excepciones con recomendación de analista y autorización de supervisor cuando corresponda.
- Notificaciones por canales permitidos sin datos sensibles.
- Auditoría completa e idempotencia de evaluación y desembolso.

### Fuera del MVP / futuro confirmado

- Clientes nuevos.
- Trabajadores independientes.
- Otros productos crediticios.

### Por decidir

- Si los cuatro canales tendrán capacidad completa en el MVP o si algunos solo continuarán/consultarán.
- Qué documentos aplican a clientes con abono de sueldo.
- Fuentes externas, contratos, tasa, reglas, umbrales, límites y SLA.

## Actores y responsabilidades

| Actor | Responsabilidad confirmada | Restricción |
|---|---|---|
| Cliente | Iniciar/continuar, confirmar o actualizar datos, autorizar, adjuntar, aceptar contrato | Debe autenticarse para recuperar la solicitud |
| Asesor autorizado | Ver el mismo estado y ayudar | Acceso mínimo necesario; no modifica decisión |
| Contact center | Consultar estado y registrar incidencia | No modifica decisión de Riesgos |
| Analista de riesgos | Revisar casos y recomendar excepción | Justifica y registra evidencia |
| Supervisor | Autorizar excepciones según nivel | Segregación de funciones |
| Motor de reglas | Aplicar políticas vigentes | Versionado, explicabilidad y auditoría |
| Sistemas internos/externos | Proveer datos y ejecutar operaciones | Pueden responder tarde o fallar |

## Hechos, propuestas e incertidumbres

| Tipo | Elemento |
|---|---|
| CONFIRMADO | Volumen normal: 8,000 simulaciones/día y 1,500 solicitudes/día; campaña hasta 5x en primeras horas |
| CONFIRMADO | La mayoría de consultas se realiza desde móvil |
| CONFIRMADO | No se debe duplicar innecesariamente información sensible ni comprometer el core |
| CONFIRMADO | La IA puede extraer y contrastar, pero no decidir crédito ni completar campos ausentes |
| PROPUESTA | Arquitectura orientada a capacidades, API y eventos, con adaptadores anticorrupción para legados |
| PROPUESTA | Procesos largos mediante orquestación persistente y eventos; validación local inmediata en canal |
| POR RESPONDER | SLA, RTO/RPO, retención, deduplicación, autenticación, umbral IA y reglas de excepción |

## Indicadores

Conversión oferta→desembolso, tiempo solicitud→decisión, abandono por etapa, mora temprana e intervención manual. Las fórmulas, ventanas, segmentos, metas y fuentes de verdad están por responder.

