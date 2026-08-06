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

El participante recorrerá el ciclo completo: comprensión del negocio, especificación, prompt engineering, modelado conceptual, lógico y físico, implementación relacional y documental, construcción de backend, optimización, despliegue cloud, seguridad y presentación de evidencias.

La DMC Application Specification será la fuente de verdad del proyecto. El framework ATLAS permitirá construir instrucciones controladas para convertir la Specification en modelos, código, pruebas y evidencias. Cada sesión generará un incremento verificable y actualizará el Spec.

## 3. Objetivo general

Diseñar y construir la arquitectura de datos de una aplicación moderna, utilizando IA como copiloto de ingeniería y aplicando criterios profesionales de prompting, trazabilidad, calidad, rendimiento, seguridad, despliegue y gobierno.

## 4. Resultados de aprendizaje

Al finalizar, el participante podrá:

1. Traducir necesidades de negocio en requerimientos, historias y criterios de aceptación.
2. Construir y mantener una especificación funcional y técnica versionable.
3. Diseñar prompts de desarrollo mediante el framework ATLAS: Actor, Tarea, Límites, Autovalidación y Salida.
4. Diseñar modelos conceptuales, lógicos y físicos con asistencia de IA.
5. Implementar bases de datos PostgreSQL y MongoDB de acuerdo con el patrón de acceso.
6. Diseñar contratos de API y componentes backend conectados a la base de datos.
7. Generar datos sintéticos, consultas y pruebas de integridad.
8. Analizar planes de ejecución y optimizar consultas, índices y estructuras.
9. Seleccionar y desplegar servicios de datos en Google Cloud.
10. Incorporar seguridad, auditoría, secretos, observabilidad y recuperación.
11. Presentar una solución end-to-end con evidencias técnicas y valor de negocio.

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

La distribución referencial de cada sesión es:

- Apertura y contexto: 15 minutos.
- Conceptos: 45 minutos.
- Demostración: 30 minutos.
- Taller guiado: 45 minutos.
- Taller práctico: 30 minutos.
- Validación, evidencias y Spec: 15 minutos.

Para las sesiones con IA, el alumno deberá distinguir al menos:

- fuente o input autorizado;
- prompt ATLAS utilizado;
- salida generada;
- validación humana y técnica;
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
- Framework ATLAS:
  - Actor.
  - Tarea.
  - Límites.
  - Autovalidación.
  - Salida.
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

### Módulo 2. Base de datos y backend con IA

**Propósito:** transformar el diseño validado en una solución ejecutable.

#### Sesión 6. Diseño físico en PostgreSQL

- Tipos de datos.
- UUID y claves.
- Restricciones, dominios y enumeraciones.
- Auditoría y manejo temporal.
- Convenciones de nombres y scripts de migración.
- Prompt ATLAS para transformar el modelo lógico en diseño físico.

**Incremento:** modelo físico y migraciones base.

#### Sesión 7. Integridad avanzada y reglas de negocio

- Constraints simples y compuestos.
- Exclusión de solapamientos.
- Funciones y triggers.
- Transacciones y concurrencia.
- Reglas que deben vivir en base de datos o aplicación.
- Generación de pruebas negativas desde la Specification.

**Incremento:** reglas críticas implementadas y pruebas negativas.

#### Sesión 8. Datos sintéticos y consultas de negocio

- Generación de datos sintéticos con IA.
- Prohibición de PII real.
- Datos válidos, inválidos y casos límite.
- Seeds reproducibles.
- Consultas operativas y analíticas.
- Vistas y funciones de consulta.
- Trazabilidad dato sintético-criterio de aceptación.

**Incremento:** dataset sintético, seeds y catálogo de consultas.

#### Sesión 9. Backend, contratos de API y persistencia

- Diseño de API a partir de historias de usuario.
- Contratos, validación y manejo de errores.
- Separación de responsabilidades.
- Acceso a datos y transacciones.
- IA para generar scaffolding y pruebas.
- Prompt ATLAS para desarrollo incremental y controlado.

**Incremento:** backend mínimo conectado a PostgreSQL y contrato de API versionado.

### Módulo 3. Optimización del modelo de datos con IA

**Propósito:** mejorar rendimiento, mantenibilidad, calidad y experiencia de operación.

#### Sesión 10. Patrones de acceso e indexación

- Consultas críticas y patrones de lectura/escritura.
- Índices B-tree, compuestos y parciales.
- Selectividad y orden de columnas.
- Costos de indexación.
- Recomendaciones asistidas por IA y validación humana.

