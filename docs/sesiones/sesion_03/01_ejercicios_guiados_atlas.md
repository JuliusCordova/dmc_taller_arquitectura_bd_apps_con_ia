# Ejercicios guiados — Prompt Engineering ATLAS

## Objetivo

Construir con el docente un mismo prompt de forma incremental hasta convertirlo en una instrucción ATLAS controlada y verificable.

---

# Ejercicio guiado 1 — Ver cómo falla un prompt ambiguo

## Prompt inicial

```text
Diseña una aplicación para gestionar siniestros vehiculares.
```

## Ejecutar y observar

Pedir al modelo que responda sin agregar contexto adicional.

## Preguntas para la clase

1. ¿Qué información inventó?
2. ¿Definió tecnologías sin que se le pidiera?
3. ¿Propuso reglas que no conocemos?
4. ¿Sabemos de dónde salió cada decisión?
5. ¿Podríamos usar esta respuesta como especificación de desarrollo?

## Aprendizaje

Un prompt abierto deja al modelo demasiado espacio para completar vacíos con conocimiento general o supuestos.

---

# Ejercicio guiado 2 — Incorporar una Tarea observable

## Prompt

```text
Lee las entrevistas de Siniestro Fácil e identifica:

- actores;
- problemas;
- objetivos;
- procesos;
- restricciones;
- preguntas abiertas.
```

## Comparar contra el ejercicio 1

Evaluar:

- precisión;
- estructura;
- cantidad de supuestos;
- utilidad para continuar trabajando.

## Discusión

La tarea debe utilizar verbos observables: identificar, extraer, comparar, clasificar, validar, generar, registrar.

Evitar instrucciones como:

```text
Analiza bien el caso.
Haz algo profesional.
Diseña la mejor solución.
```

---

# Ejercicio guiado 3 — Agregar Actor

## Prompt

```text
## ACTOR

Actúa como Arquitecto de Soluciones Senior,
Analista de Negocio y especialista en Spec-Driven Development.

## TAREA

Lee las entrevistas de Siniestro Fácil e identifica:

- actores;
- problemas;
- objetivos;
- procesos;
- restricciones;
- preguntas abiertas.
```

## Pregunta para los alumnos

¿Qué cambia al definir el rol?

## Criterio

El Actor debe cambiar la perspectiva de trabajo. Evitar roles decorativos como "eres el mejor experto del mundo".

---

# Ejercicio guiado 4 — Controlar invenciones con Límites

Agregar:

```text
## LÍMITES

Utiliza únicamente información presente en las entrevistas.

No inventes:

- actores;
- cifras;
- reglas;
- SLA;
- integraciones;
- tecnologías;
- estados;
- decisiones de arquitectura.

Cuando falte información, crea una pregunta abierta.

Cuando las entrevistas se contradigan, conserva ambas posiciones y registra una pregunta para resolverlas.
```

## Prueba deliberada

Después de ejecutar, preguntar al modelo:

```text
¿Cuál debería ser el SLA de primera atención?
```

La respuesta correcta para este ejercicio no es inventar un tiempo. Debe identificar que falta información o que necesita una fuente autorizada.

---

# Ejercicio guiado 5 — Agregar trazabilidad

Incorporar:

```text
Asigna referencias a las entrevistas:

CEO-01 a CEO-10
OPERACIONES-01 a OPERACIONES-10
FRAUDE-01 a FRAUDE-10

Cada historia, requisito, regla o restricción debe indicar su fuente.
```

## Validación en clase

Elegir tres resultados al azar y verificar si pueden rastrearse hasta la entrevista.

## Pregunta

¿Qué diferencia existe entre una respuesta correcta y una respuesta auditable?

---

# Ejercicio guiado 6 — Incorporar Autovalidación

Agregar:

```text
## AUTOVALIDACIÓN

Antes de finalizar, revisa tu resultado como auditor SDD y confirma:

- cada requisito tiene una fuente;
- no existen cifras inventadas;
- no se seleccionó tecnología sin autorización;
- las contradicciones permanecen visibles;
- los vacíos se transformaron en preguntas;
- las alertas antifraude no se trataron como fraude confirmado;
- las decisiones sensibles conservan revisión humana.

Si detectas un incumplimiento, corrígelo antes de entregar y explica qué corregiste.
```

## Aprendizaje

La primera generación no tiene por qué ser la salida final. El prompt puede exigir una segunda pasada de control de calidad.

---

# Ejercicio guiado 7 — Definir la Salida

Agregar:

