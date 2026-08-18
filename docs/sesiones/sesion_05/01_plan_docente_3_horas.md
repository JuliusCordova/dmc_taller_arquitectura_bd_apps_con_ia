# Plan docente — Sesión 05

## Del modelo conceptual al modelo lógico normalizado con IA

**Duración:** 3 horas  
**Metodología:** explicación + demostración + ejercicios guiados + taller por equipos + auditoría cruzada  
**Marco:** Spec-Driven Development + ATLAS

---

# 1. Apertura — 0 a 15 min

## Pregunta de impacto

> ¿Un DER bonito garantiza una base de datos correcta?

Mostrar dos estructuras que parecen representar el mismo negocio, pero una mezcla datos de cliente, pedido y producto en una sola estructura repetitiva.

Preguntar:

- ¿qué pasa si cambia el correo del cliente?;
- ¿cuántas veces debemos actualizarlo?;
- ¿qué pasa si eliminamos el último pedido?;
- ¿podemos registrar un producto antes de que se venda?;

Introducir las anomalías de actualización, inserción y eliminación.

## Conexión con Sesión 04

```text
Sesión 04: ¿qué existe y cómo se relaciona?
Sesión 05: ¿cómo organizamos esos conceptos sin contradicciones ni redundancia injustificada?
```

Reforzar:

> El modelo conceptual representa hechos del negocio. El modelo lógico organiza esos hechos como estructuras de datos.

---

# 2. Transformar conceptual → lógico — 15 a 35 min

Trabajar las reglas de transformación:

1. cada entidad conceptual confirmada se evalúa como entidad lógica;
2. aparecen atributos sustentados por requisitos;
3. cada entidad necesita identidad;
4. una relación 1:N se representa mediante una referencia lógica hacia el lado 1;
5. una relación N:M normalmente requiere una entidad asociativa;
6. los atributos de una relación pertenecen a la entidad asociativa;
7. la opcionalidad debe conservarse;
8. no se introducen todavía decisiones físicas.

Ejemplo:

```text
Conceptual:
Cliente REALIZA Pedido
Pedido CONTIENE Producto

Lógico:
CLIENTE
- cliente_id [PK lógica]
- nombre
- correo

PEDIDO
- pedido_id [PK lógica]
- fecha
- cliente_id [FK lógica]

PRODUCTO
- producto_id [PK lógica]
- nombre

DETALLE_PEDIDO
- pedido_id [PK/FK lógica]
- producto_id [PK/FK lógica]
- cantidad
- precio_aplicado
```

Pregunta:

> ¿Por qué cantidad no pertenece a Pedido ni a Producto?

Respuesta esperada: depende de la combinación Pedido + Producto.

---

# 3. Atributos, identidad y dependencias — 35 a 55 min

## Atributos

Un atributo debe:

- tener significado de negocio;
- pertenecer a una entidad concreta;
- tener fuente o justificación;
- poder explicarse con una dependencia.

## Identidad

Distinguir:

- clave candidata;
- clave natural o de negocio;
- clave primaria lógica;
- clave foránea lógica.

Aclarar que todavía no se decide `UUID`, `BIGINT`, longitud o tipo físico.

## Dependencia funcional

Introducir la pregunta pedagógica principal:

> ¿De qué depende este dato?

Ejemplos:

```text
cliente_id → nombre, correo
pedido_id → fecha, cliente_id
producto_id → nombre, categoria_id
(pedido_id, producto_id) → cantidad, precio_aplicado
```

Mensaje docente:

> Normalizar empieza preguntando por dependencias, no memorizando formas normales.

---

# 4. Primera forma normal — 55 a 75 min

## Idea central

Una fila debe representar una ocurrencia y cada atributo debe contener un valor coherente con el diseño, evitando grupos repetitivos.

Caso incorrecto:

```text
PEDIDO
pedido_id
cliente
producto_1
cantidad_1
producto_2
cantidad_2
producto_3
cantidad_3
```

Problemas:

- número artificialmente limitado de productos;
- columnas repetitivas;
- consultas y validaciones complejas;
- dificultad para mantener integridad.

Transformación:

```text
PEDIDO
DETALLE_PEDIDO
PRODUCTO
```

Ejercicio rápido: detectar tres violaciones o síntomas de mala estructura.

---

# 5. Segunda forma normal — 75 a 95 min

Aplicar especialmente a entidades con clave compuesta.

Caso:

```text
DETALLE_PEDIDO
pedido_id
producto_id
fecha_pedido
nombre_producto
cantidad
precio_aplicado
```

