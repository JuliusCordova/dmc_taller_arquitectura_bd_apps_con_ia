# Taller práctico — Sesión 05

## Reto

Transformar el modelo conceptual de tu proyecto integrador en un modelo lógico normalizado y trazable.

Trabaja únicamente con información disponible en:

- DMC Application Specification;
- glosario;
- DER conceptual de la Sesión 04;
- reglas de negocio;
- historias o requisitos;
- decisiones confirmadas.

Si falta información, registra una pregunta. No inventes.

---

# Paso 1 — Baseline conceptual

Adjunta o referencia tu DER conceptual y registra:

- entidades confirmadas;
- relaciones;
- cardinalidades;
- preguntas de la Sesión 04 que ya fueron resueltas;
- preguntas aún abiertas.

---

# Paso 2 — Atributos por entidad

Para cada entidad crea una tabla:

| Atributo | Definición | Fuente | Obligatorio lógico | Observaciones |
|---|---|---|---|---|
| | | | | |

Regla: ningún atributo entra al modelo solo porque “sería útil”.

---

# Paso 3 — Identidad

Para cada entidad registra:

| Entidad | Clave candidata | PK lógica propuesta | Justificación | Pendiente |
|---|---|---|---|---|
| | | | | |

Evalúa unicidad, estabilidad y obligatoriedad.

---

# Paso 4 — Resolver relaciones

Revisa cada relación conceptual.

## 1:N

Indica qué entidad mantiene la referencia lógica.

## N:M

Crea la entidad asociativa y explica:

- identidad;
- relaciones;
- atributos propios de la asociación.

## 1:1

Justifica cómo se representará o deja la decisión pendiente si falta información.

---

# Paso 5 — Dependencias funcionales

Escribe las dependencias principales.

Formato:

```text
identificador → atributos dependientes
```

Para entidades asociativas usa, cuando corresponda:

```text
(clave_A, clave_B) → atributos de la relación
```

---

# Paso 6 — Auditoría de normalización

## 1FN

Comprueba:

- ausencia de grupos repetitivos;
- ausencia de columnas numeradas;
- atributos con significado consistente.

## 2FN

Cuando existan claves compuestas, verifica que los atributos no clave dependan de toda la clave.

## 3FN

Busca dependencias entre atributos no clave que representen otro hecho o concepto administrable.

Completa:

| Entidad | Hallazgo | Forma normal | Riesgo | Acción |
|---|---|---|---|---|
| | | | | |

---

# Paso 7 — Buscar anomalías

Selecciona una estructura del modelo y demuestra si podría sufrir:

- anomalía de actualización;
- anomalía de inserción;
- anomalía de eliminación.

Si no encuentras anomalías relevantes, explica por qué el diseño las evita.

---

# Paso 8 — DER lógico

Genera un Mermaid con:

- entidades;
- atributos relevantes;
- PK lógicas;
- FK lógicas;
- relaciones;
- cardinalidades.

No agregar tipos SQL.

---

# Paso 9 — Diccionario de datos

Construye al menos 15 entradas:

| Entidad | Atributo | Definición | Rol | Obligatorio lógico | Fuente | Regla/Pregunta |
|---|---|---|---|---|---|---|
| | | | | | | |

Rol puede ser:

- PK lógica;
- FK lógica;
- clave candidata;
- atributo;
- derivado.

---

# Paso 10 — Trazabilidad

Completa:

| Requisito / historia / regla | Entidad | Atributo o relación | Evidencia | Estado |
|---|---|---|---|---|
| | | | | |

Busca también el sentido inverso:

> ¿Existe alguna entidad o atributo importante que no pueda rastrearse a una necesidad del negocio?

---

# Paso 11 — Auditoría con IA

Ejecuta el prompt ATLAS de la sesión en tres fases:

```text
Generate
→ Critique
→ Refine
```

Clasifica cada recomendación de la IA:

| Recomendación | Confirmada | Rechazada | Requiere información | Evidencia |
|---|---:|---:|---:|---|
| | | | | |

---

# Paso 12 — Actualizar la Specification

Actualiza como mínimo:

- modelo lógico;
- diccionario de datos;
- decisiones de identidad;
- reglas de integridad lógica;
- preguntas abiertas;
- decisiones de normalización;
- trazabilidad.

---

# Entregables

El equipo debe entregar:

1. DER lógico;
2. diccionario de datos;
3. dependencias funcionales relevantes;
4. evidencia de revisión 1FN–3FN;
5. matriz de trazabilidad;
6. prompt ATLAS utilizado;
7. auditoría Generate–Critique–Refine;
8. preguntas pendientes;
9. Specification actualizada.

---

# Criterio de defensa

El docente puede seleccionar cualquier atributo y preguntar:

> ¿Por qué este dato vive aquí?

La respuesta debe explicar su dependencia, su fuente y la regla de negocio que sustenta la decisión.

> Si el equipo no puede explicar la ubicación de un dato, el modelo todavía no está terminado.
