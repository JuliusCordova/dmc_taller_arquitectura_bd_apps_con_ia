# Laboratorio por equipos — Specification v0.1

## Organización

Cada equipo trabajará sobre uno de los casos ficticios disponibles en `casos_de_uso`.

| Equipo | Industria | Caso |
|---|---|---|
| 1 | Banca | Crédito Ágil 360 |
| 2 | Seguros | Siniestro Fácil |
| 3 | Retail | Stock Único |

## Meta

Crear una DMC Application Specification v0.1 basada únicamente en la evidencia disponible.

## Secuencia de 60 minutos

### 1. Leer y marcar — 8 min

Identificar frases sobre:

- problemas;
- resultados esperados;
- actores;
- procesos;
- reglas;
- excepciones;
- restricciones;
- atributos de calidad.

### 2. Clasificar — 8 min

Asignar cada frase a una categoría. Una frase puede originar varios elementos, pero cada elemento debe conservar su fuente.

### 3. Detectar vacíos — 7 min

Registrar:

- preguntas abiertas;
- contradicciones;
- términos ambiguos;
- decisiones pendientes.

### 4. Generar borrador con IA — 10 min

Usar el prompt maestro. Entregar las entrevistas completas o fragmentos claramente identificados.

### 5. Revisión humana — 12 min

Eliminar o corregir:

- información inventada;
- soluciones técnicas anticipadas;
- historias sin valor;
- requisitos vagos;
- RNF sin métrica;
- criterios no observables.

### 6. Completar trazabilidad — 8 min

Vincular fuente, historia, requisito y criterio.

### 7. Preparar entrega — 7 min

Seleccionar una cadena completa para explicar en 90 segundos.

## Entregable mínimo

| Elemento | Cantidad mínima |
|---|---:|
| Actores | 3 |
| Proceso principal | 1 |
| Historias de usuario | 5 |
| Requisitos funcionales | 8 |
| Requisitos no funcionales | 5 |
| Reglas de negocio | 5 |
| Criterios de aceptación | 8 |
| Preguntas abiertas | 5 |
| Cadena de trazabilidad completa | 1 |

## Plantilla de historia

```markdown
### HU-XXX-00 — Título

Como [actor], quiero [capacidad], para [valor].

**Fuente:** [entrevista y fragmento]
**Prioridad:** [Must / Should / Could]
**Preguntas abiertas:**
- ...
```

## Plantilla de requisito

```markdown
### RF-XXX-00 — Título

El sistema debe [comportamiento observable] cuando [condición],
produciendo [resultado].

**Actor o sistema:**
**Fuente:**
**Historia relacionada:**
**Prioridad:**
```

## Plantilla de RNF

```markdown
### RNF-XXX-00 — Atributo

En el escenario [contexto], la solución debe alcanzar [métrica y umbral],
validado mediante [método].

**Fuente o estado:** confirmado / pendiente de definición
```

## Plantilla de criterio

```gherkin
Dado [contexto inicial]
Cuando [acción o evento]
Entonces [resultado observable]
```

## Revisión cruzada

El equipo revisor debe responder:

1. ¿Se entiende el problema sin explicación oral?
2. ¿Cada requisito tiene fuente?
3. ¿Las historias expresan valor?
4. ¿Los RNF son medibles o declaran la información pendiente?
5. ¿Los criterios se pueden probar?
6. ¿Hay afirmaciones inventadas por la IA?
7. ¿Las contradicciones son visibles?
8. ¿Se adelantaron tecnologías o arquitectura?

## Definición de terminado

La Specification v0.1 está terminada para esta sesión cuando otro equipo puede:

- entender el alcance;
- identificar qué falta decidir;
- reconstruir el origen de los requisitos;
- diseñar pruebas iniciales;
- iniciar el modelado conceptual sin adivinar el propósito.
