# Plan de ejercicios — Sesión 04

## Objetivo

Desarrollar criterio de modelado, no solo habilidad para dibujar diagramas.

Los ejercicios progresan desde clasificación de conceptos hasta construcción y auditoría de un DER conceptual usando ATLAS.

---

# Ejercicios guiados con el docente

## Ejercicio 1 — Detectar qué es qué

Clasificar:

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

Categorías posibles:

- entidad;
- atributo;
- valor;
- estado;
- evento;
- proceso;
- concepto pendiente de validar.

### Pregunta docente

> ¿Qué evidencia necesitaríamos para decidir los casos ambiguos?

---

## Ejercicio 2 — Del requerimiento a conceptos

Texto:

```text
Un asegurado registra un siniestro.
El siniestro puede tener múltiples evidencias.
Un taller presenta un presupuesto.
El presupuesto puede ser observado antes de autorizar la reparación.
```

Extraer:

- sustantivos;
- verbos;
- restricciones;
- posibles entidades;
- estados/eventos;
- preguntas.

---

## Ejercicio 3 — Relaciones con verbo

Corregir:

```text
Cliente ---- Pedido
Siniestro ---- Evidencia
Taller ---- Presupuesto
Póliza ---- Vehículo
```

Convertir cada línea en un hecho del negocio.

---

## Ejercicio 4 — Cardinalidad justificada

Caso:

```text
Un asegurado puede reportar varios siniestros.
Cada siniestro corresponde a una póliza vigente.
Un siniestro puede tener múltiples evidencias.
```

Completar:

```text
Asegurado ? Siniestro
Póliza ? Siniestro
Siniestro ? Evidencia
```

Para cada cardinalidad escribir la evidencia que la justifica.

---

## Ejercicio 5 — Opcionalidad

Preguntar para cada relación:

- ¿puede existir A sin B?;
- ¿puede existir B sin A?;
- ¿cuántos puede tener como máximo?.

El objetivo es obtener mínimos y máximos antes de elegir símbolos.

---

## Ejercicio 6 — Descubrir una N:M

Caso:

```text
Un accidente puede involucrar varios participantes.
Una persona puede aparecer en distintos accidentes.
```

Preguntas:

1. ¿Existe una relación N:M?
2. ¿la relación tiene significado propio?
3. ¿podría emerger un concepto Participación?
4. ¿qué información falta para justificarlo?

No inventar atributos.

---

## Ejercicio 7 — Auditar un modelo generado por IA

Modelo propuesto:

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

Revisar:

- ¿Fraude es entidad, concepto, resultado o estado?;
- ¿IA pertenece al dominio o es tecnología?;
- ¿Foto y Documento podrían ser tipos de Evidencia?;
- ¿Estado necesita identidad propia?;
- ¿Pago está suficientemente sustentado?.

---

## Ejercicio 8 — DER conceptual vs lógico

Mostrar dos diagramas del mismo dominio y pedir al alumno identificar el nivel.

### Diagrama A

```text
Cliente REALIZA Pedido
Pedido CONTIENE Producto
```

### Diagrama B

```text
CLIENTE
cliente_id PK

PEDIDO
pedido_id PK
cliente_id FK
```

Preguntar qué decisiones nuevas aparecen en B.

---

## Ejercicio 9 — Generate → Critique → Refine

### Generate

```text
Genera un modelo conceptual desde la Specification.
```

### Critique

```text
Audita el modelo y detecta:
- entidades sin fuente;
- relaciones sin verbo;
- cardinalidades inventadas;
- atributos convertidos en entidades;
- estados convertidos en entidades;
- decisiones tecnológicas prematuras.
```

### Refine

```text
Corrige únicamente los hallazgos confirmados.
No completes vacíos con conocimiento general.
```

---

# Taller práctico por equipos

Cada equipo trabaja con su caso real: Banca, Seguros o Retail.

## Paso 1 — Extraer vocabulario

Construir un listado inicial de 8 a 15 conceptos.

## Paso 2 — Clasificar

Para cada concepto marcar:

- entidad;
- atributo;
- actor;
- evento;
- estado;
- regla;
- pendiente.

## Paso 3 — Justificar entidades

Cada entidad debe tener:

- definición;
- fuente;
- razón de existencia.

## Paso 4 — Definir relaciones

Cada relación debe:

- tener verbo;
- poder leerse como frase de negocio;
- tener fuente.

## Paso 5 — Cardinalidades

Cada cardinalidad debe indicar:

- mínimo;
- máximo;
- evidencia;
- estado: confirmada o pendiente.

## Paso 6 — DER conceptual

Crear el primer diagrama en Mermaid.

## Paso 7 — Preguntas abiertas

Generar al menos tres preguntas que bloqueen o puedan cambiar el modelo.

## Paso 8 — Trazabilidad

Crear matriz:

| Entidad/Relación | Fuente | Historia/RF/Regla | Estado |
|---|---|---|---|

## Paso 9 — Prompt ATLAS

Guardar el prompt utilizado para generar/auditar el modelo.

---

# Mini reto final — Romper un modelo incorrecto

Modelo:

```text
Cliente
   ↓
Email
   ↓
Pedido
   ↓
Estado
   ↓
Producto
```

El alumno debe detectar al menos cinco problemas.

Preguntas guía:

1. ¿Email tiene identidad propia?
2. ¿Estado es necesariamente entidad?
3. ¿qué verbo relaciona Cliente y Pedido?
4. ¿qué cardinalidades faltan?
5. ¿Producto está correctamente conectado?;
6. ¿hay una N:M oculta?;
7. ¿qué parte es evidencia y qué parte es inferencia?.

---

# Definition of Done del taller

El equipo termina cuando:

- cada entidad tiene significado;
- cada entidad tiene fuente;
- cada relación tiene verbo;
- cada cardinalidad tiene evidencia o pregunta;
- las N:M relevantes fueron identificadas;
- la opcionalidad está explícita;
- estados y atributos no fueron convertidos en entidades sin justificación;
- no existen tipos SQL ni decisiones de motor;
- el DER puede explicarse en lenguaje de negocio;
- el Prompt ATLAS quedó versionado;
- la Specification quedó actualizada con decisiones y preguntas.
