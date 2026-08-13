# Plan docente — Sesión 04

## Del negocio al modelo de datos con IA

**Duración:** 3 horas  
**Metodología:** explicación + demo + práctica guiada + práctica por equipos + revisión cruzada  
**Marco:** Spec-Driven Development + ATLAS

---

# 1. Apertura — 0 a 15 min

## Pregunta de impacto

> ¿Cómo pasa una frase de negocio a convertirse, varias sesiones después, en una tabla real?

Mostrar la cadena:

```text
Entrevista
→ Specification
→ Regla
→ Modelo conceptual
→ DER
→ Modelo lógico
→ Modelo físico
→ Base de datos
```

## Conexión con Sesión 03

Recordar que ATLAS controla:

- Actor;
- Tarea;
- Límites;
- Autovalidación;
- Salida.

La sesión anterior enseñó a pedir mejor. Esta sesión enseña a evaluar si el modelo resultante representa correctamente el negocio.

---

# 2. Tres modelos, tres preguntas — 15 a 35 min

## Modelo conceptual

Pregunta:

> ¿Qué existe en el negocio y cómo se relaciona?

Incluye:

- entidades;
- relaciones;
- cardinalidades;
- vocabulario del dominio.

Es independiente de la tecnología.

## Modelo lógico

Pregunta:

> ¿Cómo organizamos los conceptos en estructuras de datos?

Aparecen:

- atributos;
- identificadores;
- PK/FK lógicas;
- entidades asociativas;
- dependencias;
- normalización.

Sigue siendo, en gran medida, independiente del motor.

## Modelo físico

Pregunta:

> ¿Cómo implementamos el diseño en una tecnología concreta?

Aparecen:

- tipos;
- constraints;
- índices;
- DDL;
- decisiones específicas del motor.

## Mensaje docente

> Hoy vemos los tres niveles para comprender la cadena completa. Hoy construimos y validamos solo el nivel conceptual.

---

# 3. Del lenguaje natural al modelo conceptual — 35 a 55 min

Usar el patrón:

```text
Sustantivos → entidades candidatas
Verbos      → relaciones candidatas
Restricciones → cardinalidad / reglas
```

Ejemplo:

```text
Una empresa vende productos a clientes.
Los clientes realizan pedidos.
Cada pedido contiene uno o más productos.
```

Extraer:

- Cliente;
- Pedido;
- Producto;
- realiza;
- contiene;
- uno o más.

## Regla crítica

> No todo sustantivo es una entidad.

Preguntas de control:

1. ¿Tiene identidad propia?
2. ¿Existen múltiples ocurrencias?
3. ¿Necesitamos conservar información sobre él?
4. ¿Participa en relaciones con otros conceptos?
5. ¿Es realmente un atributo, estado, evento o proceso?

---

# 4. Entidad, atributo, valor e identidad — 55 a 75 min

## Entidad

Concepto del negocio con identidad propia y múltiples ocurrencias.

## Atributo

Característica que describe una entidad.

## Valor

Dato concreto correspondiente a un atributo.

Ejemplo:

```text
Entidad: Cliente
Atributos: nombre, correo, documento
Valores: Ana Torres, ana@email.com, 12345678
```

## Identidad

Discutir:

- identificador natural;
- identificador de negocio;
- identificador técnico futuro.

No decidir aún el tipo físico.

---

# 5. Relaciones y cardinalidad — 75 a 95 min

## Relación

Una relación debe expresar un hecho del negocio mediante un verbo.

No:

```text
Cliente ---- Pedido
```

Sí:

```text
Cliente REALIZA Pedido
```

## Cardinalidad

Enseñar a determinarla mediante preguntas, no memorizando símbolos.

### Mínimo

> ¿Puede existir A sin B?

### Máximo

> ¿Cuántos B puede tener A?

Trabajar:

- 1:1;
- 1:N;
- N:M;
- 0..1;
- 0..N;
- 1..N.

## Regla pedagógica

> El símbolo es la consecuencia de una regla de negocio, no el punto de partida.

---

# 6. N:M y entidades asociativas — 95 a 105 min

Ejemplo:

```text
Pedido N:M Producto
```

