# Plan vivo de desarrollo SDD — Crédito Ágil 360

## Propósito

Este documento organiza la evolución de la solución durante el curso. Se actualizará al cierre de cada sesión con:

- decisiones tomadas;
- evidencias producidas;
- preguntas resueltas;
- riesgos nuevos;
- cambios de alcance;
- artefactos versionados;
- criterios de aceptación cubiertos.

No representa un cronograma contractual. Es el backlog maestro de aprendizaje y construcción.

## Flujo SDD del proyecto

Entrevistas → Specification → Diseño UX → Modelo conceptual → Modelo lógico → Modelo físico → Datos sintéticos → Base de datos → Backend → API → Pruebas → Optimización → Cloud → Seguridad → Release → Evidencias.

## Definition of Ready por incremento

Un incremento puede entrar a construcción cuando:

1. tiene historia y requisito vinculados;
2. sus reglas están confirmadas o marcadas como supuesto aprobado;
3. tiene criterios de aceptación verificables;
4. identifica datos de entrada y salida;
5. registra dependencias e integraciones;
6. no depende de una pregunta crítica sin resolver;
7. actualiza la trazabilidad de la Specification.

## Definition of Done por incremento

Un incremento está terminado cuando:

1. cumple sus criterios de aceptación;
2. tiene pruebas y evidencia;
3. registra cambios en la Specification;
4. actualiza modelos de datos y contratos cuando corresponde;
5. no introduce datos sensibles reales en ambientes de práctica;
6. conserva trazabilidad hacia historia, requisito y regla;
7. documenta decisiones y deuda pendiente.

---

# Roadmap por sesión

## Sesión 1 — Discovery y visión

### Objetivo

Comprender el problema, stakeholders, resultados esperados y restricciones.

### Artefactos

- entrevistas;
- Business Vision Canvas;
- hechos, supuestos y preguntas;
- primera delimitación del caso.

### Estado

Completado.

---

## Sesión 2 — Specification Engineering

### Objetivo

Convertir entrevistas en los 12 bloques de la DMC Application Specification.

### Artefactos

- Specification v0.2-draft;
- historias de usuario;
- requisitos funcionales;
- requisitos no funcionales;
- reglas de negocio;
- criterios de aceptación;
- preguntas abiertas;
- prototipo preliminar Figma;
- plan vivo de desarrollo.

### Estado

En validación.

### Gate de salida

Los 12 bloques deben estar completos al nivel de evidencia disponible y toda ausencia debe convertirse en pregunta.

---

## Sesión 3 — Modelo conceptual de datos

### Objetivo

Traducir actores, procesos, sustantivos, eventos y reglas en conceptos de negocio y relaciones, sin decidir todavía tablas ni tecnología.

### Actividades

- identificar entidades conceptuales;
- definir significado y límites de cada concepto;
- identificar relaciones y cardinalidades preliminares;
- separar datos maestros, transaccionales, documentales y de auditoría;
- identificar eventos del dominio;
- relacionar entidades con historias y requisitos;
- validar el modelo con Riesgos, Canales y Operaciones.

### Artefactos

- `data_models/01_conceptual_model.md`;
- diagrama conceptual;
- glosario de negocio;
- catálogo preliminar de entidades;
- matriz entidad ↔ historia ↔ requisito;
- preguntas de datos abiertas.

### Gate de salida

Cada entidad debe tener definición, fuente, propósito y relación con al menos una capacidad de negocio.

---

## Sesión 4 — Modelo lógico de datos

### Objetivo

Transformar el modelo conceptual en una estructura lógica independiente del motor físico.

### Actividades

- definir atributos;
- identificar claves naturales y candidatas;
- definir relaciones y cardinalidades;
- normalizar hasta el nivel requerido;
- modelar historial de decisiones y versionado de reglas;
- modelar idempotencia y correlación;
- definir dominios, obligatoriedad y restricciones lógicas;
- separar datos operativos, analíticos y evidencias.

### Artefactos

- `data_models/02_logical_model.md`;
- diagrama lógico;
- diccionario lógico;
- catálogo de claves y restricciones;
- reglas de integridad;
- decisiones de normalización y desnormalización pendientes.

