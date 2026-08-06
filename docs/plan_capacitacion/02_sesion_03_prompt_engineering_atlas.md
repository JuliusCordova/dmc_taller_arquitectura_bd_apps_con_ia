# Sesión 3 — Prompt Engineering ATLAS para desarrollar aplicaciones con IA

## 1. Información general

- **Duración:** 3 horas.
- **Modalidad:** teórico-práctica.
- **Metodología:** aprendizaje progresivo, demostración comparativa y taller por equipos.
- **Fuente de verdad:** DMC Application Specification.
- **Framework:** ATLAS.
- **Casos sugeridos:** banca, seguros y retail.

## 2. Propósito

Que los participantes pasen de escribir pedidos informales a construir prompts de ingeniería capaces de leer evidencia, generar artefactos SDD, controlar invenciones, autovalidar resultados y escribir salidas versionables en GitHub.

La sesión funciona como puente entre Specification Engineering y el modelado de datos asistido por IA.

## 3. Tesis central

> Un buen prompt de desarrollo no consiste en pedir más. Consiste en definir quién trabaja, qué debe hacer, qué límites tiene, cómo se valida y qué debe entregar.

## 4. Resultados de aprendizaje

Al finalizar, el participante podrá:

1. Diferenciar pregunta, instrucción y prompt de ingeniería.
2. Construir prompts desde un nivel básico hasta uno ejecutable.
3. Aplicar Actor, Tarea, Límites, Autovalidación y Salida.
4. Definir fuentes permitidas y rutas de entrada y salida.
5. Evitar invenciones y falsa precisión.
6. Convertir vacíos en preguntas abiertas.
7. Preservar contradicciones y supuestos.
8. Parametrizar un prompt para reutilizarlo.
9. Integrar GitHub y Figma como herramientas de salida.
10. Versionar, comparar y mejorar prompts.

## 5. Framework ATLAS

### A — Actor

Define el rol profesional desde el cual debe trabajar la IA.

```text
Actúa como Arquitecto de Soluciones Senior,
Analista de Negocio y especialista en SDD.
```

### T — Tarea

Define el trabajo concreto y verificable.

```text
Lee las entrevistas y construye una primera
DMC Application Specification.
```

### L — Límites

Controla las fuentes, el alcance y aquello que no puede inventarse.

```text
Utiliza únicamente las entrevistas.
No inventes cifras, reglas, tecnologías, integraciones ni SLA.
Cuando falte información, crea una pregunta abierta.
```

### A — Autovalidación

Indica cómo debe revisar su resultado antes de entregarlo.

```text
Verifica que cada requisito tenga fuente,
que los criterios sean verificables y
que no se hayan adelantado decisiones técnicas.
```

### S — Salida

Define formato, artefactos, ruta y criterio de finalización.

```text
Escribe los documentos Markdown en la ruta indicada,
crea una rama y abre un Pull Request sin fusionarlo.
```

## 6. Progresión pedagógica

### Nivel 1 — Prompt informal

```text
Diseña una aplicación para gestionar siniestros.
```

### Nivel 2 — Tarea con contexto

```text
Lee las entrevistas de Siniestro Fácil e identifica
actores, procesos, objetivos y restricciones.
```

### Nivel 3 — Límites

```text
No inventes reglas, cifras, integraciones ni tecnologías.
Cuando falte información, crea una pregunta abierta.
```

### Nivel 4 — Trazabilidad

```text
Cada elemento debe indicar su entrevista de origen.
```

### Nivel 5 — Autovalidación

```text
Revisa el resultado como auditor SDD e identifica
invenciones, ambigüedades y requisitos sin fuente.
```

### Nivel 6 — Salida estructurada

```text
Genera historias, requisitos, reglas, criterios y preguntas
en archivos Markdown separados.
```

### Nivel 7 — Parametrización

```text
INTERVIEW_FILE=<ruta>
OUTPUT_PATH=<ruta>
BRANCH_NAME=<rama>
FIGMA_PROJECT=<proyecto>
```

### Nivel 8 — Herramientas

```text
Lee el archivo, crea la rama, escribe los documentos,
valida la consistencia y abre un Pull Request.
```

## 7. Agenda de tres horas

| Bloque | Duración | Actividad |
|---|---:|---|
| Apertura | 15 min | Demostración de un prompt ambiguo y análisis de errores |
| Conceptos base | 20 min | Pregunta vs. instrucción vs. prompt de ingeniería |
| Framework ATLAS | 35 min | Explicación de los cinco componentes |
| Construcción progresiva | 30 min | Evolución en vivo de un prompt básico |
| Pausa | 10 min | — |
| Técnicas intermedias | 25 min | Variables, delimitadores, ejemplos y descomposición |
| Técnicas avanzadas | 25 min | Generate–Critique–Refine, herramientas y versionamiento |
| Taller práctico | 30 min | Construcción y ejecución por equipos |
| Validación y cierre | 10 min | Comparación, evidencias y actualización del Spec |

