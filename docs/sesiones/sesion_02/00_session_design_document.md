# Session Design Document — Sesión 2

## 1. Identificación

- **Programa:** Arquitectura y Bases de Datos para Apps Modernas con IA
- **Duración:** 180 minutos
- **Título:** De la visión del negocio a una Specification construible
- **Tema:** Specification Engineering con IA
- **Prerrequisito:** Business Vision Canvas y entrevistas de descubrimiento de la sesión 1
- **Artefacto de salida:** DMC Application Specification v0.1

## 2. Pregunta esencial

¿Por qué dos equipos construyen soluciones diferentes después de escuchar al mismo cliente?

## 3. Objetivo general

Transformar evidencia de descubrimiento en una especificación funcional inicial, trazable y verificable, sin inventar información ni adelantar decisiones de arquitectura.

## 4. Resultados de aprendizaje

Al finalizar, el participante podrá:

1. diferenciar necesidad, historia, requisito, regla, restricción y criterio de aceptación;
2. detectar ambigüedades, contradicciones y supuestos;
3. usar IA para clasificar y estructurar evidencia sin delegar la decisión;
4. redactar historias de usuario orientadas a valor;
5. escribir requisitos funcionales y no funcionales medibles;
6. formular criterios de aceptación observables;
7. construir trazabilidad desde la entrevista hasta la Specification.

## 5. Narrativa pedagógica

### Episodio 1 — Construir desde conversaciones es construir desde ambigüedad
**Duración:** 45 min

- Apertura provocadora.
- Demostración de interpretaciones divergentes.
- Taxonomía de elementos de una especificación.
- Antipatrón: pedir a la IA que genere directamente la aplicación.
- Microejercicio de clasificación.

**Evidencia:** clasificación correcta de frases de entrevistas.

### Episodio 2 — Anatomía de la DMC Application Specification
**Duración:** 55 min

- Identidad y contexto del producto.
- Problema, objetivos y métricas.
- Alcance, exclusiones y dependencias.
- Actores, procesos y journeys.
- Historias, RF, RNF, reglas y criterios.
- Preguntas abiertas, decisiones y trazabilidad.
- Demostración con Crédito Ágil 360.

**Evidencia:** primera sección completada en vivo.

### Episodio 3 — Taller: de entrevistas a especificación
**Duración:** 60 min

- Equipos por industria: banca, seguros y retail.
- Extracción de evidencia.
- Generación asistida por IA.
- Revisión humana y eliminación de invenciones.
- Construcción de Specification v0.1.

**Evidencia mínima por equipo:** 3 actores, 1 proceso, 5 historias, 8 RF, 5 RNF, 5 reglas, 8 criterios y 5 preguntas abiertas.

### Episodio 4 — Validación cruzada y cierre
**Duración:** 20 min

- Intercambio entre equipos.
- Revisión por checklist.
- Registro de defectos y dudas.
- Versionado de la Specification.
- Puente hacia la sesión 3.

**Evidencia:** reporte breve de revisión cruzada.

## 6. Distribución de tiempo

| Bloque | Minutos |
|---|---:|
| Apertura y conexión con sesión 1 | 10 |
| Episodio 1 | 35 |
| Episodio 2 | 55 |
| Pausa | 10 |
| Episodio 3 | 60 |
| Episodio 4 | 20 |
| **Total** | **190** |

> Para una sesión estricta de 180 minutos, integrar la apertura dentro del episodio 1 y reducir la demostración del episodio 2 a 45 minutos.

## 7. Versión operativa de 180 minutos

| Tiempo | Actividad |
|---|---|
| 00:00–00:45 | Episodio 1 |
| 00:45–01:40 | Episodio 2 |
| 01:40–01:50 | Pausa |
| 01:50–02:50 | Episodio 3 |
| 02:50–03:00 | Episodio 4 y cierre |

## 8. Metodología

- storytelling tipo TED;
- demostración progresiva;
- aprendizaje basado en casos;
- trabajo colaborativo;
- IA como copiloto sujeto a evidencia;
- validación por pares;
- Spec-Driven Development.

## 9. Criterios de éxito de la sesión

La sesión se considera lograda cuando cada equipo entrega una Specification v0.1 que:

- puede rastrear cada requisito a una fuente;
- separa hechos, supuestos y preguntas;
- no incorpora tecnología prematuramente;
- contiene criterios verificables;
- permite iniciar el modelado de datos en la sesión 3.

## 10. Riesgos didácticos y mitigación

| Riesgo | Mitigación |
|---|---|
| Historias demasiado técnicas | Volver a actor, necesidad y valor |
| IA inventa reglas | Exigir fuente o marcar pregunta abierta |
| Requisitos vagos | Incorporar condición, resultado y evidencia |
| RNF sin métrica | Pedir umbral, contexto y forma de medición |
| Equipos diseñan arquitectura antes de tiempo | Mantener un parking lot de decisiones técnicas |
| Exceso de contenido | Priorizar el flujo completo sobre la cantidad |

## 11. Conexión con la sesión 3

La Specification v0.1 será utilizada para identificar entidades, atributos, relaciones, cardinalidades, estados, eventos y restricciones del modelo de datos.
