# Plan de ejercicios — Sesión 05

## Objetivo

Desarrollar criterio para transformar un modelo conceptual en un modelo lógico y auditar su normalización, evitando que la IA convierta reglas incompletas en estructuras aparentemente correctas.

---

# Ejercicios guiados con el docente

## Ejercicio 1 — ¿Dónde vive cada atributo?

Caso:

```text
Cliente realiza Pedido.
Pedido contiene Producto.
```

Atributos candidatos:

```text
nombre_cliente
correo
fecha_pedido
nombre_producto
cantidad
precio_aplicado
```

El alumno debe ubicar cada atributo y justificar de qué identificador depende.

---

## Ejercicio 2 — Resolver una N:M

Partir de:

```text
Pedido N:M Producto
```

Preguntar:

1. ¿qué entidad asociativa aparece?;
2. ¿qué identifica una ocurrencia?;
3. ¿dónde viven cantidad y precio aplicado?;
4. ¿qué atributos no deben duplicarse?.

Resultado esperado:

```text
PEDIDO
PRODUCTO
DETALLE_PEDIDO
```

---

## Ejercicio 3 — Detectar una violación de 1FN

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

Detectar:

- grupo repetitivo;
- límite artificial;
- problemas de consulta;
- dificultad de integridad.

Rediseñar sin usar SQL.

---

## Ejercicio 4 — Dependencia parcial y 2FN

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

Clasificar cada atributo según dependa de:

- `pedido_id`;
- `producto_id`;
- toda la clave compuesta.

---

## Ejercicio 5 — Dependencia transitiva y 3FN

```text
CLIENTE
cliente_id
nombre
ciudad_id
ciudad_nombre
pais_id
pais_nombre
```

Construir el mapa de dependencias y decidir qué conceptos merecen identidad propia.

Advertencia: no normalizar mecánicamente si el dominio no requiere gestionar Ciudad o País de forma independiente.

---

## Ejercicio 6 — Anomalías

Caso:

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

Identificar un ejemplo de:

- anomalía de actualización;
- anomalía de inserción;
- anomalía de eliminación.

Luego proponer el mínimo conjunto de entidades que las reduzca.

---

## Ejercicio 7 — Auditar una salida de IA

La IA propone:

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

Preguntas:

1. ¿qué hechos diferentes están mezclados?;
2. ¿qué datos se repetirían?;
3. ¿qué dependencias existen?;
4. ¿qué entidades conceptuales de la sesión anterior desaparecieron?;
5. ¿qué decisiones fueron inventadas?.

---

## Ejercicio 8 — Claves candidatas

Para cada concepto discutir opciones, sin decidir tipos físicos:

```text
Cliente
Póliza
Producto
Pedido
Siniestro
```

Evaluar:

- unicidad;
- estabilidad;
- obligatoriedad;
- significado de negocio;
- posibilidad de cambio.

---

## Ejercicio 9 — ¿Normalizar o desnormalizar?

Presentar tres propuestas:

1. duplicar `cliente_nombre` en Pedido “para consultar más rápido”;
2. conservar `precio_aplicado` en DetallePedido;
3. duplicar `categoria_nombre` en Producto.

Los alumnos deben clasificar cada caso como:

- dato correctamente dependiente;
- redundancia injustificada;
- posible desnormalización futura que requiere evidencia.

---

## Ejercicio 10 — Generate → Critique → Refine

### Generate

Transformar el DER conceptual en modelo lógico usando solo la Specification.

### Critique

Auditar:

- atributos sin fuente;
- claves inventadas;
- N:M sin resolver;
- dependencias parciales;
- dependencias transitivas;
- duplicación no justificada;
- decisiones físicas prematuras.

### Refine

Corregir únicamente los hallazgos sustentados y convertir los vacíos en preguntas abiertas.

---

# Taller práctico por equipos

Cada equipo continúa con su caso de Banca, Seguros o Retail trabajado en la Sesión 04.

## Paso 1 — Recuperar el conceptual

Usar como fuente:

- Specification;
- glosario;
- DER conceptual;
- cardinalidades confirmadas;
- preguntas abiertas resueltas.

## Paso 2 — Agregar atributos

Cada atributo debe tener definición y fuente.

## Paso 3 — Definir identidad

Para cada entidad registrar:

- clave candidata;
- PK lógica propuesta;
- justificación;
- preguntas pendientes.

## Paso 4 — Transformar relaciones

Resolver:

- 1:N;
- N:M;
- 1:1 cuando exista.

## Paso 5 — Dependencias

Escribir al menos las dependencias relevantes de cada entidad.

## Paso 6 — Normalización

Revisar explícitamente:

- 1FN;
- 2FN cuando existan claves compuestas;
- 3FN;
- anomalías potenciales.

## Paso 7 — DER lógico

Generar Mermaid con entidades, atributos, PK/FK lógicas y relaciones.

## Paso 8 — Diccionario de datos

Crear el diccionario inicial sin tipos SQL.

## Paso 9 — Trazabilidad

| Requisito / regla | Entidad | Atributo/relación | Estado |
|---|---|---|---|

## Paso 10 — Preguntas pendientes

Registrar como mínimo tres decisiones que no deban inventarse.

---

# Mini reto final — Romper una tabla universal

```text
OPERACION
cliente
correo
pedido
fecha
producto
categoria
cantidad
precio
ciudad
pais
```

El alumno debe demostrar por qué la estructura es riesgosa usando dependencias y anomalías, no solo diciendo que “no está normalizada”.

---

# Definition of Done

El equipo termina cuando:

- el modelo deriva del conceptual;
- cada atributo tiene fuente;
- cada entidad tiene identidad explicable;
- las N:M fueron resueltas;
- las dependencias relevantes están explícitas;
- 1FN–3FN fueron revisadas;
- no existe redundancia sin justificación;
- no se introdujeron tipos ni DDL;
- existe diccionario de datos;
- existe trazabilidad con la Specification;
- el Prompt ATLAS quedó versionado;
- las decisiones pendientes están documentadas.
