# Sesión 06 — Plan docente de 3 horas

## Tema

**Diseño físico PostgreSQL + SDD Backend Readiness + preparación del Sprint de Backend**

Caso central: **Siniestro Fácil**.

## Objetivo de aprendizaje

Al finalizar la sesión, el participante podrá demostrar si una historia está realmente lista para desarrollo, transformar el blueprint físico en decisiones PostgreSQL implementables y preparar un sprint de backend mediante prompts ATLAS controlados y trazables.

## Secuencia de 180 minutos

### Bloque 0 — ¿Estamos listos para desarrollar? (0–25 min)

**Problema:** los equipos suelen iniciar código porque “ya tienen historias”, aunque aún existan huecos críticos.

Revisar para Siniestro Fácil:

- alcance MVP;
- historias prioritarias;
- criterios de aceptación;
- reglas de negocio;
- preguntas abiertas;
- modelo lógico;
- modelo físico;
- errores esperados;
- datos de entrada y salida;
- requisitos no funcionales relevantes.

Ejecutar el **SDD Backend Readiness Gate**.

Salida:

```text
READY
READY WITH ASSUMPTIONS
NOT READY
```

### Bloque 1 — Del blueprint al PostgreSQL profesional (25–65 min)

Conceptos:

- UUID y claves de negocio;
- tipos PostgreSQL;
- nullability;
- PK/FK;
- UNIQUE;
- CHECK;
- defaults;
- catálogos y enumeraciones;
- `TIMESTAMPTZ`;
- auditoría;
- concurrencia optimista;
- convenciones de nombres;
- migraciones versionadas.

Caso Siniestro Fácil:

- `core.party`;
- `insurance.policy`;
- `claim.claim`;
- `claim.evidence`;
- `partner.repair_shop`;
- `claim.repair_estimate`;
- `claim.estimate_item`.

### Bloque 2 — Demostración ATLAS: Specification → Sprint Backend (65–95 min)

Demostrar tres prompts:

1. **ATLAS Readiness Auditor** — determina qué historias pueden entrar al sprint.
2. **ATLAS Sprint Planner** — transforma historias READY en backlog técnico trazable.
3. **ATLAS Story Builder** — genera el plan de construcción de una historia sin inventar decisiones.

Regla docente:

> La IA no decide qué falta. Lo detecta, lo reporta y bloquea la generación cuando la Specification no sustenta una decisión.

### Bloque 3 — Taller guiado Siniestro Fácil (95–140 min)

Historia guía:

> Como asegurado, quiero registrar un siniestro asociado a mi póliza para iniciar el proceso de atención y obtener un número de seguimiento.

El equipo debe construir la cadena:

```text
HU
→ criterios de aceptación
→ reglas
→ entidades/tablas
→ operación transaccional
→ contrato preliminar
→ errores
→ pruebas
→ evidencia
```

Después preparar el backlog técnico del Sprint 1.

### Bloque 4 — Taller práctico por equipos (140–165 min)

Cada equipo selecciona 2–3 historias READY y produce:

- objetivo del sprint;
- historias incluidas;
- dependencias;
- tareas backend;
- tareas de datos;
- tareas de prueba;
- Definition of Done;
- riesgos/preguntas;
- prompt ATLAS versionado.

### Bloque 5 — Validación y cierre (165–180 min)

Revisión cruzada:

- ¿cada historia tiene criterios verificables?;
- ¿cada campo tiene fuente?;
- ¿cada operación identifica sus reglas?;
- ¿cada regla crítica tiene prueba?;
- ¿los errores esperados están definidos?;
- ¿la persistencia está trazada?;
- ¿hay preguntas abiertas convertidas indebidamente en decisiones?;
- ¿el sprint puede ejecutarse sin adivinar negocio?

## Entregable de la sesión

```text
docs/sdd/
  backend_readiness_gate.md
  sprint_01_backend.md

docs/prompts/
  prompt_atlas_readiness.md
  prompt_atlas_sprint_planner.md
  prompt_atlas_story_builder.md

database/migrations/
  V001__base_schema.sql

evidence/
  session_06/
```

## Idea fuerza final

> Una historia READY no es una historia bien redactada. Es una historia suficientemente especificada para construir, probar y demostrar sin inventar comportamiento.
