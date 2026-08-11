# Sesión 03 — Prompt Engineering ATLAS para desarrollo de aplicaciones con IA

## Propósito

Desarrollar la capacidad de construir prompts de ingeniería que permitan trabajar con IA de forma controlada, trazable y verificable dentro de un flujo de Spec-Driven Development.

La sesión utiliza el framework **ATLAS**:

- **A — Actor:** desde qué rol debe trabajar la IA.
- **T — Tarea:** qué trabajo concreto debe realizar.
- **L — Límites:** qué puede y qué no puede hacer.
- **A — Autovalidación:** cómo debe revisar su resultado antes de entregarlo.
- **S — Salida:** qué debe producir, en qué formato y dónde.

## Objetivo de aprendizaje

Al finalizar, el alumno debe ser capaz de pasar de una instrucción ambigua a un prompt profesional que:

1. defina una fuente de verdad;
2. establezca un rol útil;
3. describa una tarea observable;
4. controle invenciones y decisiones prematuras;
5. convierta vacíos en preguntas abiertas;
6. incluya una fase de autovalidación;
7. defina una salida estructurada;
8. pueda reutilizarse mediante variables;
9. pueda operar sobre archivos y repositorios;
10. produzca artefactos compatibles con SDD.

## Material de la sesión

| Archivo | Uso |
|---|---|
| `01_ejercicios_guiados_atlas.md` | Ejercicios desarrollados con el docente, desde prompt básico hasta ATLAS completo. |
| `02_ejercicios_practicos_atlas.md` | Ejercicios individuales o por equipos para desarrollar la capacidad. |
| `03_retos_avanzados_prompt_engineering.md` | Retos de mayor dificultad: crítica, parametrización, tool use y SDD. |
| `04_checklist_evaluacion_prompt.md` | Checklist para revisión cruzada y autoevaluación. |

## Dinámica sugerida

```text
Prompt simple
   ↓
Detectar fallas
   ↓
Agregar Actor + Tarea
   ↓
Agregar Límites
   ↓
Agregar Autovalidación
   ↓
Definir Salida
   ↓
Parametrizar
   ↓
Conectar con GitHub / archivos
   ↓
Comparar v1 vs v1.1
```

## Entregables de los alumnos

Cada equipo debe generar:

```text
prompts/
├── prompt_atlas_v1.md
├── prompt_atlas_v1_1.md
├── validation_checklist.md
└── execution_evidence.md
```

El objetivo no es producir el prompt más largo. El objetivo es producir una instrucción suficientemente precisa para que la IA pueda ejecutar una tarea sin completar silenciosamente lo que no conoce.

> Una respuesta convincente no necesariamente es una respuesta correcta. En desarrollo asistido por IA, la calidad del resultado depende de cómo definimos evidencia, límites, validación y salida.
