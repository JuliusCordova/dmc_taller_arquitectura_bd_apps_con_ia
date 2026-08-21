# Sílabo del programa

## Arquitectura y Bases de Datos con IA para Aplicaciones Modernas

## 1. Información general

- **Duración total:** 57 horas cronológicas.
- **Número de sesiones:** 19.
- **Duración por sesión:** 3 horas.
- **Modalidad:** teórico-práctica.
- **Metodología principal:** Spec-Driven Development con asistencia de IA.
- **Framework de prompting:** ATLAS.
- **Plataforma cloud de referencia:** Google Cloud.
- **Proyecto integrador:** aplicación moderna desarrollada de manera incremental.

## 2. Descripción

El programa desarrolla las capacidades necesarias para diseñar, implementar, optimizar, desplegar y asegurar la arquitectura de datos y la base de datos de aplicaciones modernas con apoyo de inteligencia artificial.

El participante recorrerá el ciclo completo: comprensión del negocio, especificación, prompt engineering, modelado conceptual, lógico y físico, implementación relacional y documental, construcción de backend, arquitectura de software, pruebas, optimización, observabilidad, integración asíncrona, despliegue cloud, seguridad, resiliencia y presentación de evidencias.

La DMC Application Specification será la fuente de verdad del proyecto. El framework ATLAS permitirá construir instrucciones controladas para convertir la Specification en modelos, código, pruebas y evidencias. Cada sesión generará un incremento verificable y actualizará el Spec.

## 3. Objetivo general

Diseñar y construir la arquitectura de datos y software de una aplicación moderna, utilizando IA como copiloto de ingeniería y aplicando criterios profesionales de prompting, trazabilidad, calidad, rendimiento, seguridad, despliegue y gobierno.

## 4. Resultados de aprendizaje

Al finalizar, el participante podrá:

1. Traducir necesidades de negocio en requerimientos, historias y criterios de aceptación.
2. Construir y mantener una especificación funcional y técnica versionable.
3. Diseñar prompts de desarrollo mediante el framework ATLAS: Actor, Tarea, Límites, Autovalidación y Salida.
4. Diseñar modelos conceptuales, lógicos y físicos con asistencia de IA.
5. Implementar bases de datos PostgreSQL y MongoDB de acuerdo con el patrón de acceso.
6. Diseñar una arquitectura de software cloud-native trazable a requisitos funcionales y no funcionales.
7. Diseñar contratos de API y componentes backend conectados a la base de datos.
8. Generar datos sintéticos, consultas y pruebas de integridad, contrato e integración.
9. Analizar planes de ejecución y optimizar consultas, índices y estructuras.
10. Diseñar integración asíncrona y observabilidad para aplicaciones modernas.
11. Seleccionar y desplegar servicios de datos y aplicación en Google Cloud.
12. Incorporar seguridad, auditoría, secretos, observabilidad y recuperación.
13. Presentar una solución end-to-end con evidencias técnicas y valor de negocio.

## 5. Metodología de aprendizaje

Cada sesión sigue el flujo:

```text
Problema de negocio
    ↓
Conceptos
    ↓
Demostración con IA
    ↓
Taller guiado
    ↓
Taller práctico
    ↓
Validación y evidencias
    ↓
Actualización del Spec
```

A partir de la fase de construcción, la velocidad de generación de la IA se aprovecha para profundizar la ingeniería mediante el ciclo:

```text
GENERATE
   ↓
CRITIQUE
   ↓
BREAK
   ↓
MEASURE
   ↓
REFINE
   ↓
EVIDENCE
```

La IA no sustituye la decisión técnica. El participante debe demostrar por qué un artefacto es correcto, qué requisito satisface, cómo puede fallar y qué evidencia permite aceptarlo.

La distribución referencial de cada sesión es:

- Apertura y contexto: 15 minutos.
- Conceptos y decisiones de arquitectura: 45 minutos.
- Demostración con IA: 30 minutos.
- Taller guiado: 45 minutos.
- Taller práctico / challenge: 30 minutos.
- Validación, evidencias y Spec: 15 minutos.

Para las sesiones con IA, el alumno deberá distinguir al menos:

- fuente o input autorizado;
- prompt ATLAS utilizado;
- salida generada;
- validación humana y técnica;
- escenario utilizado para intentar romper la solución;
- medición o evidencia cuando corresponda;
- corrección aplicada;
- evidencia versionada.

## 6. Evaluación

La evaluación se basa en evidencias acumulativas:

- Artefactos y actualización del Spec: 20%.
- Talleres prácticos, prompts y código: 30%.
- Pruebas, validación y calidad: 20%.
- Proyecto integrador: 30%.