### Gate de salida

El modelo lógico debe soportar historias y criterios prioritarios sin depender todavía de sintaxis específica de base de datos.

---

## Sesión 5 — Modelo físico y estrategia de persistencia

### Objetivo

Convertir el modelo lógico en una propuesta física alineada con el motor y patrones de acceso seleccionados.

### Actividades

- seleccionar motor o motores con criterios explícitos;
- definir tablas, columnas, tipos y claves;
- definir índices y restricciones;
- diseñar tablas de auditoría e historial;
- diseñar idempotency keys y correlación;
- definir estrategia documental;
- definir particionamiento, retención y archivado como decisiones pendientes o aprobadas;
- preparar migraciones iniciales.

### Artefactos

- `data_models/03_physical_model.md`;
- diagrama físico;
- diccionario físico;
- DDL inicial;
- migración `V001`;
- decisiones de índices y almacenamiento;
- ADR de persistencia.

### Gate de salida

El esquema debe implementar las restricciones lógicas y permitir generar datos sintéticos sin información real.

---

## Sesión 6 — Datos sintéticos

### Objetivo

Crear datos de prueba seguros, consistentes y trazables que representen escenarios funcionales sin utilizar información personal real.

### Actividades

- definir perfiles y distribuciones sintéticas;
- crear escenarios aprobados, rechazados, observados y manuales;
- crear documentos y extracciones simuladas;
- generar reintentos, duplicados e integraciones fallidas;
- generar historial de decisiones, reglas y excepciones;
- crear datos para accesibilidad, analítica y rendimiento;
- validar integridad referencial y reglas;
- separar datasets de demo, pruebas y rendimiento.

### Artefactos

- `synthetic_data/00_strategy.md`;
- `synthetic_data/01_data_catalog.md`;
- scripts generadores reproducibles;
- semillas controladas;
- dataset mínimo funcional;
- dataset de casos borde;
- dataset de carga;
- reporte de validación de datos.

### Gate de salida

Los datos deben ser completamente sintéticos, reproducibles, sin PII real y cubrir los criterios de aceptación prioritarios.

---

## Sesión 7 — Base de datos y CRUD

### Objetivo

Construir el esquema físico y operaciones básicas de persistencia.

### Actividades

- ejecutar migraciones;
- cargar datos sintéticos;
- implementar CRUD de entidades prioritarias;
- probar restricciones e idempotencia;
- registrar auditoría básica;
- validar consultas principales.

### Artefactos

- base de datos local o de laboratorio;
- scripts de migración;
- repositorios de acceso a datos;
- pruebas de persistencia;
- evidencias de integridad.

---

## Sesión 8 — Backend y reglas de aplicación

### Objetivo

Implementar servicios de aplicación trazables a historias y requisitos.

### Incremento sugerido

- crear solicitud;
- recuperar solicitud;
- confirmar datos;
- registrar estado;
- gestionar documentos simulados.

### Artefactos

- servicios y casos de uso;
- validaciones;
- manejo de errores;
- pruebas unitarias;
- actualización de Specification.

---

## Sesión 9 — API y contratos

### Objetivo

Exponer capacidades mediante contratos versionados.

### Actividades

- definir endpoints o comandos;
- definir DTO y errores;
- correlación e idempotencia;
- documentación OpenAPI o equivalente;
- pruebas contractuales;
- alineación con prototipo Figma.

### Artefactos

- contratos de API;
- ejemplos con datos sintéticos;
- pruebas de contrato;
- matriz pantalla ↔ API ↔ historia.

---

## Sesión 10 — Flujo end-to-end inicial

### Objetivo

Completar un recorrido vertical desde simulación hasta estado de evaluación usando integraciones simuladas.

### Alcance sugerido

- oferta o simulación;
- solicitud única;
- confirmación de datos;
- evaluación simulada con reglas versionadas;
- resultado y estado;
- trazabilidad mínima.

### Gate

Demostración end-to-end con evidencias y criterios de aceptación.

---

## Sesión 11 — Medición y diagnóstico

### Objetivo

Establecer línea base de rendimiento y comportamiento.

### Artefactos

