# Checklist de validación — Modelo lógico

## Uso

Este checklist se utiliza antes de considerar el modelo lógico listo para pasar a diseño físico en la Sesión 06.

Cada criterio debe marcarse como:

- Cumple;
- No cumple;
- No aplica;
- Pendiente de información.

---

## A. Trazabilidad

- [ ] Cada entidad tiene fuente en la Specification, el modelo conceptual o una decisión aprobada.
- [ ] Cada atributo relevante tiene fuente o está marcado como pendiente.
- [ ] Las relaciones conservan el significado del modelo conceptual.
- [ ] Las cardinalidades no fueron modificadas sin evidencia.
- [ ] Los requisitos críticos pueden rastrearse hasta entidades, atributos o relaciones.
- [ ] No existen estructuras importantes sin justificación de negocio.

## B. Identidad y claves

- [ ] Cada entidad tiene una identidad explicable.
- [ ] Las claves candidatas fueron analizadas por unicidad, estabilidad y obligatoriedad.
- [ ] La PK lógica propuesta está justificada.
- [ ] Las FK lógicas corresponden a relaciones confirmadas.
- [ ] No se confundió clave lógica con tipo físico.

## C. Relaciones

- [ ] Todas las relaciones 1:N tienen representación lógica coherente.
- [ ] Todas las N:M fueron identificadas.
- [ ] Las N:M relevantes fueron resueltas mediante entidades asociativas.
- [ ] Los atributos de una asociación dependen de la asociación y no de una sola entidad.
- [ ] Las relaciones 1:1 tienen una justificación explícita o una decisión pendiente.
- [ ] La opcionalidad del conceptual se conserva.

## D. Primera forma normal

- [ ] No existen grupos repetitivos.
- [ ] No existen columnas numeradas como `producto_1`, `producto_2`, etc.
- [ ] Cada atributo tiene significado consistente dentro de la entidad.
- [ ] Los atributos multivaluados fueron analizados explícitamente.
- [ ] La atomicidad se evaluó según el uso del negocio y no de manera mecánica.

## E. Segunda forma normal

- [ ] Se identificaron las entidades con claves compuestas.
- [ ] Los atributos no clave dependen de la clave completa.
- [ ] No existen atributos que dependan solo de una parte de la clave compuesta.
- [ ] Las dependencias parciales detectadas fueron corregidas o documentadas.

## F. Tercera forma normal

- [ ] Se revisaron dependencias entre atributos no clave.
- [ ] Las dependencias transitivas relevantes fueron tratadas.
- [ ] No se crearon entidades solo porque un valor se repite.
- [ ] Las entidades separadas tienen identidad y significado de negocio.
- [ ] Las excepciones están justificadas.

## G. Anomalías y redundancia

- [ ] Se evaluaron anomalías de actualización.
- [ ] Se evaluaron anomalías de inserción.
- [ ] Se evaluaron anomalías de eliminación.
- [ ] No existe redundancia sin justificación.
- [ ] Toda desnormalización propuesta registra motivo y evidencia.
- [ ] La fuente autoritativa de un dato duplicado está identificada.

## H. Diccionario de datos

- [ ] El diccionario incluye entidad y atributo.
- [ ] Cada atributo tiene definición comprensible.
- [ ] Se identifica su rol: PK lógica, FK lógica, candidata, atributo o derivado.
- [ ] Se registra obligatoriedad lógica cuando esté confirmada.
- [ ] Se registra fuente.
- [ ] Se registran reglas o preguntas pendientes.
- [ ] No se introdujeron tipos SQL.

## I. Uso de IA y ATLAS

- [ ] El prompt ATLAS utilizado quedó versionado.
- [ ] La IA recibió fuentes explícitas.
- [ ] El prompt prohibió inventar atributos, claves y reglas.
- [ ] La salida fue sometida a Critique.
- [ ] Los hallazgos de Critique fueron validados por una persona.
- [ ] Refine corrigió solo hallazgos confirmados.
- [ ] Las dudas se transformaron en preguntas abiertas.
- [ ] Existe evidencia de recomendaciones rechazadas cuando corresponde.

## J. Límite con diseño físico

- [ ] No hay tipos SQL.
- [ ] No hay `CREATE TABLE`.
- [ ] No hay índices.
- [ ] No hay secuencias.
- [ ] No hay decisiones de particionamiento.
- [ ] No hay decisiones específicas de PostgreSQL que correspondan a la Sesión 06.

---

# Gate de salida

El modelo lógico está **Listo para Sesión 06** cuando:

1. no existen errores críticos de trazabilidad;
2. las identidades y relaciones pueden defenderse;
3. las N:M están resueltas o explícitamente pendientes;
4. 1FN–3FN fueron revisadas con evidencia;
5. no existe redundancia no controlada;
6. el diccionario está actualizado;
7. las preguntas abiertas están registradas;
8. la Specification refleja las decisiones;
9. el equipo puede explicar por qué cada dato vive donde vive.

## Pregunta final de defensa

> Selecciona cualquier atributo del modelo: ¿de qué depende, qué requisito lo justifica y qué riesgo aparecería si lo colocáramos en otra entidad?
