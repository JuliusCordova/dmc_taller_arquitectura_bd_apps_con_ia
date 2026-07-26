# Sílabo del programa

## Arquitectura y Bases de Datos con IA para Aplicaciones Modernas

## 1. Información general

- **Duración total:** 57 horas cronológicas.
- **Número de sesiones:** 19.
- **Duración por sesión:** 3 horas.
- **Modalidad:** teórico-práctica.
- **Metodología principal:** Spec-Driven Development con asistencia de IA.
- **Plataforma cloud de referencia:** Google Cloud.
- **Proyecto integrador:** aplicación moderna desarrollada de manera incremental.

## 2. Descripción

El programa desarrolla las capacidades necesarias para diseñar, implementar, optimizar, desplegar y asegurar la arquitectura de datos y la base de datos de aplicaciones modernas con apoyo de inteligencia artificial.

El participante recorrerá el ciclo completo: comprensión del negocio, especificación, modelado conceptual, lógico y físico, implementación relacional y documental, construcción de backend, optimización, despliegue cloud, seguridad y presentación de evidencias.

La DMC Application Specification será la fuente de verdad del proyecto. Cada sesión generará un incremento verificable y actualizará el Spec.

## 3. Objetivo general

Diseñar y construir la arquitectura de datos de una aplicación moderna, utilizando IA como copiloto de ingeniería y aplicando criterios profesionales de trazabilidad, calidad, rendimiento, seguridad, despliegue y gobierno.

## 4. Resultados de aprendizaje

Al finalizar, el participante podrá:

1. Traducir necesidades de negocio en requerimientos, historias y criterios de aceptación.
2. Construir y mantener una especificación funcional y técnica versionable.
3. Diseñar modelos conceptuales, lógicos y físicos con asistencia de IA.
4. Implementar bases de datos PostgreSQL y MongoDB de acuerdo con el patrón de acceso.
5. Diseñar contratos de API y componentes backend conectados a la base de datos.
6. Generar datos sintéticos, consultas y pruebas de integridad.
7. Analizar planes de ejecución y optimizar consultas, índices y estructuras.
8. Seleccionar y desplegar servicios de datos en Google Cloud.
9. Incorporar seguridad, auditoría, secretos, observabilidad y recuperación.
10. Presentar una solución end-to-end con evidencias técnicas y valor de negocio.

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

## 6. Evaluación

La evaluación se basa en evidencias acumulativas:

- Artefactos y actualización del Spec: 20%.
- Talleres prácticos y código: 30%.
- Pruebas, validación y calidad: 20%.
- Proyecto integrador: 30%.

## 7. Estructura del programa

### Módulo 1. Negocio y modelado de datos con IA

**Propósito:** convertir una necesidad de negocio en una especificación y un diseño de datos trazable.

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
- Reglas de negocio, supuestos y restricciones.
- Prompts basados en Spec frente a prompts monolíticos.
- Criterios de calidad de una especificación.

**Incremento:** Spec funcional validado y matriz de trazabilidad inicial.

#### Sesión 3. Modelado conceptual asistido por IA

- Entidades, conceptos, relaciones y cardinalidades.
- Eventos, estados y vocabulario del dominio.
- Identificación de agregados y límites.
- Validación del modelo contra requisitos.
- Diagramas Mermaid y Draw.io.

**Incremento:** modelo conceptual y glosario del dominio.

#### Sesión 4. Modelado lógico y normalización

- Transformación del modelo conceptual.
- Atributos, claves, integridad y dependencias.
- Normalización hasta tercera forma normal.
- Cuándo desnormalizar.
- Trazabilidad requisito-entidad-regla.

**Incremento:** modelo lógico normalizado y diccionario de datos.

### Módulo 2. Base de datos y backend con IA

**Propósito:** transformar el diseño validado en una solución ejecutable.

#### Sesión 5. Diseño físico en PostgreSQL

- Tipos de datos.
- UUID y claves.
- Restricciones, dominios y enumeraciones.
- Auditoría y manejo temporal.
- Convenciones de nombres y scripts de migración.

**Incremento:** modelo físico y migraciones base.

#### Sesión 6. Integridad avanzada y reglas de negocio

- Constraints simples y compuestos.
- Exclusión de solapamientos.
- Funciones y triggers.
- Transacciones y concurrencia.
- Reglas que deben vivir en base de datos o aplicación.

**Incremento:** reglas críticas implementadas y pruebas negativas.

#### Sesión 7. Datos sintéticos y consultas de negocio

- Generación de datos sintéticos con IA.
- Datos válidos, inválidos y casos límite.
- Seeds reproducibles.
- Consultas operativas y analíticas.
- Vistas y funciones de consulta.

**Incremento:** dataset sintético, seeds y catálogo de consultas.

#### Sesión 8. Backend, contratos de API y persistencia

