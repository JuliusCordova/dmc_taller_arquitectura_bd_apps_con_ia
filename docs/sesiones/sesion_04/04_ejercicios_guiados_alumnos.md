# Sesión 04 — Ejercicios guiados para alumnos

## Del negocio al modelo de datos con IA

Estos ejercicios se realizan con acompañamiento del docente. El objetivo no es dibujar rápido: es aprender a **justificar cada concepto del modelo** a partir de la Specification y de la evidencia del negocio.

La secuencia de trabajo será:

```text
Specification
→ vocabulario del dominio
→ entidades candidatas
→ relaciones
→ cardinalidades
→ DER conceptual
→ auditoría con ATLAS
```

> Regla de la sesión: ninguna entidad, relación o cardinalidad entra al modelo si no puede explicar qué representa y por qué existe.

---

# Ejercicio guiado 1 — ¿Entidad, atributo, estado o evento?

## Objetivo

Aprender a no convertir automáticamente cada sustantivo en una entidad.

## Instrucciones

Clasifica los siguientes conceptos:

```text
Cliente
Pedido
Producto
Fecha
Estado
Entrega
Pago
Precio
Factura
```

Usa una de estas categorías:

- entidad;
- atributo;
- valor;
- estado;
- evento;
- proceso;
- concepto pendiente de validar.

## Trabajo del alumno

Completa:

| Concepto | Clasificación | Justificación | ¿Qué falta validar? |
|---|---|---|---|
| Cliente |  |  |  |
| Pedido |  |  |  |
| Producto |  |  |  |
| Fecha |  |  |  |
| Estado |  |  |  |
| Entrega |  |  |  |
| Pago |  |  |  |
| Precio |  |  |  |
| Factura |  |  |  |

## Preguntas de control

1. ¿Tiene identidad propia?
2. ¿Necesito guardar varias ocurrencias de este concepto?
3. ¿Se relaciona con otros conceptos?
4. ¿Solo describe a otra entidad?
5. ¿Representa un cambio ocurrido en el tiempo?

## Entregable

Tabla completada + explicación de al menos dos conceptos ambiguos.

---

# Ejercicio guiado 2 — Del requerimiento a los conceptos del dominio

## Caso

```text
Un asegurado registra un siniestro.
El siniestro puede tener múltiples evidencias.
Un taller presenta un presupuesto.
El presupuesto puede ser observado antes de autorizar la reparación.
```

## Instrucciones

### Paso 1 — Subraya sustantivos

Identifica conceptos candidatos.

### Paso 2 — Subraya verbos

Identifica relaciones o acciones del negocio.

### Paso 3 — Detecta restricciones

Busca expresiones como:

- uno;
- varios;
- puede;
- debe;
- antes de;
- solo si.

### Paso 4 — Clasifica

Completa:

| Elemento | Tipo candidato | Evidencia textual | Estado |
|---|---|---|---|
|  |  |  | Confirmado / Pendiente |

## Resultado esperado

No se espera todavía un DER perfecto. Se espera una lista defendible de conceptos y preguntas.

---

# Ejercicio guiado 3 — Una relación necesita un verbo

## Problema

Estas relaciones no expresan hechos del negocio:

```text
Cliente ---- Pedido
Siniestro ---- Evidencia
Taller ---- Presupuesto
Póliza ---- Vehículo
```

## Tarea

Reescribe cada relación como una frase.

Ejemplo:

```text
Cliente REALIZA Pedido
```

Completa:

| Concepto A | Verbo de negocio | Concepto B | Fuente |
|---|---|---|---|
| Cliente |  | Pedido |  |
| Siniestro |  | Evidencia |  |
| Taller |  | Presupuesto |  |
| Póliza |  | Vehículo |  |

## Regla

Si no puedes nombrar el verbo, probablemente todavía no entiendes la relación.

---

# Ejercicio guiado 4 — Cardinalidad sin memorizar símbolos

## Caso

```text
Un asegurado puede reportar varios siniestros.
Cada siniestro corresponde a una póliza vigente.
Un siniestro puede tener múltiples evidencias.
```

## Método obligatorio

Para cada lado responde primero:

### Mínimo

> ¿Puede existir A sin B?

### Máximo

> ¿Cuántos B puede tener A?

## Completa

| Relación | Mínimo A | Máximo A | Mínimo B | Máximo B | Evidencia |
|---|---:|---:|---:|---:|---|
| Asegurado — Siniestro |  |  |  |  |  |
| Póliza — Siniestro |  |  |  |  |  |
| Siniestro — Evidencia |  |  |  |  |  |

