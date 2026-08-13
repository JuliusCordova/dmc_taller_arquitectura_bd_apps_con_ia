# Mapa de conceptos — Modelo conceptual, lógico, físico y DER

## 1. Modelo conceptual

### Pregunta que responde

> ¿Qué existe en el negocio y cómo se relaciona?

### Contenido

- entidades;
- conceptos;
- relaciones;
- cardinalidad;
- opcionalidad;
- eventos;
- estados;
- vocabulario del dominio.

### No contiene todavía

- tipos SQL;
- nombres físicos;
- índices;
- motor de base de datos;
- estrategia de almacenamiento.

### Ejemplo

```text
Cliente REALIZA Pedido
Pedido CONTIENE Producto
```

---

## 2. Modelo lógico

### Pregunta que responde

> ¿Cómo se organizan los conceptos en estructuras de datos coherentes?

### Contenido

- atributos;
- identificadores;
- claves primarias y foráneas lógicas;
- entidades asociativas;
- dependencias;
- normalización;
- integridad referencial.

### Ejemplo

```text
CLIENTE
- cliente_id PK
- nombre
- correo

PEDIDO
- pedido_id PK
- cliente_id FK
- fecha
```

---

## 3. Modelo físico

### Pregunta que responde

> ¿Cómo se implementa el diseño en un motor concreto?

### Contenido

- tipos;
- tamaños;
- `NOT NULL`;
- `UNIQUE`;
- `CHECK`;
- índices;
- particiones;
- DDL;
- convenciones técnicas.

### Ejemplo ilustrativo

```sql
CREATE TABLE cliente (
    cliente_id UUID PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
```

Este ejemplo se muestra solo para comprender el destino de la cadena de diseño. El diseño físico se desarrolla formalmente en la Sesión 06.

---

# 4. Diagrama Entidad–Relación — DER

Un DER es una representación gráfica del modelo de entidades y relaciones. No debe confundirse con un nivel específico de modelado.

Puede existir:

## DER conceptual

Representa:

- entidades;
- relaciones;
- cardinalidad;
- opcionalidad.

## DER lógico

Puede agregar:

- atributos;
- PK/FK;
- entidades asociativas;
- estructuras normalizadas.

## DER próximo al físico

Puede agregar:

- tipos;
- nombres físicos;
- restricciones específicas.

## Pregunta de control

Cuando el alumno observe un DER debe preguntar:

> ¿Qué nivel de precisión representa este diagrama?

---

# 5. Entidad, atributo, valor y estado

## Entidad

Concepto con identidad propia y múltiples ocurrencias.

Ejemplos:

- Cliente;
- Pedido;
- Producto;
- Siniestro;
- Póliza.

## Atributo

Característica de una entidad.

Ejemplos:

- nombre;
- correo;
- fecha;
- placa.

## Valor

Dato concreto de un atributo.

Ejemplo:

```text
atributo: estado
valor: EN_EVALUACION
```

## Estado

Situación de una entidad dentro de su ciclo de vida.

Un estado no debe convertirse automáticamente en una entidad.

---

# 6. Relaciones

Una relación debe expresar un hecho mediante un verbo.

Ejemplos:

```text
Cliente REALIZA Pedido
Póliza CUBRE Vehículo
Siniestro CONTIENE Evidencia
Taller PRESENTA Presupuesto
```

Pregunta de revisión:

> ¿La relación puede leerse como una frase válida del negocio?

---

# 7. Cardinalidad y opcionalidad

Para cada lado de una relación responder:

## Mínimo

> ¿Puede existir sin el otro?

- Sí → mínimo 0.
- No → mínimo 1.

## Máximo

> ¿Cuántos puede tener?

- uno;
- muchos.

Patrones:

- 1:1;
- 1:N;
- N:M;
- 0..1;
- 0..N;
- 1..N.

La cardinalidad debe provenir de una regla o evidencia. Si no puede justificarse, debe quedar como pregunta abierta.

---

# 8. Relaciones N:M

Ejemplo:

```text
Pedido N:M Producto
```

Si la relación tiene datos propios como cantidad, precio aplicado o descuento, puede emerger una entidad asociativa:

```text
Pedido → DetallePedido → Producto
```

La entidad asociativa debe tener significado de negocio; no debe crearse únicamente porque una herramienta lo sugiera.

---

# 9. Intuición de normalización

Pregunta principal:

> ¿De qué depende este dato?

Ejemplo:

- correo depende de Cliente;
- fecha depende de Pedido;
- categoría depende de Producto;
- cantidad depende de Pedido + Producto.

Esta intuición prepara el desarrollo formal de 1FN, 2FN y 3FN de la Sesión 05.

---

# 10. Cadena de trazabilidad

Todo concepto del modelo debe poder recorrer esta cadena:

```text
Entrevista / evidencia
        ↓
Specification
        ↓
Historia / RF / Regla
        ↓
Entidad o relación
        ↓
Cardinalidad
        ↓
DER
```

Si una caja no puede justificar su existencia con esta cadena, debe revisarse.