**Incremento:** estrategia de índices justificada.

#### Sesión 11. Planes de ejecución y optimización SQL

- EXPLAIN y EXPLAIN ANALYZE.
- Scan secuencial, index scan, joins y sorts.
- Identificación de cuellos de botella.
- Reescritura de consultas.
- Comparación antes y después.

**Incremento:** evidencias de optimización y métricas.

#### Sesión 12. Calidad de datos, pruebas y observabilidad

- Reglas de calidad.
- Pruebas de esquema, integridad y negocio.
- Pruebas positivas, negativas y de regresión.
- Logging, métricas y trazas.
- Evidencias automatizadas.
- Revisión de resultados generados por IA.

**Incremento:** suite de validación y tablero básico de evidencias.

#### Sesión 13. Modelado documental con MongoDB

- Cuándo utilizar documentos.
- Embedding frente a referencing.
- Diseño orientado a patrones de acceso.
- Validación de esquema e índices.
- Comparación PostgreSQL-MongoDB.
- Decisión de persistencia sustentada en requisitos.

**Incremento:** modelo documental para un subdominio seleccionado.

### Módulo 4. Cloud Databases y despliegue en Google Cloud

**Propósito:** desplegar la solución utilizando servicios gestionados y criterios de arquitectura cloud.

#### Sesión 14. Arquitectura cloud y PostgreSQL en Cloud SQL

- Servicios administrados y responsabilidades compartidas.
- Disponibilidad, escalabilidad y resiliencia.
- Cloud SQL, Firestore, MongoDB Atlas y BigQuery.
- Criterios de selección.
- Estimación inicial de capacidad y costo.
- Instancia Cloud SQL, redes y conectividad.
- Usuarios, bases, migraciones y datos iniciales.
- Backups y conexión segura desde aplicaciones.

**Incremento:** decisión cloud documentada y PostgreSQL desplegado en Cloud SQL.

#### Sesión 15. Backend y despliegue en Cloud Run

- Contenedores y configuración externa.
- Variables, secretos y conexión a Cloud SQL.
- Despliegue en Cloud Run.
- Escalamiento y límites.
- Prueba end-to-end.

**Incremento:** aplicación desplegada con endpoint funcional.

#### Sesión 16. BigQuery para analítica de aplicaciones

- Separación OLTP y analítica.
- Modelo de datos analítico.
- Carga de eventos y datos operativos.
- Particionamiento y clustering.
- Consultas y tablero de indicadores.

**Incremento:** dataset analítico y métricas del producto.

### Módulo 5. Seguridad en bases de datos y aplicaciones

**Propósito:** incorporar controles técnicos y operativos para proteger y operar la solución.

#### Sesión 17. Seguridad, identidad y protección de datos

- Principio de mínimo privilegio.
- Roles de base de datos y aplicación.
- Secret Manager.
- Cifrado y datos sensibles.
- Inyección SQL y validación de entradas.
- Auditoría y trazabilidad.
- Límites para IA y agentes sobre datos y acciones.

**Incremento:** modelo de seguridad y controles implementados.

#### Sesión 18. Resiliencia, operación y preparación de producción

- Backups, restauración y continuidad.
- RPO y RTO.
- Monitoreo, alertas y runbooks.
- Gestión de cambios y migraciones.
- Checklist de producción.
- Revisión integral del Spec y de los prompts críticos.

**Incremento:** paquete de preparación para producción.

#### Sesión 19. Proyecto integrador y defensa de arquitectura

- Demostración end-to-end.
- Trazabilidad desde el negocio hasta las pruebas.
- Decisiones, alternativas y trade-offs.
- Evidencias de rendimiento, seguridad y despliegue.
- Presentación ejecutiva y técnica.
- Retrospectiva del uso de IA y del framework ATLAS.

**Incremento:** solución final, repositorio, Spec, prompts y presentación.

## 8. Artefactos del proyecto integrador

El repositorio final debe incluir:

```text
docs/
  spec/
  arquitectura/
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
- Google Cloud: Cloud SQL, Cloud Run, BigQuery, Secret Manager, Logging y Monitoring.

Las herramientas pueden evolucionar, pero el flujo metodológico, el framework ATLAS y la estructura de la Specification deben permanecer estables.

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
→ Código
→ Pruebas
→ Despliegue
→ Evidencias
```

La solución final debe ser funcional, trazable, versionada y defendible desde las perspectivas de negocio, arquitectura y operación.
