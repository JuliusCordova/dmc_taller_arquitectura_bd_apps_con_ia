# Taller guiado — Siniestro Fácil

## Objetivo

Aplicar el SDD Backend Readiness Gate y construir un sprint de backend a partir de historias listas para desarrollo.

## Escenario

Partimos del caso Siniestro Fácil y del modelo validado en la Sesión 05.

Flujo base:

```text
Asegurado registra Siniestro
        ↓
Siniestro recibe Evidencias
        ↓
Taller presenta Presupuesto
        ↓
Sistema conserva trazabilidad y estado
```

## Parte 1 — Seleccionar historia candidata

El equipo elige una historia:

- registrar siniestro;
- consultar siniestro;
- adjuntar evidencia;
- registrar presupuesto de taller.

No se permite inventar historias nuevas durante el ejercicio.

## Parte 2 — Ejecutar Backend Readiness Gate

Completar para la historia seleccionada:

| Dimensión | Evidencia | Estado | Hallazgo |
|---|---|---|---|
| Historia |  |  |  |
| RF |  |  |  |
| NFR |  |  |  |
| Reglas |  |  |  |
| Criterios |  |  |  |
| Datos |  |  |  |
| Estados |  |  |  |
| Integraciones |  |  |  |
| Preguntas |  |  |  |

Resultado obligatorio: `READY`, `READY_WITH_ASSUMPTIONS` o `BLOCKED`.

## Parte 3 — Derivar trazabilidad de construcción

Construir la cadena:

```text
HU
↓
RF
↓
RN
↓
CA
↓
Tabla / columna
↓
Operación backend
↓
Prueba
↓
Evidencia
```

Ningún elemento puede aparecer si no existe una fuente o una decisión documentada.

## Parte 4 — Armar el sprint

Para historias `READY`, completar:

| Orden | Historia | Slice | Persistencia | Validación | Prueba | Evidencia |
|---|---|---|---|---|---|---|
| 1 |  |  |  |  |  |  |

### Ejemplo de descomposición

Para `Registrar siniestro`, un equipo podría identificar, solo si la Specification lo sustenta:

1. contrato lógico de registro;
2. validaciones de entrada;
3. validación de póliza/asegurado;
4. creación transaccional del siniestro;
5. generación o conservación del identificador de negocio;
6. respuesta de creación;
7. prueba positiva;
8. prueba de duplicidad o idempotencia si aplica;
9. evidencia de ejecución.

El ejemplo no autoriza agregar reglas no documentadas.

## Parte 5 — Prompt ATLAS

Usar `02_prompts_atlas_sprint_backend.md` en esta secuencia:

1. Prompt 1 — readiness.
2. Prompt 2 — sprint.
3. Prompt 3 — vertical slice.
4. Prompt 4 — critique/refine.

La clase no debe saltar directamente al prompt de implementación.

## Parte 6 — Revisión cruzada

Otro equipo debe intentar responder:

- ¿qué decisión tuvo que inventar el equipo?
- ¿qué tarea técnica no tiene historia o criterio asociado?
- ¿qué prueba falta?
- ¿qué regla está en el código pero no en la Specification?
- ¿qué pregunta debería bloquear el sprint?

## Entregables

```text
docs/sdd/
├── backend_readiness_gate.md
├── sprint_backend.md
├── matriz_trazabilidad_backend.md
└── preguntas_abiertas.md

docs/prompts/
├── prompt_atlas_readiness.md
├── prompt_atlas_sprint_backend.md
└── prompt_atlas_vertical_slice.md
```

## Definition of Done del taller

El ejercicio termina cuando:

- la historia tiene estado de gate explícito;
- el sprint solo contiene historias `READY` o `READY_WITH_ASSUMPTIONS` aceptadas;
- cada tarea tiene trazabilidad;
- cada historia tiene pruebas previstas;
- los vacíos siguen visibles como preguntas abiertas;
- ningún miembro del equipo necesita adivinar una regla para comenzar a construir.
