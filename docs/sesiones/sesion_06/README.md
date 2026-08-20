# Sesión 06 — Diseño físico PostgreSQL y Backend Readiness con SDD

## Propósito

Convertir el diseño validado de la Sesión 05 en una base PostgreSQL implementable y, antes de iniciar el backend, ejecutar un **SDD Backend Readiness Gate** que confirme que las historias de usuario, requisitos, reglas, criterios de aceptación, modelo de datos y preguntas críticas ofrecen suficiente evidencia para construir sin inventar decisiones.

El caso conductor de la sesión es **Siniestro Fácil**.

## Pregunta central

> ¿Estamos realmente listos para construir el backend o todavía existen vacíos en la Specification que obligarían al desarrollador o a la IA a adivinar?

## Bloque 0 — SDD Backend Readiness Gate

La sesión inicia revalidando que el producto tenga lo necesario para pasar de diseño a construcción.

Se revisa, por historia candidata al sprint:

- propósito y actor claros;
- historia de usuario trazable;
- requisitos funcionales asociados;
- requisitos no funcionales aplicables;
- reglas de negocio involucradas;
- criterios de aceptación verificables;
- entidades y atributos requeridos en el modelo;
- estados y transiciones relevantes;
- integraciones o dependencias identificadas;
- preguntas abiertas clasificadas por impacto;
- decisiones técnicas ya aprobadas;
- evidencia suficiente para escribir pruebas.

### Regla SDD de entrada

Una historia crítica **no entra al sprint de construcción** si para implementarla es necesario inventar una regla, dato, estado, contrato, integración o comportamiento no definido por la Specification.

Las preguntas no críticas pueden transformarse en supuestos explícitos y versionados. Las preguntas críticas bloquean la historia.

## Caso conductor — Siniestro Fácil

Flujo mínimo de referencia:

```text
Asegurado
   ↓ registra
Siniestro
   ↓ adjunta
Evidencia
   ↓ solicita / recibe
Presupuesto
   ↑ presenta
Taller
```

El sprint de backend se construye sobre historias y reglas del caso, no sobre endpoints aislados.

## Movimientos de la sesión

1. **Revalidar readiness SDD** — confirmar que podemos construir sin adivinar.
2. **Cerrar diseño físico PostgreSQL** — tipos, UUID, constraints, dominios, enumeraciones, auditoría y temporalidad.
3. **Preparar migraciones versionadas** — esquema recreable y evolución controlada.
4. **Derivar sprint de backend desde la Specification** — historias, slices, contratos, persistencia y pruebas.
5. **Usar prompts ATLAS de construcción** — generar, criticar, refinar y verificar artefactos.

## Incremento observable

Al finalizar la sesión el equipo debe producir:

- resultado del `backend_readiness_gate.md`;
- historias seleccionadas para el sprint;
- matriz historia → requisito → regla → criterio → tabla → endpoint/prueba;
- modelo físico PostgreSQL cerrado;
- migraciones base versionadas;
- convenciones de nombres y auditoría;
- backlog técnico del sprint de backend;
- prompts ATLAS utilizados;
- decisiones y preguntas actualizadas en la Specification.

## Frontera con la Sesión 07

La Sesión 06 deja el backend preparado para construir sobre una base física gobernada y una Specification revalidada.

La Sesión 07 profundiza reglas críticas, constraints avanzados, funciones, triggers, transacciones, concurrencia y pruebas negativas.

## Archivos de la sesión

1. `README.md` — propósito, alcance y flujo docente.
2. `01_backend_readiness_gate.md` — gate SDD antes de desarrollo.
3. `02_prompts_atlas_sprint_backend.md` — prompts ATLAS para planificar y construir el sprint.
4. `03_taller_siniestro_facil.md` — taller guiado centrado en Siniestro Fácil.

## Mensaje central

> SDD no significa pedirle a la IA que programe más rápido. Significa reducir la cantidad de decisiones que la IA o el desarrollador tienen que inventar mientras programan.
