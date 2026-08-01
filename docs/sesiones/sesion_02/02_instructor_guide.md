# Guía del instructor — Sesión 2

## Propósito

Conducir a los participantes desde entrevistas y visión de producto hacia una DMC Application Specification v0.1, manteniendo a la IA bajo reglas de evidencia y trazabilidad.

## Preparación previa

- Revisar los tres casos ficticios: banca, seguros y retail.
- Tener disponibles las entrevistas y el Business Vision Canvas de la sesión 1.
- Preparar una copia editable de la plantilla DMC Application Specification.
- Definir equipos y asignar una industria a cada uno.
- Tener listo un LLM para la demostración.
- Abrir el caso Crédito Ágil 360 como ejemplo principal.

## Guion por episodio

### Episodio 1 — 45 minutos

**0–5 min — Apertura**

Preguntar: “¿Por qué dos equipos construyen soluciones diferentes después de escuchar al mismo cliente?” No responder de inmediato. Recoger dos o tres hipótesis.

**5–15 min — Divergencia**

Mostrar una misma frase de negocio y dos interpretaciones técnicas incompatibles. Concluir: el código amplifica una decisión anterior.

**15–30 min — Taxonomía**

Explicar necesidad, objetivo, historia, requisito funcional, RNF, regla, restricción y criterio de aceptación. Pedir un ejemplo a la audiencia por categoría.

**30–40 min — IA y falsa precisión**

Demostrar una respuesta genérica del LLM y luego exigir fuente, separación de categorías y preguntas abiertas.

**40–45 min — Microejercicio**

Clasificación rápida de cinco frases. Corregir oralmente.

### Episodio 2 — 55 minutos

**45–55 min — Fuente de verdad**

Explicar que la Specification conecta negocio, UX, datos, API, pruebas, seguridad y despliegue.

**55–75 min — Bloques 1 a 6**

Identidad, contexto, objetivos, alcance, actores y procesos.

**75–95 min — Bloques 7 a 12**

Historias, RF, RNF, reglas, criterios, preguntas y decisiones.

**95–100 min — Trazabilidad**

Construir una cadena visible: entrevista → HU → RF → CA → prueba → evidencia.

**100–110 min — Demostración**

Completar en vivo una historia del caso Crédito Ágil 360. Rechazar cualquier dato no respaldado.

### Pausa — 10 minutos

### Episodio 3 — 60 minutos

**120–130 min — Instrucciones**

Explicar el entregable mínimo y el flujo de seis pasos.

**130–165 min — Trabajo de equipos**

Circular entre grupos. Preguntas de coaching:

- ¿Dónde está la fuente de este requisito?
- ¿Esto es necesidad o solución?
- ¿Cómo se puede probar?
- ¿Qué dato falta?
- ¿Qué contradicción no está registrada?
- ¿Qué decisión técnica están adelantando?

**165–175 min — Consolidación**

Cada equipo selecciona una cadena de trazabilidad completa para compartir.

### Episodio 4 — 10 minutos

**175–180 min — Revisión y cierre**

Intercambio rápido, un hallazgo por equipo y puente hacia el modelado de datos.

## Frases clave del docente

- “La IA puede redactar; la evidencia decide.”
- “Cuando la información falta, no se inventa: se pregunta.”
- “Una historia explica valor; un requisito define comportamiento.”
- “Un criterio que no puede observarse no puede aceptarse.”
- “La Specification no congela el cambio; hace visible su impacto.”

## Señales de alerta

- tecnologías mencionadas dentro de historias;
- adjetivos sin métricas: rápido, seguro, escalable, intuitivo;
- reglas redactadas como interfaces;
- criterios que repiten el requisito;
- actores genéricos como “usuario” cuando existen roles distintos;
- requisitos sin fuente;
- IA que introduce cifras o políticas inexistentes.

## Evaluación formativa

| Criterio | Peso |
|---|---:|
| Trazabilidad a fuentes | 25% |
| Separación correcta de categorías | 20% |
| Claridad y verificabilidad | 20% |
| Identificación de preguntas y contradicciones | 15% |
| Coherencia del proceso e historias | 10% |
| Calidad de revisión humana sobre IA | 10% |

## Cierre sugerido

“Hoy dejamos de programar desde una página en blanco. En la próxima sesión, cada historia y cada regla comenzará a convertirse en entidades, relaciones, estados y restricciones de datos.”