```text
## SALIDA

Organiza el resultado en:

1. Actores.
2. Problemas.
3. Objetivos.
4. Procesos.
5. Restricciones.
6. Reglas confirmadas.
7. Preguntas abiertas.

Para cada elemento incluye su fuente.
```

## Discusión

Una buena salida define:

- estructura;
- formato;
- nombres;
- ubicación;
- criterios de finalización.

---

# Ejercicio guiado 8 — ATLAS completo

## Prompt resultante

```text
# PROMPT ATLAS

## ACTOR

Actúa como Arquitecto de Soluciones Senior,
Analista de Negocio y especialista en Spec-Driven Development.

## TAREA

Lee completamente las entrevistas de Siniestro Fácil.

Extrae y clasifica:

- actores;
- problemas;
- objetivos;
- procesos;
- restricciones;
- reglas confirmadas;
- preguntas abiertas.

## LÍMITES

Utiliza únicamente información presente en las entrevistas.

No inventes actores, cifras, reglas, SLA, integraciones,
tecnologías, estados ni decisiones de arquitectura.

Cuando falte información, crea una pregunta abierta.

Cuando exista una contradicción, conserva ambas posiciones y crea una pregunta de validación.

## AUTOVALIDACIÓN

Antes de entregar, verifica:

- cada elemento tiene una fuente;
- no existen cifras inventadas;
- no se seleccionó tecnología;
- los vacíos permanecen visibles;
- las contradicciones no fueron ocultadas;
- una alerta antifraude no equivale a fraude confirmado.

## SALIDA

Entrega:

1. Actores.
2. Problemas.
3. Objetivos.
4. Procesos.
5. Restricciones.
6. Reglas confirmadas.
7. Preguntas abiertas.

Incluye una referencia a la entrevista de origen para cada elemento.
```

---

# Ejercicio guiado 9 — Convertir el prompt en reutilizable

Sustituir valores fijos por variables:

```text
SOLUTION_NAME=<nombre de la solución>
INTERVIEW_FILE=<ruta de entrevistas>
OUTPUT_PATH=<ruta de salida>
BRANCH_NAME=<rama Git>
```

Modificar la Tarea:

```text
Lee completamente INTERVIEW_FILE y genera la Specification inicial de SOLUTION_NAME.
```

Modificar la Salida:

```text
Escribe los artefactos en OUTPUT_PATH.
```

## Pregunta

¿Qué partes del prompt pertenecen al método y cuáles pertenecen al caso de uso?

---

# Ejercicio guiado 10 — Prompt que utiliza GitHub

Agregar una secuencia de ejecución:

```text
1. Verifica que INTERVIEW_FILE exista.
2. Lee el archivo completo antes de escribir.
3. Crea BRANCH_NAME desde main.
4. Crea OUTPUT_PATH.
5. Genera los archivos solicitados.
6. Revisa consistencia entre documentos.
7. Realiza commits descriptivos.
8. Crea un Pull Request hacia main.
9. No fusiones el Pull Request sin autorización.
```

## Discusión

Aquí el prompt deja de definir solo contenido y empieza a definir un flujo de trabajo.

---

# Ejercicio guiado 11 — Generate → Critique → Refine

## Paso 1 — Generate

```text
Genera la primera versión de la Specification utilizando únicamente la evidencia disponible.
```

## Paso 2 — Critique

```text
Ahora revisa el resultado como auditor SDD.

Identifica exclusivamente:

- invenciones;
- requisitos sin fuente;
- contradicciones ocultadas;
- criterios no verificables;
- decisiones técnicas prematuras;
- información presentada como confirmada sin evidencia.

No corrijas todavía. Genera una lista de hallazgos.
```

## Paso 3 — Refine

```text
Corrige únicamente los hallazgos identificados.

No completes vacíos con conocimiento general.
Convierte la información faltante en preguntas abiertas.
```

## Aprendizaje

Separar generación y crítica suele producir una revisión más explícita y fácil de auditar.

---

# Ejercicio guiado 12 — Del prompt al SDD

Pedir al grupo completar esta cadena:

```text
Entrevista
   ↓
Prompt ATLAS
   ↓
Specification
   ↓
Historia
   ↓
Requisito
   ↓
Criterio de aceptación
   ↓
Prueba
   ↓
Evidencia
```

## Cierre de los ejercicios guiados

El alumno debe poder explicar por qué cada componente existe:

- Actor controla perspectiva.
- Tarea controla intención.
- Límites controlan libertad de inferencia.
- Autovalidación controla calidad.
- Salida controla el artefacto resultante.