Clave lógica:

```text
(pedido_id, producto_id)
```

Preguntar:

- ¿fecha_pedido depende de toda la clave o solo de `pedido_id`?;
- ¿nombre_producto depende de toda la clave o solo de `producto_id`?;
- ¿cantidad depende de la combinación completa?.

Conclusión:

```text
PEDIDO(pedido_id, fecha_pedido)
PRODUCTO(producto_id, nombre_producto)
DETALLE_PEDIDO(pedido_id, producto_id, cantidad, precio_aplicado)
```

Mensaje docente:

> Si un atributo depende solo de una parte de una clave compuesta, probablemente está en la entidad equivocada.

---

# 6. Tercera forma normal — 95 a 110 min

Caso:

```text
CLIENTE
cliente_id
nombre
ciudad_id
ciudad_nombre
pais_nombre
```

Preguntar:

```text
cliente_id → ciudad_id
ciudad_id → ciudad_nombre
ciudad_id → pais_id
pais_id → pais_nombre
```

Identificar dependencias transitivas y separar conceptos cuando el negocio necesita gestionarlos de forma independiente.

Advertencia:

> No convertir automáticamente todo valor repetido en una entidad. La separación debe tener significado, identidad y necesidad de negocio.

---

# 7. Pausa — 110 a 120 min

---

# 8. Cuándo desnormalizar — 120 a 135 min

Aclarar que tercera forma normal es una excelente base de diseño, pero no un dogma.

Solo discutir desnormalización cuando exista una razón explícita, por ejemplo:

- patrón de lectura dominante;
- latencia demostrada;
- volumen o costo de joins medido;
- simplificación operacional justificada;
- modelo especializado de lectura.

Toda desnormalización debe registrar:

- motivo;
- dato duplicado;
- fuente autoritativa;
- mecanismo de sincronización;
- riesgo de inconsistencia;
- evidencia que justifica el trade-off.

No optimizar prematuramente.

---

# 9. Diccionario de datos y trazabilidad — 135 a 150 min

Construir un diccionario mínimo:

| Entidad | Atributo | Significado | Obligatorio lógico | Identificador/Referencia | Fuente | Regla |
|---|---|---|---|---|---|---|

Matriz de trazabilidad:

| Requisito / historia / regla | Entidad | Atributo o relación | Evidencia | Estado |
|---|---|---|---|---|

Preguntas de auditoría:

- ¿hay atributos sin requisito ni regla?;
- ¿hay requisitos que no aparecen en el modelo?;
- ¿hay claves sin criterio de identidad?;
- ¿hay datos duplicados sin justificación?;

---

# 10. Demo ATLAS — 150 a 165 min

Usar el modelo conceptual y la Specification como únicas fuentes autorizadas.

Flujo:

```text
Generate
→ Critique
→ Refine
→ Human validation
```

La IA debe producir:

1. entidades lógicas;
2. atributos sustentados;
3. claves candidatas;
4. PK/FK lógicas;
5. resolución N:M;
6. dependencias funcionales relevantes;
7. revisión 1FN, 2FN y 3FN;
8. anomalías detectadas;
9. preguntas abiertas;
10. Mermaid lógico;
11. diccionario inicial;
12. trazabilidad.

Regla crítica:

> Si la Specification no permite decidir una clave, atributo o dependencia, la IA debe preguntar; no completar por intuición.

---

# 11. Taller por equipos — 165 a 175 min

Cada equipo parte del DER conceptual producido en la Sesión 04.

Debe completar al menos:

- entidades con atributos;
- identidad de cada entidad;
- transformación de 1:N;
- resolución de N:M;
- revisión de dependencias;
- auditoría 1FN–3FN;
- diccionario inicial;
- tres preguntas o decisiones pendientes;
- Mermaid lógico.

---

# 12. Auditoría cruzada y cierre — 175 a 180 min

Un equipo revisa el modelo de otro buscando:

- atributos sin fuente;
- claves arbitrarias;
- dependencias parciales;
- dependencias transitivas;
- N:M sin resolver;
- datos duplicados;
- desnormalización sin evidencia;
- decisiones físicas prematuras.

## Cierre

> Un buen modelo lógico no es el que tiene más tablas. Es el que puede explicar dónde vive cada dato, de qué depende y qué regla del negocio protege esa decisión.

## Puente a Sesión 06

La próxima sesión responderá:

> ¿Cómo convertimos este modelo lógico validado en estructuras concretas de PostgreSQL?