## 7. Estructura del programa

### Módulo 1. Negocio, prompting y modelado de datos con IA

**Propósito:** convertir una necesidad de negocio en una Specification, un prompt controlado y un diseño de datos trazable.

#### Sesión 1. Del problema de negocio al caso de uso

- Arquitectura de aplicaciones modernas.
- Actores, objetivos, procesos y dolores.
- Requerimientos funcionales y no funcionales.
- Historias de usuario y criterios de aceptación.
- IA para descubrir ambigüedades y preguntas faltantes.
- Inicio del DMC Application Specification.

**Incremento:** caso de negocio, alcance, actores y backlog inicial.

#### Sesión 2. Spec-Driven Development e ingeniería de requisitos con IA

- Qué es una especificación viva.
- Fuente de verdad y trazabilidad.
- Estructura de la DMC Application Specification.
- Los 12 bloques canónicos.
- Reglas de negocio, supuestos y restricciones.
- Prompts basados en Spec frente a prompts monolíticos.
- Criterios de calidad de una especificación.

**Incremento:** Spec funcional en estado Draft, matriz de trazabilidad inicial y preguntas abiertas.

#### Sesión 3. Prompt Engineering ATLAS para desarrollar aplicaciones con IA

- Diferencia entre pregunta, instrucción y prompt de ingeniería.
- Por qué una respuesta convincente puede ser incorrecta.
- Framework ATLAS: Actor, Tarea, Límites, Autovalidación y Salida.
- Evolución desde prompts básicos hasta prompts ejecutables.
- Variables, delimitadores y ejemplos de salida.
- Tratamiento de vacíos, supuestos y contradicciones.
- Patrón Generate–Critique–Refine.
- Prompts con herramientas: lectura de archivos, GitHub y Figma.
- Versionamiento y comparación de prompts.

**Incremento:** `prompt_atlas_v1.md`, `prompt_atlas_v1_1.md`, checklist de validación y evidencia comparativa.

#### Sesión 4. Modelado conceptual asistido por IA

- Entidades, conceptos, relaciones y cardinalidades.
- Eventos, estados y vocabulario del dominio.
- Identificación de agregados y límites.
- Prompt ATLAS para modelado conceptual.
- Validación del modelo contra requisitos.
- Diagramas Mermaid y Draw.io.

**Incremento:** modelo conceptual, glosario del dominio y preguntas de cardinalidad.

#### Sesión 5. Modelado lógico y normalización

- Transformación del modelo conceptual.
- Atributos, claves, integridad y dependencias.
- Normalización hasta tercera forma normal.
- Cuándo desnormalizar.
- Trazabilidad requisito-entidad-regla.
- Autovalidación del modelo lógico mediante ATLAS.

**Incremento:** modelo lógico normalizado y diccionario de datos.

### Módulo 2. Base de datos, arquitectura y backend con IA

**Propósito:** transformar el diseño validado en software ejecutable bajo lineamientos de arquitectura explícitos y verificables.

#### Sesión 6. Diseño físico PostgreSQL y Backend Readiness con SDD

- SDD Backend Readiness Gate.
- Tipos de datos, UUID y claves.
- Restricciones, dominios y enumeraciones.
- Auditoría y manejo temporal.
- Convenciones de nombres y scripts de migración.
- Derivación inicial del sprint de backend desde historias READY.
- Prompt ATLAS para transformar Specification y modelo lógico en diseño físico y backlog técnico.

**Incremento:** gate de readiness, modelo físico, migraciones base y backlog inicial de backend.

#### Sesión 7. Arquitectura de software cloud-native en Google Cloud

- Del código funcional a una arquitectura operable.
- Requisitos no funcionales como drivers de arquitectura.
- Separación API, aplicación, dominio e infraestructura.
- Arquitectura limpia / hexagonal y puertos-adaptadores.
- Modular monolith frente a microservicios: criterios de decisión.
- Stateless backend y diseño para Cloud Run.
- PostgreSQL en Cloud SQL, conexión y presión sobre el pool.
- Evidencias en Cloud Storage.
- Identidad de workload, IAM y Secret Manager.
- Observabilidad desde el diseño.
- ADR y trazabilidad Specification → RNF → decisión → componente.
- ATLAS Architecture Review sobre el backend iniciado.

**Incremento:** arquitectura lógica, arquitectura GCP v1, lineamientos de código, ADR iniciales y backlog de refactor arquitectónico.

#### Sesión 8. Integridad avanzada, transacciones y concurrencia

