# Checklist de evaluación — Prompt Engineering ATLAS

Usar este checklist para autoevaluación, revisión entre equipos y feedback del docente.

## A — Actor

- [ ] El rol está explícito.
- [ ] El rol es relevante para la tarea.
- [ ] El rol modifica la perspectiva de análisis.
- [ ] No utiliza superlativos decorativos sin utilidad.

## T — Tarea

- [ ] La tarea expresa un resultado observable.
- [ ] Utiliza verbos concretos: identificar, extraer, clasificar, validar, generar, comparar o registrar.
- [ ] Indica qué fuentes debe leer.
- [ ] No mezcla múltiples objetivos incompatibles.
- [ ] Define cuándo la tarea puede considerarse terminada.

## L — Límites

- [ ] Define qué fuente es válida.
- [ ] Prohíbe inventar información ausente.
- [ ] Controla cifras y métricas no sustentadas.
- [ ] Controla decisiones técnicas prematuras.
- [ ] Define cómo tratar información faltante.
- [ ] Define cómo tratar contradicciones.
- [ ] Separa hechos de supuestos.
- [ ] Define acciones que no deben ejecutarse automáticamente.

## A — Autovalidación

- [ ] Incluye comprobaciones concretas y no solo “revisa tu respuesta”.
- [ ] Verifica trazabilidad.
- [ ] Verifica ausencia de invenciones.
- [ ] Verifica contradicciones.
- [ ] Verifica calidad de requisitos.
- [ ] Verifica criterios de aceptación.
- [ ] Verifica decisiones técnicas no autorizadas.
- [ ] Identifica preguntas abiertas.

## S — Salida

- [ ] Define formato.
- [ ] Define estructura.
- [ ] Define archivo o artefacto esperado.
- [ ] Define ruta de salida cuando aplica.
- [ ] Define nombres consistentes.
- [ ] Define reporte final.
- [ ] Define qué ocurre ante un bloqueo.

## Trazabilidad SDD

- [ ] Fuente → historia.
- [ ] Historia → requisito.
- [ ] Requisito → criterio.
- [ ] Criterio → prueba futura.
- [ ] Preguntas pendientes permanecen visibles.

## Reutilización

- [ ] Los valores variables están parametrizados.
- [ ] El método está separado del caso específico.
- [ ] Puede utilizarse en otro caso cambiando pocas variables.
- [ ] Las rutas se encuentran claramente identificadas.

## Uso de herramientas

Cuando el prompt interactúa con GitHub, Figma u otras herramientas:

- [ ] Verifica existencia antes de modificar.
- [ ] Lee antes de escribir.
- [ ] Define rama o contexto de trabajo.
- [ ] Describe las acciones permitidas.
- [ ] Evita acciones destructivas no autorizadas.
- [ ] Genera evidencia del trabajo realizado.

## Escala sugerida

| Nivel | Descripción |
|---|---|
| 1 — Básico | Define una tarea, pero deja demasiadas decisiones implícitas. |
| 2 — Estructurado | Actor y tarea claros; salida parcialmente definida. |
| 3 — Controlado | Incluye límites, manejo de vacíos y salida consistente. |
| 4 — Verificable | Incluye autovalidación, trazabilidad y criterios de calidad. |
| 5 — Ingeniería | Es parametrizable, versionable, orientado a herramientas y reutilizable dentro de SDD. |

## Preguntas para revisión cruzada

1. ¿Qué puede inventar todavía la IA con este prompt?
2. ¿Qué información puede interpretar de más?
3. ¿Cómo sabemos que terminó correctamente?
4. ¿Cómo comprobamos que la salida proviene de la fuente?
5. ¿Qué ocurre si falta información?
6. ¿Qué ocurre si dos fuentes se contradicen?
7. ¿El prompt puede reutilizarse en otro proyecto?
8. ¿La salida puede versionarse y revisarse?

> El mejor prompt no es necesariamente el más largo. Es el que reduce la ambigüedad necesaria para ejecutar la tarea y conserva visibles las decisiones que todavía requieren criterio humano.