## 8. Demostración inicial

Ejecutar:

```text
Diseña una aplicación para gestionar siniestros vehiculares.
```

Analizar con el grupo:

- funcionalidades inventadas;
- tecnologías seleccionadas sin evidencia;
- actores o estados no confirmados;
- métricas o SLA ficticios;
- mezcla de MVP y visión futura;
- ausencia de preguntas abiertas;
- dificultad para comprobar la respuesta.

Mensaje clave:

> Una respuesta convincente no necesariamente es una respuesta correcta.

## 9. Técnicas intermedias

### Variables

```text
SOLUTION_NAME=<nombre>
INTERVIEW_FILE=<ruta>
OUTPUT_PATH=<ruta>
BRANCH_NAME=<rama>
```

### Delimitadores

```text
<fuente>
Contenido autorizado
</fuente>

<limites>
No inventar información
</limites>

<salida>
Artefactos requeridos
</salida>
```

### Few-shot de formato

```text
HU-001
Como <actor>,
quiero <capacidad>,
para <valor>.
Fuente: <referencia>
Estado: Draft
```

### Descomposición

1. Leer.
2. Extraer evidencia.
3. Clasificar.
4. Generar.
5. Criticar.
6. Refinar.
7. Escribir.
8. Validar.

## 10. Técnica avanzada: Generate–Critique–Refine

### Generate

```text
Genera el borrador utilizando únicamente las entrevistas.
```

### Critique

```text
Revisa el borrador como auditor SDD.
Identifica invenciones, contradicciones, ambigüedades,
requisitos sin fuente y criterios no verificables.
No corrijas silenciosamente.
```

### Refine

```text
Corrige únicamente los hallazgos confirmados.
Mantén las decisiones pendientes como preguntas abiertas.
```

## 11. Taller práctico

Cada equipo debe construir un prompt ATLAS para su caso.

El prompt debe producir:

- los 12 bloques de la Specification;
- historias de usuario;
- RF y RNF;
- reglas de negocio;
- criterios de aceptación;
- preguntas abiertas;
- ruta de salida GitHub;
- indicaciones para un prototipo Figma.

### Primera versión

```text
prompts/prompt_atlas_v1.md
```

### Segunda versión

```text
prompts/prompt_atlas_v1_1.md
```

### Evidencia comparativa

```text
prompts/execution_evidence.md
```

## 12. Entregables

```text
prompts/
├── prompt_atlas_v1.md
├── prompt_atlas_v1_1.md
├── validation_checklist.md
└── execution_evidence.md
```

Además, cada equipo debe dejar la Specification generada en estado `Draft` dentro de la ruta correspondiente a su caso.

## 13. Checklist de revisión cruzada

- [ ] El Actor es relevante.
- [ ] La Tarea es verificable.
- [ ] La fuente permitida está definida.
- [ ] Los Límites evitan invenciones.
- [ ] Los vacíos se convierten en preguntas.
- [ ] Las contradicciones permanecen visibles.
- [ ] La Autovalidación comprueba trazabilidad.
- [ ] La Salida define archivos y ruta.
- [ ] El flujo GitHub está controlado.
- [ ] Figma tiene proyecto y nombre definidos.
- [ ] Existe un criterio de finalización.
- [ ] El Pull Request no se fusiona automáticamente.

## 14. Evaluación sugerida

| Criterio | Peso |
|---|---:|
| Actor y tarea claramente definidos | 15% |
| Límites contra invenciones | 20% |
| Autovalidación | 20% |
| Salida estructurada | 15% |
| Trazabilidad | 15% |
| Comparación v1 vs. v1.1 | 10% |
| Versionamiento en GitHub | 5% |

## 15. Definition of Done

El equipo completa la sesión cuando:

- construye un prompt con los cinco componentes ATLAS;
- utiliza variables de entrada y salida;
- define la fuente autorizada;
- evita inventar información;
- convierte vacíos en preguntas;
- incluye autovalidación;
- define archivos y ruta;
- ejecuta dos versiones;
- compara resultados;
- versiona prompts en GitHub;
- conserva la Specification como Draft;
- actualiza el plan vivo del proyecto.

## 16. Actualización del Spec al cierre

Registrar:

- prompt utilizado;
- versión del prompt;
- artefactos generados;
- errores encontrados;
- límites agregados;
- preguntas abiertas nuevas;
- decisiones pendientes;
- siguiente gate: modelo conceptual.
