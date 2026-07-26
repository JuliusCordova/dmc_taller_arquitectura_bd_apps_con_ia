# Manifiesto general del programa

## Arquitectura y Bases de Datos con IA para Aplicaciones Modernas

Este programa parte de una convicción: la inteligencia artificial no reemplaza el criterio del arquitecto, pero sí puede amplificar su capacidad para comprender problemas, diseñar soluciones, producir artefactos y validar decisiones.

La formación se organiza alrededor de un proyecto integrador transversal y de una metodología de trabajo reproducible. El alumno no aprenderá únicamente comandos, herramientas o patrones aislados. Aprenderá a convertir una necesidad de negocio en una solución implementable, trazable, segura y desplegable.

## Propósito

Formar profesionales capaces de diseñar la arquitectura de datos y la base de datos de una aplicación moderna con apoyo de IA, manteniendo control humano sobre las decisiones, reglas de negocio, calidad, seguridad, rendimiento y despliegue.

## Principios rectores

1. **El problema de negocio precede a la tecnología.**
   Toda sesión parte de una necesidad concreta, actores, restricciones y criterios de éxito.

2. **La especificación es la fuente de verdad.**
   La DMC Application Specification concentra el contexto funcional y técnico del proyecto. Los prompts orquestan; el Spec conserva el conocimiento.

3. **La IA transforma especificaciones en artefactos.**
   Se utiliza para analizar requerimientos, modelar datos, generar código, proponer pruebas, documentar decisiones y detectar inconsistencias.

4. **Toda salida de IA debe validarse.**
   Ningún modelo, script, arquitectura o recomendación se considera correcto sin revisión, pruebas y evidencias.

5. **El aprendizaje es incremental.**
   Cada sesión extiende el mismo producto y actualiza su Spec. El alumno ve cómo una solución evoluciona desde la idea hasta producción.

6. **La arquitectura debe ser explicable.**
   Cada decisión debe responder a una necesidad, riesgo, restricción o atributo de calidad.

7. **El código es un artefacto, no el punto de partida.**
   El flujo canónico es: caso de uso → Spec → diseño → código → pruebas → despliegue → evidencias.

8. **La práctica debe parecerse al trabajo real.**
   Se incorporan requisitos funcionales y no funcionales, historias de usuario, trade-offs, control de versiones, datos sintéticos, validación y presentación ejecutiva.

9. **La seguridad y el gobierno se diseñan desde el inicio.**
   No se agregan al final. Se consideran identidad, secretos, permisos, auditoría, protección de datos y observabilidad durante todo el ciclo.

10. **El alumno debe producir evidencia.**
    Cada sesión termina con un entregable verificable: una actualización del Spec, un modelo, código, pruebas, métricas, diagramas o una demostración.

## Flujo metodológico oficial

```text
Caso de uso
    ↓
DMC Application Specification
    ↓
Diseño conceptual
    ↓
Diseño lógico
    ↓
Diseño físico
    ↓
Código y configuración
    ↓
Pruebas y validación
    ↓
Despliegue
    ↓
Evidencias y aprendizaje
```

## Rol de la IA

La IA actuará como copiloto para:

- descubrir ambigüedades en requisitos;
- proponer entidades, relaciones y reglas;
- comparar alternativas de arquitectura;
- generar modelos y diagramas;
- producir SQL, APIs, pruebas y documentación;
- crear datos sintéticos;
- explicar errores y sugerir optimizaciones;
- mantener trazabilidad entre requerimientos y artefactos.

La IA no decide por sí sola:

- prioridades de negocio;
- aceptación de riesgos;
- reglas críticas;
- clasificación de datos;
- controles de seguridad;
- compromisos de costo, rendimiento o disponibilidad;
- aprobación final de una solución.

## Proyecto integrador transversal

Las 19 sesiones construyen progresivamente una aplicación moderna. El proyecto evoluciona mediante Spec-Driven Development y debe incluir, al cierre:

- caso de negocio y actores;
- requerimientos funcionales y no funcionales;
- historias de usuario y criterios de aceptación;
- modelo conceptual, lógico y físico;
- base de datos relacional y/o documental según el caso;
- backend y contratos de API;
- restricciones, índices, datos sintéticos y consultas;
- pruebas funcionales, de integridad, rendimiento y seguridad;
- despliegue en Google Cloud;
- observabilidad y evidencias;
- presentación técnica y ejecutiva.

## Estructura canónica de una sesión

Cada sesión de tres horas debe incluir:

1. Apertura con un problema de negocio.
2. Objetivos de aprendizaje y resultado observable.
3. Conceptos esenciales.
4. Demostración con IA.
5. Taller guiado.
6. Taller práctico individual o por equipos.
7. Validación y revisión de evidencias.
8. Actualización del DMC Application Specification.
9. Cierre con decisiones, riesgos y siguiente incremento.

## Criterios de calidad del programa

Una sesión se considera completa cuando:

- existe una conexión explícita entre negocio y tecnología;
- el alumno produce al menos un artefacto verificable;
- la IA se utiliza con instrucciones y contexto controlados;
- hay validación humana y técnica;
- el Spec queda actualizado;
- se documentan decisiones y pendientes;
- el incremento puede versionarse en Git.

## Mensaje central

> La IA acelera la construcción. La especificación conserva el conocimiento. El arquitecto mantiene el criterio.
