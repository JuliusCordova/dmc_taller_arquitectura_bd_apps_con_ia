# Guía — Modelado lógico y normalización

## 1. Del conceptual al lógico

El modelo conceptual responde **qué existe en el negocio y cómo se relaciona**. El modelo lógico responde **cómo organizamos esos conceptos como estructuras de datos manteniendo identidad, dependencias e integridad**.

En esta etapa aparecen:

- atributos;
- identificadores;
- claves candidatas;
- PK y FK lógicas;
- entidades asociativas;
- dependencias funcionales;
- normalización;
- diccionario de datos.

Todavía no aparecen tipos SQL, índices, DDL ni decisiones específicas de PostgreSQL.

## 2. Reglas de transformación

### Relación 1:N

La entidad del lado N conserva una referencia lógica hacia la entidad del lado 1.

```text
CLIENTE 1 ─── N PEDIDO

PEDIDO
- pedido_id [PK lógica]
- cliente_id [FK lógica]
```

### Relación N:M

Normalmente requiere una entidad asociativa.

```text
PEDIDO N ─── M PRODUCTO
```

se transforma en:

```text
PEDIDO 1 ─── N DETALLE_PEDIDO N ─── 1 PRODUCTO
```

Los atributos que describen la relación viven en la asociativa: cantidad, precio aplicado o descuento aplicado.

### Relación 1:1

No se resuelve mecánicamente. Se evalúan dependencia de existencia, opcionalidad, ciclo de vida y significado independiente.

## 3. Atributos e identidad

Para cada atributo preguntar:

1. ¿qué significa?;
2. ¿qué entidad describe?;
3. ¿de qué identificador depende?;
4. ¿existe evidencia en la Specification?;
5. ¿es derivado o persistente?;
6. ¿es obligatorio por regla de negocio?;
7. ¿es realmente otro concepto con identidad?.

Distinguir:

- **clave candidata:** conjunto mínimo que puede identificar una ocurrencia;
- **clave natural:** identificador con significado de negocio;
- **PK lógica:** identificador elegido en el modelo lógico;
- **FK lógica:** referencia que preserva una relación.

No se decide aún si físicamente será UUID, entero, texto u otro tipo.

## 4. Dependencias funcionales

Notación:

```text
X → Y
```

Pregunta práctica:

> Si conozco X, ¿puedo determinar un único Y de acuerdo con las reglas del negocio?

Ejemplos:

```text
cliente_id → nombre, correo
pedido_id → fecha, cliente_id
producto_id → nombre
(pedido_id, producto_id) → cantidad, precio_aplicado
```

La normalización empieza por estas dependencias, no por memorizar definiciones.

## 5. Primera forma normal — 1FN

Evita grupos repetitivos y estructuras como:

```text
PEDIDO
producto_1
cantidad_1
producto_2
cantidad_2
producto_3
cantidad_3
```

El diseño se reorganiza en:

```text
PEDIDO
DETALLE_PEDIDO
PRODUCTO
```

La atomicidad depende del significado y del uso del dato. Una dirección puede ser un solo valor o varios atributos según los requerimientos.

## 6. Segunda forma normal — 2FN

Es especialmente importante con claves compuestas.

Caso:

```text
DETALLE_PEDIDO
PK: pedido_id + producto_id
fecha_pedido
nombre_producto
cantidad
```

Dependencias:

```text
pedido_id → fecha_pedido
producto_id → nombre_producto
(pedido_id, producto_id) → cantidad
```

Por tanto:

```text
PEDIDO(pedido_id, fecha_pedido)
PRODUCTO(producto_id, nombre_producto)
DETALLE_PEDIDO(pedido_id, producto_id, cantidad)
```

Un atributo que depende solo de parte de la clave compuesta probablemente está en la entidad equivocada.

## 7. Tercera forma normal — 3FN

Evita dependencias transitivas relevantes entre atributos no clave.

Ejemplo:

```text
CLIENTE
cliente_id
nombre
ciudad_id
ciudad_nombre
pais_id
pais_nombre
```

Dependencias:

```text
cliente_id → ciudad_id
ciudad_id → ciudad_nombre, pais_id
pais_id → pais_nombre
```

Si Ciudad y País tienen identidad y reglas propias, pueden separarse. No debe convertirse automáticamente cualquier valor repetido en entidad.

## 8. Anomalías que buscamos evitar

- **Actualización:** un mismo dato debe cambiarse en varios lugares y puede quedar inconsistente.
- **Inserción:** no podemos registrar un hecho sin inventar otro dato no relacionado.
- **Eliminación:** al borrar una ocurrencia se pierde accidentalmente otro hecho independiente.

Estas anomalías ayudan a explicar por qué normalizamos.

## 9. Desnormalización consciente

La desnormalización solo debe proponerse con una razón explícita y evidencia suficiente.

Registrar siempre:

| Decisión | Pregunta |
|---|---|
| Motivo | ¿Qué problema concreto resuelve? |
| Evidencia | ¿Qué patrón o métrica lo demuestra? |
| Dato duplicado | ¿Qué se replica? |
| Fuente autoritativa | ¿Cuál es el dato oficial? |
| Sincronización | ¿Cómo se evita inconsistencia? |
| Riesgo | ¿Qué puede fallar? |

En esta sesión la base recomendada es un modelo normalizado. Las optimizaciones se justifican después con evidencia.

## 10. Diccionario de datos inicial

| Entidad | Atributo | Definición | Rol | Obligatorio lógico | Fuente | Regla/Pregunta |
|---|---|---|---|---|---|---|
| CLIENTE | cliente_id | Identifica al cliente | PK lógica | Sí | RF-01 | Validar clave de negocio |

No incluir tipos físicos.

## 11. Definition of Ready para la Sesión 06

El modelo puede avanzar a diseño físico cuando podemos explicar:

- qué representa cada entidad;
- qué identifica cada ocurrencia;
- de qué depende cada atributo;
- cómo se representan las relaciones;
- dónde se resolvieron las N:M;
- qué anomalías se evitaron;
- qué decisiones siguen abiertas;
- qué requisito justifica cada estructura relevante.

> Normalizar no busca producir más tablas. Busca que cada hecho tenga un lugar coherente y defendible.
