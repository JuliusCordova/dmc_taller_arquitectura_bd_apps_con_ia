# Ejercicios guiados — Sesión 05

## Objetivo

Practicar la transformación conceptual → lógico y la normalización mediante razonamiento explícito sobre identidad, dependencias y anomalías.

No usar SQL ni tipos físicos.

---

# Ejercicio 1 — Ubicar atributos

Caso:

```text
Un cliente realiza pedidos.
Cada pedido contiene uno o más productos.
Para cada producto pedido se registra cantidad y precio aplicado.
```

Atributos:

```text
nombre_cliente
correo
fecha_pedido
nombre_producto
cantidad
precio_aplicado
```

Completa:

| Atributo | Entidad propuesta | ¿De qué depende? | Justificación |
|---|---|---|---|
| nombre_cliente | | | |
| correo | | | |
| fecha_pedido | | | |
| nombre_producto | | | |
| cantidad | | | |
| precio_aplicado | | | |

---

# Ejercicio 2 — Resolver la N:M

Modelo conceptual:

```text
PEDIDO N:M PRODUCTO
```

Responde:

1. ¿qué entidad asociativa propones?;
2. ¿qué identifica una ocurrencia de esa entidad?;
3. ¿qué atributos pertenecen a ella?;
4. ¿qué atributos no deben duplicarse?.

Dibuja el resultado en texto o Mermaid.

---

# Ejercicio 3 — Primera forma normal

Analiza:

```text
PEDIDO
pedido_id
producto_1
cantidad_1
producto_2
cantidad_2
producto_3
cantidad_3
```

Identifica al menos cuatro problemas y rediseña la estructura.

### Evidencia esperada

No basta con escribir “viola 1FN”. Explica qué problema operativo o de integridad genera.

---

# Ejercicio 4 — Segunda forma normal

Analiza:

```text
DETALLE_PEDIDO
pedido_id
producto_id
fecha_pedido
nombre_producto
cantidad
precio_aplicado
```

Supón que la clave lógica es:

```text
(pedido_id, producto_id)
```

Completa:

| Atributo | Depende de pedido_id | Depende de producto_id | Depende de la clave completa |
|---|---:|---:|---:|
| fecha_pedido | | | |
| nombre_producto | | | |
| cantidad | | | |
| precio_aplicado | | | |

Luego propone la separación necesaria.

---

# Ejercicio 5 — Tercera forma normal

Analiza:

```text
CLIENTE
cliente_id
nombre
ciudad_id
ciudad_nombre
pais_id
pais_nombre
```

Construye las dependencias que puedas justificar y responde:

1. ¿hay dependencias transitivas?;
2. ¿Ciudad debe ser entidad?;
3. ¿País debe ser entidad?;
4. ¿qué requisito necesitarías para tomar esa decisión con certeza?.

---

# Ejercicio 6 — Anomalías

Analiza:

```text
VENTA
venta_id
fecha
cliente_id
cliente_nombre
cliente_correo
producto_id
producto_nombre
cantidad
```

Describe un ejemplo de:

- anomalía de actualización;
- anomalía de inserción;
- anomalía de eliminación.

Después propone un modelo lógico mejor.

---

# Ejercicio 7 — Auditar a la IA

Una IA propone para seguros:

```text
SINIESTRO
siniestro_id
asegurado_nombre
asegurado_documento
poliza_numero
poliza_fecha_inicio
poliza_fecha_fin
taller_nombre
presupuesto_monto
estado_presupuesto
```

Audita la propuesta.

| Hallazgo | Evidencia | Riesgo | Corrección o pregunta |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

Busca al menos:

- hechos independientes mezclados;
- repetición potencial;
- conceptos perdidos del conceptual;
- dependencias no respetadas;
- atributos o relaciones inventadas.

---

# Ejercicio 8 — Claves candidatas

Para tres entidades de tu proyecto completa:

| Entidad | Clave candidata | ¿Es única? | ¿Es estable? | ¿Puede faltar? | Decisión |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| | | | | | |

No elijas tipos físicos.

---

# Ejercicio 9 — Mini auditoría ATLAS

Pide a la IA revisar tu modelo lógico y luego marca cada hallazgo como:

- confirmado;
- incorrecto;
- requiere información;
- decisión futura.

No aceptes una corrección solo porque la respuesta parezca convincente.

---

# Entregable guiado

Al terminar esta guía debes tener:

- un modelo lógico parcial;
- dependencias funcionales relevantes;
- una N:M resuelta;
- evidencia de revisión 1FN–3FN;
- al menos una anomalía explicada;
- tres decisiones o preguntas pendientes.
