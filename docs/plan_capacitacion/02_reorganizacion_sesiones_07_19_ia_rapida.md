# Reorganización académica — Sesiones 07 a 19

## Motivo

A partir de la Sesión 06, el uso de IA acelera de forma significativa la generación de DDL, scaffolding, pruebas, documentación y código backend. El programa no reduce sus 19 sesiones; cambia la profundidad del aprendizaje.

La segunda mitad deja de medir el aprendizaje por cantidad de código escrito y pasa a medirlo por la capacidad de:

- justificar decisiones;
- identificar riesgos;
- romper soluciones de forma controlada;
- medir comportamiento;
- corregir con evidencia;
- desplegar y operar;
- defender arquitectura y trade-offs.

## Evolución metodológica

```text
Fase 1 — DESIGN IT
Sesiones 1–6
Negocio → Specification → ATLAS → Modelos → PostgreSQL → Backend inicial

Fase 2 — BUILD IT RIGHT
Sesiones 7–13
Arquitectura → Integridad → API → Testing → Performance → Observabilidad → Persistencia políglota

Fase 3 — RUN IT RIGHT
Sesiones 14–18
Eventos → GCP → CI/CD → Analítica → Seguridad y resiliencia

Fase 4 — DEFEND IT
Sesión 19
Architecture Review → Demo → Evidencias → Trade-offs
```

## Patrón de trabajo con IA

La fase de construcción adopta como patrón extendido:

```text
GENERATE
   ↓
CRITIQUE
   ↓
BREAK
   ↓
MEASURE
   ↓
REFINE
   ↓
EVIDENCE
```

### Generate
La IA produce una primera propuesta a partir de la Specification.

### Critique
Se revisa arquitectura, trazabilidad, consistencia y cumplimiento de límites.

### Break
Se diseñan escenarios negativos, fallos, concurrencia, duplicidad, carga o entradas inválidas.

### Measure
Cuando corresponda, se ejecutan pruebas y se obtienen métricas: latencia, errores, throughput, plan de ejecución, cobertura o evidencia de recuperación.

### Refine
Se corrige únicamente aquello sustentado por requisitos, decisiones y evidencia.

### Evidence
El resultado se versiona junto con prompts, pruebas, salidas y decisión de aceptación.

## Mapa reorganizado

| Sesión | Tema | Pregunta de ingeniería |
|---|---|---|
| 7 | Arquitectura software cloud-native GCP | ¿Cómo debe estar organizado el software antes de seguir generando código? |
| 8 | Integridad, transacciones y concurrencia | ¿Cómo evitamos estados imposibles y resultados parciales? |
| 9 | APIs, vertical slices y persistencia | ¿Cómo exponemos casos de uso con contratos estables? |
| 10 | Testing, datos sintéticos y calidad | ¿Cómo demostramos que el incremento funciona y también falla correctamente? |
| 11 | Índices, EXPLAIN y performance | ¿Cómo demostramos que una recomendación de rendimiento realmente mejora? |
| 12 | Observabilidad y diagnóstico | ¿Cómo sabemos qué está ocurriendo en ejecución? |
| 13 | MongoDB y persistencia políglota | ¿Qué datos justifican una persistencia distinta? |
| 14 | Event-driven GCP | ¿Qué desacoplamos y cómo soportamos reintentos y duplicados? |
| 15 | Cloud SQL + Cloud Run | ¿Cómo llevamos el sistema a un entorno cloud real? |
| 16 | CI/CD y releases | ¿Cómo desplegamos de forma repetible y reversible? |
| 17 | BigQuery y analítica | ¿Cómo separamos operación y análisis? |
| 18 | Seguridad, resiliencia y producción | ¿Cómo protegemos y recuperamos el sistema? |
| 19 | Defensa de arquitectura | ¿Podemos demostrar y defender cada decisión end-to-end? |

## Regla académica

> La IA puede disminuir el tiempo de generación, pero no disminuye el estándar de ingeniería. El tiempo recuperado se utiliza para cuestionar, probar, medir y defender el resultado.

## Caso conductor

Durante el inicio de la fase de construcción se mantiene **Siniestro Fácil** como caso conductor para conservar continuidad entre Specification, datos, backend y arquitectura.

La incorporación de otros casos se utiliza principalmente para contrastar decisiones, no para reiniciar el ciclo de aprendizaje.