- Constraints simples, compuestos y condicionales.
- Exclusión de estados o rangos incompatibles.
- Funciones y triggers: cuándo usarlos y cuándo evitarlos.
- Reglas que viven en base de datos, backend o ambos.
- Límites transaccionales por caso de uso.
- Atomicidad, rollback e idempotencia.
- Concurrencia, locking y optimistic concurrency.
- Generación de pruebas negativas desde la Specification.

**Incremento:** invariantes críticos implementados, transacciones definidas y suite de pruebas negativas.

#### Sesión 9. APIs profesionales, vertical slices y persistencia

- Diseño de API a partir de historias de usuario.
- OpenAPI y contratos versionados.
- DTOs, validación y manejo de errores.
- Vertical slices y casos de uso.
- Separación controller / application / domain / infrastructure.
- Repositorios, unit of work y acceso a datos.
- IA para generar scaffolding controlado por Specification.
- Pruebas básicas junto con el código.

**Incremento:** backend mínimo conectado a PostgreSQL, vertical slices trazables y contrato OpenAPI versionado.

#### Sesión 10. Testing, datos sintéticos y calidad asistidos por IA

- Pirámide práctica de pruebas para una aplicación moderna.
- Unit tests, integration tests y contract tests.
- Pruebas positivas, negativas y de regresión.
- Generación de datos sintéticos sin PII real.
- Casos válidos, inválidos, bordes y escenarios adversos.
- Seeds reproducibles.
- Trazabilidad criterio de aceptación → dato → prueba → evidencia.
- Mutation mindset: intentar romper el incremento generado por IA.

**Incremento:** dataset sintético reproducible y suite automatizada de pruebas del backend y la persistencia.

### Módulo 3. Rendimiento, observabilidad y persistencia especializada

**Propósito:** demostrar que la solución no solo funciona, sino que puede medirse, diagnosticarse y evolucionar.

#### Sesión 11. Patrones de acceso, indexación y optimización SQL

- Consultas críticas y patrones de lectura/escritura.
- Índices B-tree, compuestos y parciales.
- Selectividad y orden de columnas.
- EXPLAIN y EXPLAIN ANALYZE.
- Scan secuencial, index scan, joins y sorts.
- Reescritura de consultas.
- Benchmark antes y después.
- Recomendaciones de IA sujetas a evidencia de ejecución.

**Incremento:** estrategia de índices y optimización sustentada con métricas comparativas.

#### Sesión 12. Observabilidad y diagnóstico de aplicaciones

- Logging estructurado.
- Correlation ID, request ID y trazabilidad por caso de negocio.
- Métricas técnicas y métricas del proceso.
- Latencia, errores, throughput y saturación.
- Trazas distribuidas como concepto.
- Cloud Logging y Cloud Monitoring.
- Diagnóstico asistido por IA a partir de evidencia.
- SLO/SLA básicos derivados de RNF.

**Incremento:** estándar de observabilidad, instrumentación básica y tablero/evidencia de diagnóstico.

#### Sesión 13. Modelado documental y persistencia políglota con MongoDB

- Cuándo utilizar documentos.
- Embedding frente a referencing.
- Diseño orientado a patrones de acceso.
- Validación de esquema e índices.
- Consistencia y transacciones: trade-offs.
- Comparación PostgreSQL-MongoDB.
- Decisión de persistencia sustentada en requisitos y ADR.

**Incremento:** modelo documental para un subdominio seleccionado y decisión de persistencia defendible.

### Módulo 4. Arquitectura cloud, integración y despliegue en Google Cloud

**Propósito:** evolucionar el backend a una solución distribuida, desplegable y operable usando servicios gestionados.

#### Sesión 14. Arquitectura event-driven e integración asíncrona en GCP

- Síncrono frente a asíncrono.
- Eventos de dominio e integración.
- Pub/Sub y Eventarc como patrones de integración.
- Productor, consumidor y contratos de evento.
- Idempotencia, reintentos y dead-letter handling.
- Consistencia eventual.
- Separación entre transacción operativa y efectos secundarios.
- ATLAS para descubrir escenarios de fallo y duplicidad.

**Incremento:** flujo asíncrono funcional, contrato de evento y pruebas de reintento/idempotencia.

#### Sesión 15. Cloud SQL, Cloud Run y despliegue end-to-end

- Servicios administrados y responsabilidades compartidas.
- Cloud SQL PostgreSQL: instancia, usuarios, base y migraciones.
- Conectividad segura desde Cloud Run.
- Cloud Run: contenedores, revisiones, concurrencia, min/max instances y configuración.
- Variables, secretos e identidad del servicio.
- Cloud Storage para evidencias cuando corresponda.
- Prueba end-to-end desplegada.

**Incremento:** backend y PostgreSQL desplegados en GCP con endpoint funcional y evidencia reproducible.