- métricas de consultas y API;
- planes de ejecución;
- trazas;
- escenarios de carga sintética;
- informe de cuellos de botella.

---

## Sesión 12 — Optimización

### Objetivo

Optimizar consultas, índices, modelo físico y código con evidencia antes/después.

### Artefactos

- cambios de índices y consultas;
- comparación de métricas;
- ADR de optimización;
- pruebas de regresión.

---

## Sesión 13 — Escalabilidad y resiliencia

### Objetivo

Diseñar y probar reintentos, idempotencia, concurrencia y fallas de integración.

### Escenarios

- doble envío;
- timeout de consulta;
- respuesta tardía;
- desembolso con resultado incierto;
- campaña con pico de tráfico;
- reproceso seguro.

---

## Sesión 14 — NoSQL y documentos

### Objetivo

Evaluar y, si corresponde, implementar persistencia documental para evidencias, metadatos o eventos.

### Regla

No adoptar NoSQL por preferencia tecnológica; debe justificarse por patrón de acceso y requerimiento.

---

## Sesión 15 — Arquitectura cloud y ambientes

### Objetivo

Desplegar componentes administrados y separar configuración por ambiente.

### Artefactos

- arquitectura de despliegue;
- ambientes;
- secretos;
- observabilidad inicial;
- costos referenciales;
- ADR cloud.

---

## Sesión 16 — CI/CD y release

### Objetivo

Automatizar validaciones, migraciones, pruebas y despliegue.

### Artefactos

- pipeline;
- quality gates;
- migraciones automatizadas;
- release notes;
- rollback documentado.

---

## Sesión 17 — Seguridad de aplicación y datos

### Objetivo

Aplicar identidad, autorización, protección de datos, secretos y pruebas de vulnerabilidad.

### Artefactos

- threat model;
- matriz de roles;
- controles de mínimo privilegio;
- cifrado y secretos;
- pruebas de seguridad;
- evidencia de segregación.

---

## Sesión 18 — Auditoría, backups y recuperación

### Objetivo

Validar trazabilidad, respaldo, restauración y respuesta ante incidentes.

### Artefactos

- auditoría de decisiones;
- política de backup propuesta;
- prueba de restauración;
- RTO/RPO validados o pendientes;
- runbook de incidente.

---

## Sesión 19 — Release integrador y defensa

### Objetivo

Presentar una solución trazable desde entrevista hasta producto funcional.

### Entregables finales

- Specification final versionada;
- modelo conceptual;
- modelo lógico;
- modelo físico;
- datasets sintéticos y generadores;
- aplicación y API;
- pruebas y evidencias;
- despliegue;
- seguridad y observabilidad;
- decisiones de arquitectura;
- backlog y preguntas restantes;
- demo y defensa ejecutiva.

---

# Tablero de estado

| Artefacto | Versión | Estado | Próxima actualización |
|---|---|---|---|
| Entrevistas | 1.0 | Completado | Cuando exista nueva evidencia |
| Specification | 0.2-draft | En validación | Sesión 2 / validación stakeholders |
| Historias | 0.1 | En validación | Refinamiento continuo |
| Requisitos | 0.1 | En validación | Cada sesión |
| Criterios | 0.1 | En validación | Al crear pruebas |
| Figma | Preliminar | En validación | Después de feedback UX |
| Modelo conceptual | No iniciado | Pendiente | Sesión 3 |
| Modelo lógico | No iniciado | Pendiente | Sesión 4 |
| Modelo físico | No iniciado | Pendiente | Sesión 5 |
| Datos sintéticos | No iniciado | Pendiente | Sesión 6 |
| Base de datos | No iniciado | Pendiente | Sesión 7 |
| Backend | No iniciado | Pendiente | Sesión 8 |
| API | No iniciado | Pendiente | Sesión 9 |
| Release end-to-end | No iniciado | Pendiente | Sesión 10 en adelante |

# Registro de actualización por sesión

Al cierre de cada sesión agregar una entrada con:

```text
Fecha:
Sesión:
Versión de Specification:
Artefactos creados o modificados:
Decisiones:
Preguntas resueltas:
Preguntas nuevas:
Riesgos:
Criterios cubiertos:
Próximo incremento:
```