- Diseño de API a partir de historias de usuario.
- Contratos, validación y manejo de errores.
- Separación de responsabilidades.
- Acceso a datos y transacciones.
- IA para generar scaffolding y pruebas.

**Incremento:** backend mínimo conectado a PostgreSQL.

### Módulo 3. Optimización del modelo de datos con IA

**Propósito:** mejorar rendimiento, mantenibilidad, calidad y experiencia de operación.

#### Sesión 9. Patrones de acceso e indexación

- Consultas críticas y patrones de lectura/escritura.
- Índices B-tree, compuestos y parciales.
- Selectividad y orden de columnas.
- Costos de indexación.
- Recomendaciones asistidas por IA.

**Incremento:** estrategia de índices justificada.

#### Sesión 10. Planes de ejecución y optimización SQL

- EXPLAIN y EXPLAIN ANALYZE.
- Scan secuencial, index scan, joins y sorts.
- Identificación de cuellos de botella.
- Reescritura de consultas.
- Comparación antes y después.

**Incremento:** evidencias de optimización y métricas.

#### Sesión 11. Calidad de datos, pruebas y observabilidad

- Reglas de calidad.
- Pruebas de esquema, integridad y negocio.
- Pruebas positivas, negativas y de regresión.
- Logging, métricas y trazas.
- Evidencias automatizadas.

**Incremento:** suite de validación y tablero básico de evidencias.

#### Sesión 12. Modelado documental con MongoDB

- Cuándo utilizar documentos.
- Embedding frente a referencing.
- Diseño orientado a patrones de acceso.
- Validación de esquema e índices.
- Comparación PostgreSQL-MongoDB.

**Incremento:** modelo documental para un subdominio seleccionado.

### Módulo 4. Cloud Databases y despliegue en Google Cloud

**Propósito:** desplegar la solución utilizando servicios gestionados y criterios de arquitectura cloud.

#### Sesión 13. Fundamentos de bases de datos cloud

- Servicios administrados y responsabilidades compartidas.
- Disponibilidad, escalabilidad y resiliencia.
- Cloud SQL, Firestore, MongoDB Atlas y BigQuery.
- Criterios de selección.
- Estimación inicial de capacidad y costo.

**Incremento:** decisión de arquitectura cloud documentada.

#### Sesión 14. Despliegue de PostgreSQL en Cloud SQL

- Instancia, redes y conectividad.
- Usuarios, bases y configuración.
- Migraciones y datos iniciales.
- Backups y recuperación.
- Conexión segura desde aplicaciones.

**Incremento:** base PostgreSQL desplegada y validada.

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

**Incremento:** modelo de seguridad y controles implementados.

#### Sesión 18. Resiliencia, operación y preparación de producción

- Backups, restauración y continuidad.
- RPO y RTO.
- Monitoreo, alertas y runbooks.
- Gestión de cambios y migraciones.
- Checklist de producción.
- Revisión integral del Spec.

**Incremento:** paquete de preparación para producción.

#### Sesión 19. Proyecto integrador y defensa de arquitectura

- Demostración end-to-end.
- Trazabilidad desde el negocio hasta las pruebas.
- Decisiones, alternativas y trade-offs.
- Evidencias de rendimiento, seguridad y despliegue.
- Presentación ejecutiva y técnica.
- Retrospectiva del uso de IA.

**Incremento:** solución final, repositorio, Spec y presentación.

## 8. Artefactos del proyecto integrador

El repositorio final debe incluir:

```text
docs/
  spec/
  arquitectura/
  modelos/
  decisiones/

database/
  migrations/
  seeds/
  queries/
  tests/

backend/

infra/

scripts/

README.md
```

## 9. Herramientas de referencia

- Git y GitHub.
- ChatGPT u otro LLM autorizado.
- PostgreSQL.
- MongoDB.
- Docker.
- Mermaid y Draw.io.
- Lenguaje y framework backend definidos para el proyecto.
- Google Cloud: Cloud SQL, Cloud Run, BigQuery, Secret Manager, Logging y Monitoring.

Las herramientas pueden evolucionar, pero el flujo metodológico y la estructura del Spec deben permanecer estables.

## 10. Requisitos del participante

- Conocimientos básicos de desarrollo o bases de datos.
- Capacidad para leer SQL.
- Cuenta de GitHub.
- Entorno local con Git y Docker.
- Acceso a un asistente de IA.
- Acceso al proyecto de Google Cloud utilizado en las prácticas.

## 11. Criterio de cierre

El programa se considera completado cuando el participante demuestra que puede recorrer y explicar el flujo completo:

```text
Caso de uso → Spec → Diseño → Código → Pruebas → Despliegue → Evidencias
```

La solución final debe ser funcional, trazable, versionada y defendible desde las perspectivas de negocio, arquitectura y operación.
