# Ejercicios prácticos — Desarrollo de capacidad en Prompt Engineering ATLAS

## Propósito

Estos ejercicios deben ser desarrollados por los alumnos después de los ejercicios guiados. El objetivo es que construyan criterio propio para diseñar, evaluar y mejorar prompts de desarrollo.

---

# Ejercicio práctico 1 — Reparar un prompt débil

## Prompt defectuoso

```text
Analiza el caso de retail y diseña una solución completa y moderna.
```

## Tarea

Transforma el prompt utilizando ATLAS.

Debe incluir:

- Actor;
- Tarea;
- Límites;
- Autovalidación;
- Salida.

## Restricción

No puedes agregar requisitos de negocio que no estén en el archivo fuente.

## Entregable

```text
prompt_reparado_01.md
```

## Preguntas de reflexión

1. ¿Qué podía inventar la IA en el prompt original?
2. ¿Qué límite agregaste para evitarlo?
3. ¿Qué significa que la tarea sea observable?

---

# Ejercicio práctico 2 — Detectar lo que falta

## Prompt

```text
Actúa como Arquitecto de Soluciones.
Lee las entrevistas y crea historias de usuario.
```

## Tarea

No ejecutes el prompt inmediatamente.

Primero identifica qué componentes ATLAS están ausentes o incompletos.

Luego genera una versión mejorada.

## Entregable

Una tabla:

| Componente | Existe | Problema | Mejora propuesta |
|---|---|---|---|
| Actor | | | |
| Tarea | | | |
| Límites | | | |
| Autovalidación | | | |
| Salida | | | |

---

# Ejercicio práctico 3 — Convertir ambigüedad en preguntas

## Escenario

La entrevista dice:

```text
La aplicación debe responder rápidamente y soportar crecimiento futuro.
```

## Tarea

Diseña un prompt que impida que el modelo invente:

- tiempo de respuesta;
- volumen de usuarios;
- throughput;
- SLA;
- infraestructura.

El resultado de la IA debe generar preguntas concretas para convertir esas frases en RNF medibles posteriormente.

## Entregable

```text
prompt_rnf_sin_inventar.md
```

---

# Ejercicio práctico 4 — Controlar una contradicción

## Escenario

Dos entrevistados indican:

```text
Negocio: los casos simples deberían aprobarse automáticamente.

Riesgos: toda aprobación debe ser revisada por una persona.
```

## Tarea

Diseña un prompt ATLAS que:

1. detecte la contradicción;
2. preserve ambas posiciones;
3. no elija una como correcta;
4. identifique qué artefactos afecta;
5. cree una pregunta de resolución;
6. sugiera quién debería validarla.

## Criterio de éxito

La respuesta no debe presentar una política definitiva.

---

# Ejercicio práctico 5 — Crear historias con trazabilidad

## Tarea

A partir del archivo de entrevistas de tu equipo, diseña un prompt que genere historias con esta estructura:

```text
HU-XXX

Como <actor>,
quiero <capacidad>,
para <valor>.

Fuente:
Estado: Draft
Preguntas relacionadas:
```

## Validación

Selecciona cinco historias generadas y comprueba manualmente sus fuentes.

## Entregable

```text
prompt_historias_trazables.md
```

---

# Ejercicio práctico 6 — Crear requisitos sin diseñar la solución

## Objetivo

Evitar que los requisitos funcionales se conviertan en decisiones de implementación.

## Tarea

Diseña un prompt que produzca RF con comportamiento observable.

Debe prohibir expresiones como:

```text
El sistema debe usar PostgreSQL.
El backend debe utilizar microservicios.
El frontend debe tener un botón azul.
La solución debe utilizar Redis.
```

Salvo que la fuente lo haya definido explícitamente.

## Salida esperada

```text
RF-XXX
Comportamiento:
Actor/proceso:
Condición:
Resultado:
Historia:
Fuente:
Estado:
```

---

# Ejercicio práctico 7 — Diseñar una autovalidación útil

## Tarea

Crea exclusivamente el bloque de Autovalidación para un prompt que genera una Specification.

Debe verificar al menos:

- trazabilidad;
- invenciones;
- contradicciones;
- RF observables;
- RNF medibles o pendientes;
- criterios verificables;
- decisiones técnicas prematuras;
- preguntas abiertas.

## Restricción

No uses una instrucción genérica como:

```text
Revisa que todo esté correcto.
```

La autovalidación debe describir comprobaciones observables.

---

# Ejercicio práctico 8 — Diseñar la Salida

## Escenario

Quieres que Claude Code lea entrevistas y deje los resultados versionados.

## Tarea

Construye únicamente el bloque Salida para que genere:

```text
README.md
00_application_specification.md
01_user_stories.md
02_requirements.md
03_business_rules.md
04_acceptance_criteria.md
05_open_questions_and_validations.md
```

También debe indicar:

- ruta de salida;
- rama;
- commit;
- Pull Request;
- qué debe reportar al finalizar.

---

# Ejercicio práctico 9 — Parametrizar para reutilizar

## Prompt inicial

```text
Lee casos_de_uso/02_seguros_siniestro_facil.md y genera la Specification de Siniestro Fácil en casos_de_uso/specs/siniestro_facil/.
```

## Tarea

Conviértelo en un prompt reutilizable para banca, seguros y retail usando variables.

Como mínimo:

```text
SOLUTION_NAME=
INDUSTRY=
INTERVIEW_FILE=
OUTPUT_PATH=
BRANCH_NAME=
```

## Pregunta

¿Qué instrucciones deberían permanecer iguales en todos los casos?

---

# Ejercicio práctico 10 — Crear un prompt deliberadamente resistente a alucinaciones

## Tarea

Diseña un prompt para extraer reglas de negocio.

La dificultad: algunas frases de las entrevistas parecen reglas, pero no necesariamente lo son.

Tu prompt debe clasificar resultados como:

- Regla confirmada.
- Restricción.
- Necesidad.
- Preferencia.
- Supuesto.
- Pregunta abierta.

## Criterio de éxito

El modelo no debe convertir una preferencia de un entrevistado en una regla aprobada.

---

# Ejercicio práctico 11 — Prompt para comparar sin decidir

## Escenario

El equipo debe evaluar dos alternativas de base de datos más adelante.

## Tarea

Diseña un prompt que compare alternativas utilizando criterios del Spec, pero que no seleccione ganadora si faltan métricas o requisitos.

Debe generar:

| Criterio | Alternativa A | Alternativa B | Evidencia | Decisión posible |
|---|---|---|---|---|

## Aprendizaje

Un buen prompt puede ayudar a decidir sin forzar una decisión.

---

# Ejercicio práctico 12 — Mejorar un prompt después de ver su error

## Dinámica

1. Diseña `prompt_atlas_v1.md`.
2. Ejecútalo.
3. Encuentra al menos tres problemas reales de la salida.
4. No edites directamente la respuesta.
5. Modifica el prompt para atacar las causas.
6. Guarda como `prompt_atlas_v1_1.md`.
7. Ejecuta nuevamente.

## Evidencia

Crear:

```text
execution_evidence.md
```

Con la tabla:

| Hallazgo v1 | Causa en el prompt | Cambio v1.1 | Resultado |
|---|---|---|---|

---

# Ejercicio práctico 13 — Prompt para actualizar, no regenerar

## Escenario

Ya existe una Specification y llegó una nueva entrevista.

## Tarea

Diseña un prompt para actualizar el documento existente sin reemplazar silenciosamente decisiones previas.

Debe:

- leer la versión vigente;
- leer la nueva evidencia;
- identificar cambios;
- detectar conflictos;
- proponer modificaciones;
- conservar historial;
- incrementar versión;
- indicar qué requisitos y criterios quedan afectados.

## Aprendizaje

En SDD, muchas tareas son incrementales. No siempre se genera desde cero.

---

# Ejercicio práctico 14 — Prompt para preparar la siguiente sesión

## Objetivo

Conectar Prompt Engineering con Modelado Conceptual.

## Tarea

A partir de la Specification vigente, diseña un prompt que identifique:

- conceptos de negocio candidatos;
- entidades candidatas;
- relaciones mencionadas;
- eventos;
- estados;
- cardinalidades conocidas;
- cardinalidades no definidas;
- preguntas necesarias antes del modelo conceptual.

## Límite fundamental

No debe crear todavía:

- tipos SQL;
- tablas;
- índices;
- claves físicas;
- tecnología de persistencia.

---

# Entrega final de práctica

Cada equipo debe dejar en su repositorio:

```text
prompts/
├── prompt_atlas_v1.md
├── prompt_atlas_v1_1.md
├── prompt_historias_trazables.md
├── prompt_rnf_sin_inventar.md
├── validation_checklist.md
└── execution_evidence.md
```

## Definition of Done

El alumno demuestra dominio inicial cuando puede explicar:

1. qué problema resuelve cada componente de ATLAS;
2. cómo evitar falsa precisión;
3. cómo convertir información faltante en preguntas;
4. cómo exigir trazabilidad;
5. cómo evaluar la salida antes de confiar en ella;
6. cómo transformar un prompt específico en reutilizable;
7. cómo mejorar el prompt a partir de evidencia de ejecución.
