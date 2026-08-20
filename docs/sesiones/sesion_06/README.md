# Sesión 06 — Diseño físico PostgreSQL y preparación SDD para construcción de backend

## Propósito

Convertir el diseño validado de **Siniestro Fácil** en una base PostgreSQL implementable y, antes de iniciar desarrollo de backend, ejecutar un **SDD Backend Readiness Gate** que confirme que el equipo dispone de suficiente información funcional, de datos y de aceptación para construir sin inventar decisiones.

La sesión continúa directamente la Sesión 05. Allí se obtuvo el modelo lógico normalizado, el blueprint físico, las reglas de auditoría y pruebas iniciales. En la Sesión 06 se formaliza la transición:

```text
Specification
    ↓
Historias + criterios + reglas
    ↓
Modelo lógico/físico validado
    ↓
SDD Backend Readiness Gate
    ↓
PostgreSQL implementable
    ↓
Sprint de construcción del backend
    ↓
Prompts ATLAS por historia
    ↓
Código + pruebas + evidencia
```

## Caso central de la sesión

**Seguros — Siniestro Fácil**.

Los ejemplos, ejercicios y prompts ATLAS de esta sesión se desarrollan sobre el flujo principal del caso:

1. registrar un siniestro;
2. asociarlo a una póliza y asegurado;
3. adjuntar evidencias;
4. registrar presupuestos de talleres;
5. consultar estado y trazabilidad;
6. preparar los contratos que posteriormente consumirá el backend.

## Pregunta central

> ¿Tenemos realmente todo lo necesario para empezar a construir el backend, o solo tenemos suficiente información para creer que podemos empezar?

## Resultado observable

Al finalizar la sesión, cada equipo debe producir:

- resultado del `SDD Backend Readiness Gate`;
- lista de historias READY / NOT READY;
- preguntas bloqueantes y supuestos explícitos;
- modelo físico PostgreSQL definitivo para el alcance seleccionado;
- convenciones de nombres y tipos;
- PK, FK, UNIQUE, CHECK y defaults justificados;
- estándar de auditoría y temporalidad;
- migraciones base versionadas;
- mapa historia → endpoint → servicio → tabla → prueba;
- propuesta de Sprint 1 de backend;
- prompts ATLAS especializados para planificación y construcción incremental;
- Definition of Done del sprint;
- evidencia versionada en GitHub.

## Archivos

1. `01_plan_docente_3_horas.md` — conducción de la sesión.
2. `02_sdd_backend_readiness_gate.md` — gate antes de autorizar desarrollo.
3. `03_guia_diseno_fisico_postgresql.md` — decisiones físicas PostgreSQL.
4. `04_prompts_atlas_sprint_backend.md` — prompts ATLAS para preparar y ejecutar el sprint.
5. `05_taller_siniestro_facil.md` — taller guiado del caso central.
6. `06_definition_of_done.md` — criterios de cierre de la sesión y del sprint preparado.

## Regla SDD de la sesión

Una historia **no entra al sprint de construcción** si no puede trazarse, como mínimo, a:

```text
Historia
→ criterio de aceptación
→ regla/requisito
→ datos requeridos
→ operación esperada
→ error esperado
→ evidencia de prueba
```

Las preguntas abiertas críticas no se convierten silenciosamente en código. Deben resolverse o registrarse explícitamente como supuesto aceptado.

## Frontera con las siguientes sesiones

- **Sesión 06:** gate SDD + diseño físico PostgreSQL + migraciones base + sprint backend listo.
- **Sesión 07:** integridad avanzada, reglas críticas, transacciones y pruebas negativas.
- **Sesión 08:** datos sintéticos, seeds y consultas.
- **Sesión 09:** backend/API conectado a PostgreSQL y contratos ejecutables.

La Sesión 06 no pretende adelantar toda la implementación del backend. Su objetivo es que cuando el equipo empiece a construirlo, lo haga desde una Specification suficientemente cerrada y con un sprint defendible.

## Mensaje central

> En Spec-Driven Development, empezar a programar no es una fecha del calendario. Es una decisión de ingeniería sustentada por evidencia.