## Regla

No uses 1:N, 0..N o 1..1 hasta terminar las preguntas de mínimo y máximo.

---

# Ejercicio guiado 5 — Opcionalidad

## Objetivo

Comprender que la cardinalidad mínima representa obligatoriedad.

## Tarea

Para cada relación del ejercicio anterior responde:

1. ¿Puede existir A sin B?
2. ¿Puede existir B sin A?
3. ¿Qué cambia si la respuesta es sí?
4. ¿Qué pregunta debería hacerse al negocio si no está claro?

## Entregable

Lista de relaciones con su opcionalidad y preguntas pendientes.

---

# Ejercicio guiado 6 — Descubrir una relación N:M

## Caso

```text
Un accidente puede involucrar varios participantes.
Una persona puede aparecer en distintos accidentes.
```

## Tarea

Responde:

1. ¿Cuántas personas puede tener un accidente?
2. ¿En cuántos accidentes puede participar una persona?
3. ¿Existe una relación N:M?
4. ¿La relación tiene significado propio?
5. ¿Podría emerger el concepto `Participación`?
6. ¿Qué datos necesitarías conocer antes de convertirlo en entidad?

## Restricción

No inventes atributos de `Participación`.

## Aprendizaje esperado

Una entidad asociativa no nace porque “así se hace en SQL”; nace porque la relación representa un hecho del negocio que puede necesitar identidad o datos propios.

---

# Ejercicio guiado 7 — Auditar lo que propone la IA

## Modelo generado por IA

```text
Cliente
Siniestro
Fraude
IA
Foto
Documento
Estado
Pago
```

## Instrucciones

Clasifica cada elemento como:

- mantener como entidad;
- convertir en atributo/tipo/estado;
- eliminar por ser tecnología;
- dejar pendiente de validación.

## Preguntas de auditoría

- ¿Fraude es una entidad o un resultado/condición?
- ¿IA pertenece al dominio del negocio?
- ¿Foto y Documento son entidades independientes o tipos de Evidencia?
- ¿Estado necesita identidad propia?
- ¿Pago está suficientemente sustentado?

## Entregable

Tabla de auditoría:

| Elemento IA | Decisión | Justificación | Fuente/Pregunta |
|---|---|---|---|

---

# Ejercicio guiado 8 — Conceptual, lógico o físico

## Diagrama A

```text
Cliente REALIZA Pedido
Pedido CONTIENE Producto
```

## Diagrama B

```text
CLIENTE
cliente_id PK

PEDIDO
pedido_id PK
cliente_id FK
```

## Diagrama C

```text
cliente_id UUID PRIMARY KEY
correo VARCHAR(150) UNIQUE NOT NULL
```

## Tarea

Clasifica cada uno:

- conceptual;
- lógico;
- físico.

Luego responde:

1. ¿Qué pregunta responde cada nivel?
2. ¿Qué decisiones nuevas aparecen de A → B?
3. ¿Qué decisiones nuevas aparecen de B → C?
4. ¿Qué decisiones NO debemos tomar todavía en la Sesión 4?

---

# Ejercicio guiado 9 — Generate → Critique → Refine

Este ejercicio conecta directamente con la Sesión 3 de Prompt Engineering ATLAS.

## Generate

Usa:

```text
Genera un modelo conceptual desde la DMC Application Specification.
```

Guarda el resultado inicial.

## Critique

Ejecuta una segunda instrucción:

```text
Audita el modelo conceptual generado.

Detecta exclusivamente:
- entidades sin fuente;
- relaciones sin verbo;
- cardinalidades inventadas;
- atributos convertidos en entidades;
- estados convertidos en entidades;
- conceptos tecnológicos;
- duplicados semánticos.

No corrijas todavía.
```

## Refine

```text
Corrige únicamente los hallazgos confirmados.
No completes vacíos con conocimiento general.
Convierte las dudas en preguntas abiertas.
```

## Entregable

| Hallazgo | Modelo inicial | Corrección | Evidencia |
|---|---|---|---|

---

# Cierre de los ejercicios guiados

Antes de pasar al taller práctico, debes poder responder:

- ¿qué hace que un concepto sea una entidad?;
- ¿qué diferencia un atributo de una entidad?;
- ¿por qué una relación necesita un verbo?;
- ¿cómo se obtiene una cardinalidad?;
- ¿qué significa opcionalidad?;
- ¿cuándo aparece una N:M?;
- ¿qué diferencia conceptual, lógico y físico?;
- ¿qué parte puede proponer la IA y qué parte debes validar tú?.