Preguntar:

- ¿dónde vive cantidad?;
- ¿dónde vive precio aplicado?;
- ¿la relación tiene información propia?;

Introducir conceptualmente:

```text
Pedido → DetallePedido → Producto
```

No entrar todavía en PK compuestas ni DDL.

---

# 7. Pausa — 105 a 115 min

---

# 8. Qué es un DER — 115 a 130 min

Aclarar:

> DER significa Diagrama Entidad–Relación. Es una representación visual y no un nivel de modelado por sí solo.

Mostrar tres variantes:

## DER conceptual

- entidades;
- relaciones;
- cardinalidades.

## DER lógico

- atributos;
- identificadores;
- PK/FK;
- entidades asociativas.

## DER próximo al físico

- tipos;
- constraints;
- nombres técnicos.

El alumno debe poder identificar qué nivel está viendo.

---

# 9. Puente al modelo lógico y normalización — 130 a 145 min

Sin desarrollar todavía la Sesión 05, mostrar el destino.

Ejemplo 1:N:

```text
Conceptual:
Cliente REALIZA Pedido

Lógico:
CLIENTE
cliente_id PK

PEDIDO
pedido_id PK
cliente_id FK
```

Idea inicial de normalización:

> ¿De qué depende cada dato?

Ejemplos para discutir:

- correo depende de Cliente;
- fecha depende de Pedido;
- categoría depende de Producto;
- cantidad depende de Pedido + Producto.

No profundizar todavía en 1FN, 2FN y 3FN.

---

# 10. Vista del modelo físico — 145 a 155 min

Mostrar solo como destino:

```sql
CREATE TABLE cliente (
  cliente_id UUID PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
```

Preguntar:

> ¿Qué decisiones nuevas aparecen aquí que no existían en el conceptual?

Respuesta esperada:

- motor/tecnología;
- tipos;
- restricciones;
- sintaxis física.

Reforzar que esas decisiones pertenecen a sesiones posteriores.

---

# 11. Prompt ATLAS para modelado conceptual — 155 a 165 min

Construir con los alumnos:

```text
## ACTOR
Actúa como Arquitecto de Datos y especialista en modelado de dominios y SDD.

## TAREA
Lee la DMC Application Specification e identifica los conceptos necesarios para representar el dominio.

## LÍMITES
No diseñes tablas.
No agregues tipos SQL.
No crees índices.
No selecciones tecnología.
No inventes cardinalidades.
Cuando una relación no pueda determinarse, crea una pregunta abierta.

## AUTOVALIDACIÓN
Comprueba que:
- cada entidad tenga evidencia;
- cada relación tenga significado de negocio;
- cada cardinalidad esté justificada;
- no existan entidades duplicadas;
- estados y atributos no se conviertan en entidades sin razón;
- no se introduzca tecnología.

## SALIDA
Entrega:
1. glosario;
2. entidades candidatas;
3. relaciones;
4. cardinalidades;
5. eventos;
6. estados;
7. preguntas abiertas;
8. DER conceptual en Mermaid;
9. matriz de trazabilidad.
```

---

# 12. Taller por equipos — 165 a 175 min

Cada equipo trabaja con su caso de uso.

Debe producir al menos:

1. 8 a 15 conceptos candidatos;
2. clasificación de cada concepto;
3. entidades justificadas;
4. relaciones con verbo;
5. cardinalidades confirmadas o pendientes;
6. primer DER conceptual;
7. tres preguntas abiertas;
8. trazabilidad hacia historias/RF/reglas.

---

# 13. Revisión cruzada y cierre — 175 a 180 min

Cada equipo revisa otro modelo preguntando:

- ¿hay entidades sin fuente?;
- ¿hay atributos modelados como entidades?;
- ¿hay estados o procesos convertidos en entidades?;
- ¿todas las relaciones tienen verbo?;
- ¿las cardinalidades se justifican?;
- ¿hay N:M ocultas?;
- ¿se introdujo tecnología prematuramente?;

## Cierre

> La IA puede dibujar un DER en segundos. El valor del diseñador está en demostrar que cada caja, relación y cardinalidad representa una regla real del negocio.
