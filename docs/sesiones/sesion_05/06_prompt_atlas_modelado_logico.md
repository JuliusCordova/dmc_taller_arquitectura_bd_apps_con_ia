# Prompt ATLAS — Modelado lógico y normalización

## Objetivo

Transformar y auditar un modelo conceptual utilizando únicamente información autorizada del proyecto.

Este prompt debe ejecutarse con la DMC Application Specification, el DER conceptual y las decisiones confirmadas como contexto.

---

# Versión base

```text
## A — ACTOR
Actúa como Arquitecto de Datos senior, especialista en modelado relacional, normalización y Spec-Driven Development.

Tu función es transformar un modelo conceptual validado en un modelo lógico trazable y auditable.

## T — TAREA
A partir de la DMC Application Specification y del modelo conceptual proporcionado:

1. identifica los atributos sustentados para cada entidad;
2. propone claves candidatas y una PK lógica por entidad;
3. representa las relaciones 1:N mediante referencias lógicas;
4. transforma las relaciones N:M en entidades asociativas cuando corresponda;
5. identifica los atributos que pertenecen a cada relación asociativa;
6. declara las dependencias funcionales relevantes;
7. revisa 1FN, 2FN y 3FN;
8. detecta anomalías potenciales de inserción, actualización y eliminación;
9. construye un DER lógico;
10. crea un diccionario de datos inicial;
11. crea una matriz de trazabilidad entre requisitos, entidades, atributos y reglas;
12. registra preguntas abiertas y decisiones no sustentadas.

## L — LÍMITES
Usa únicamente la información contenida en las fuentes proporcionadas.

No inventes:
- atributos;
- cardinalidades;
- claves de negocio;
- reglas;
- obligatoriedad;
- estados;
- relaciones.

No diseñes todavía el modelo físico.

Por tanto:
- no uses tipos SQL;
- no generes CREATE TABLE;
- no propongas índices;
- no selecciones secuencias;
- no introduzcas particionamiento;
- no agregues decisiones específicas de PostgreSQL.

Si falta información para decidir, crea una pregunta abierta y explica qué parte del modelo puede cambiar según la respuesta.

No normalices mecánicamente un valor solo porque se repita. Para convertirlo en entidad debe existir identidad, significado y necesidad de negocio.

No desnormalices por supuesta mejora de rendimiento sin evidencia de patrones de acceso o métricas.

## A — AUTOVALIDACIÓN
Antes de responder, verifica:

1. que cada entidad lógica pueda rastrearse al modelo conceptual o a una decisión aprobada;
2. que cada atributo tenga fuente o quede marcado como pendiente;
3. que toda PK lógica tenga una justificación de identidad;
4. que las FK lógicas correspondan a relaciones confirmadas;
5. que no queden relaciones N:M sin tratamiento explícito;
6. que los atributos de entidades asociativas dependan de la asociación completa;
7. que no existan grupos repetitivos;
8. que no existan dependencias parciales no justificadas;
9. que no existan dependencias transitivas relevantes no tratadas;
10. que toda redundancia quede identificada y justificada;
11. que no se hayan introducido decisiones físicas;
12. que los vacíos se conviertan en preguntas y no en suposiciones.

Al final incluye una sección llamada AUTOVALIDACIÓN con:
- hallazgos confirmados;
- dudas pendientes;
- supuestos rechazados;
- riesgos del modelo.

## S — SALIDA
Entrega exactamente estas secciones:

1. Resumen de transformación conceptual → lógico.
2. Entidades lógicas y atributos.
3. Claves candidatas, PK y FK lógicas.
4. Resolución de relaciones N:M.
5. Dependencias funcionales relevantes.
6. Revisión de 1FN.
7. Revisión de 2FN.
8. Revisión de 3FN.
9. Anomalías detectadas.
10. Decisiones de desnormalización, si existieran, con evidencia.
11. DER lógico en Mermaid.
12. Diccionario de datos.
13. Matriz de trazabilidad.
14. Preguntas abiertas.
15. AUTOVALIDACIÓN.

No generes SQL.
```

---

# Patrón Critique

Después de obtener el primer modelo, ejecutar:

```text
Actúa ahora como revisor independiente del modelo lógico anterior.

No lo mejores todavía.

Busca únicamente defectos y riesgos en estas categorías:

- entidades sin fuente;
- atributos sin fuente;
- claves arbitrarias;
- relaciones que no provienen del conceptual;
- N:M no resueltas;
- dependencias parciales;
- dependencias transitivas;
- grupos repetitivos;
- redundancia no justificada;
- atributos colocados en la entidad incorrecta;
- pérdida de opcionalidad o cardinalidad;
- decisiones físicas prematuras;
- desnormalización sin evidencia;
- requisitos de la Specification que no aparecen en el modelo.

Para cada hallazgo entrega:

| ID | Hallazgo | Evidencia | Impacto | Severidad | Pregunta o corrección sugerida |

No cambies el modelo en esta fase.
```

---

# Patrón Refine

Después de validar los hallazgos humanos:

```text
Refina el modelo lógico anterior usando únicamente los hallazgos que han sido marcados como CONFIRMADOS.

No incorpores sugerencias rechazadas.
No completes información pendiente.
No agregues atributos ni reglas nuevas.

Para cada cambio registra:

| Cambio | Hallazgo que lo origina | Evidencia | Resultado |

Luego entrega nuevamente:
- modelo lógico;
- DER Mermaid;
- diccionario;
- trazabilidad;
- preguntas abiertas.
```

---

# Regla pedagógica

> Generate produce una propuesta. Critique intenta romperla. Refine corrige solo lo que fue validado. El criterio humano decide qué sobrevive.