#### Sesión 16. CI/CD y release engineering asistido por IA

- Build, test, package, deploy.
- Docker y Artifact Registry.
- Pipeline de integración y despliegue.
- Migraciones dentro del ciclo de release.
- Estrategias de promoción y rollback.
- Configuración por ambiente.
- Quality gates y evidencia automática.
- IA como revisor de cambios, no como aprobador autónomo.

**Incremento:** pipeline CI/CD con quality gates, despliegue repetible y rollback documentado.

#### Sesión 17. BigQuery y analítica de aplicaciones

- Separación OLTP y analítica.
- Eventos y datos operativos hacia analítica.
- Modelo analítico mínimo.
- Particionamiento y clustering.
- Consultas de negocio y métricas del producto.
- Costos y patrones de consulta.
- Uso de IA para generar hipótesis y SQL, con validación de resultados.

**Incremento:** dataset analítico en BigQuery, consultas verificadas y métricas del producto.

### Módulo 5. Seguridad, resiliencia y defensa de arquitectura

**Propósito:** demostrar que la solución puede protegerse, recuperarse, operarse y defenderse técnicamente.

#### Sesión 18. Seguridad, resiliencia y preparación de producción

- Principio de mínimo privilegio.
- Roles de base de datos y aplicación.
- IAM y Secret Manager.
- Cifrado y datos sensibles.
- Inyección SQL y validación de entradas.
- Auditoría y trazabilidad.
- Límites para IA y agentes sobre datos y acciones.
- Backups y restauración.
- RPO y RTO.
- Timeouts, retries y degradación controlada.
- Runbooks y checklist de producción.
- Architecture challenge: escenarios de caída y recuperación.

**Incremento:** modelo de seguridad, controles implementados y paquete de production readiness con pruebas de recuperación.

#### Sesión 19. Proyecto integrador y defensa de arquitectura

- Demostración end-to-end.
- Trazabilidad desde el negocio hasta las pruebas.
- Decisiones, alternativas y trade-offs.
- Evidencias de rendimiento, observabilidad, seguridad y despliegue.
- Architecture Review final.
- Presentación ejecutiva y técnica.
- Retrospectiva del uso de IA y del framework ATLAS.

**Incremento:** solución final, repositorio, Spec, ADR, prompts, pruebas, evidencias y presentación.

## 8. Artefactos del proyecto integrador

El repositorio final debe incluir:

```text
docs/
  spec/
  arquitectura/
    adr/
  modelos/
  decisiones/
  prompts/

database/
  migrations/
  seeds/
  queries/
  tests/

backend/

infra/

scripts/

evidence/

README.md
```

La carpeta `docs/prompts/` debe conservar, como mínimo:

- prompt ATLAS inicial;
- prompt refinado;
- checklist de autovalidación;
- evidencia comparativa;
- prompts especializados utilizados durante el proyecto.

La carpeta `docs/arquitectura/adr/` debe conservar las decisiones arquitectónicas relevantes, incluyendo contexto, decisión, alternativas y consecuencias.

## 9. Herramientas de referencia

- Git y GitHub.
- ChatGPT, Claude u otro LLM autorizado.
- Claude Code u otra herramienta de desarrollo asistido.
- Figma para prototipos preliminares.
- PostgreSQL.
- MongoDB.
- Docker.
- Mermaid y Draw.io.
- Lenguaje y framework backend definidos para el proyecto.
- Google Cloud: Cloud SQL, Cloud Run, Cloud Storage, Pub/Sub, Eventarc, BigQuery, Secret Manager, Artifact Registry, Logging y Monitoring.

Las herramientas pueden evolucionar, pero el flujo metodológico, el framework ATLAS, la trazabilidad y la estructura de la Specification deben permanecer estables.

## 10. Requisitos del participante

- Conocimientos básicos de desarrollo o bases de datos.
- Capacidad para leer SQL.
- Cuenta de GitHub.
- Entorno local con Git y Docker.
- Acceso a un asistente de IA.
- Acceso a una herramienta de desarrollo asistido cuando corresponda.
- Acceso a Figma para las prácticas de prototipado.
- Acceso al proyecto de Google Cloud utilizado en las prácticas.

## 11. Criterio de cierre

El programa se considera completado cuando el participante demuestra que puede recorrer y explicar el flujo completo:

```text
Caso de uso
→ Specification
→ Prompt ATLAS
→ Diseño
→ Arquitectura
→ Código
→ Pruebas
→ Medición
→ Despliegue
→ Operación
→ Evidencias
```

La solución final debe ser funcional, trazable, versionada, observable, operable y defendible desde las perspectivas de negocio, arquitectura y operación.
