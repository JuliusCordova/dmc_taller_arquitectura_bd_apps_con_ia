# Prompts ATLAS — Sprint de construcción de backend

## Propósito

Usar ATLAS para transformar la Specification de **Siniestro Fácil** en un sprint de backend controlado, trazable y verificable.

---

## Prompt 1 — Evaluar readiness antes de construir

### Actor

Actúa como arquitecto de software, analista SDD y revisor de calidad.

### Tarea

Evalúa si la historia seleccionada de Siniestro Fácil está lista para entrar al sprint de backend.

### Límites

- No inventes requisitos, reglas, atributos, estados ni integraciones.
- Usa únicamente la Specification y artefactos versionados.
- Si falta información crítica, marca la historia como `BLOCKED`.
- No generes código todavía.

### Autovalidación

Comprueba:

- historia → requisito;
- requisito → regla;
- regla → criterio de aceptación;
- criterio → datos requeridos;
- datos → tablas/columnas;
- preguntas abiertas críticas;
- posibilidad real de escribir pruebas.

### Salida

Entrega:

1. Estado `READY`, `READY_WITH_ASSUMPTIONS` o `BLOCKED`.
2. Evidencias usadas.
3. Vacíos detectados.
4. Supuestos permitidos.
5. Preguntas bloqueantes.
6. Recomendación de entrada al sprint.

---

## Prompt 2 — Construir el sprint desde historias, no desde endpoints

### Actor

Actúa como tech lead backend y especialista en Spec-Driven Development.

### Tarea

A partir de las historias `READY` de Siniestro Fácil, construye un sprint de backend incremental.

### Límites

- No agregues funcionalidades fuera del MVP.
- No inventes endpoints por conveniencia técnica.
- Cada tarea debe tener trazabilidad a una historia, requisito o criterio de aceptación.
- Separa trabajo funcional, persistencia, contrato, pruebas y evidencia.
- No selecciones tecnología distinta de la ya aprobada en la Specification.

### Autovalidación

Para cada historia confirma que el sprint cubra:

- contrato de entrada/salida;
- validaciones;
- persistencia;
- transacción;
- manejo de errores;
- seguridad/autorización cuando aplique;
- pruebas positivas y negativas;
- evidencia.

### Salida

Genera una tabla:

| Orden | Historia | Slice backend | Datos | Contrato | Prueba | Evidencia | Dependencia |
|---|---|---|---|---|---|---|---|

Luego propone el orden de construcción y justifica dependencias.

---

## Prompt 3 — Derivar un vertical slice

### Actor

Actúa como backend engineer senior trabajando bajo SDD.

### Tarea

Diseña el vertical slice para la historia **Registrar un siniestro**.

### Límites

- Trabaja solo con reglas y datos sustentados por la Specification.
- No inventes campos.
- No generes aún implementación completa.
- Mantén separadas validación, dominio, persistencia y contrato.

### Autovalidación

Comprueba que exista trazabilidad entre:

```text
Historia
→ Requisito
→ Regla
→ Criterio de aceptación
→ Request/Response
→ Servicio
→ Persistencia
→ Prueba
```

### Salida

Entrega:

1. Precondiciones.
2. Request lógico.
3. Validaciones.
4. Reglas aplicables.
5. Operaciones de persistencia.
6. Respuesta esperada.
7. Errores posibles.
8. Pruebas derivadas de criterios de aceptación.
9. Preguntas abiertas.

---

## Prompt 4 — Generate → Critique → Refine del backlog técnico

### Actor

Actúa primero como tech lead generador y luego como revisor independiente.

### Tarea

Genera un backlog técnico para el sprint y después audítalo.

### Límites

- No aceptes tareas sin trazabilidad.
- No aceptes tareas genéricas como “hacer API” o “crear base”.
- Cada tarea debe producir un resultado verificable.

### Autovalidación

Audita:

- historias cubiertas;
- tareas sin fuente;
- duplicidad;
- dependencias omitidas;
- pruebas ausentes;
- decisiones inventadas;
- tamaño excesivo de slices;
- ausencia de evidencia.

### Salida

Entrega tres secciones:

1. `GENERATE` — backlog inicial.
2. `CRITIQUE` — defectos detectados.
3. `REFINE` — backlog corregido.

---

## Prompt 5 — Preparar implementación asistida por IA

### Actor

Actúa como desarrollador backend senior y guardián de la Specification.

### Tarea

Genera la implementación únicamente para una tarea aprobada del sprint.

### Límites

- No modifiques el modelo de datos sin decisión registrada.
- No agregues atributos, estados ni reglas nuevas.
- Si detectas un vacío, detén esa parte y crea una pregunta abierta.
- Mantén trazabilidad en comentarios, nombres de pruebas o documentación.
- Genera pruebas junto con el código.

### Autovalidación

Antes de declarar terminado verifica:

- compila/ejecuta;
- migraciones aplican desde cero;
- pruebas positivas pasan;
- pruebas negativas pasan;
- no existen decisiones no sustentadas;
- se puede identificar qué criterio de aceptación demuestra cada prueba.

### Salida

Entrega:

1. Archivos creados/modificados.
2. Código.
3. Pruebas.
4. Comandos de ejecución.
5. Evidencia esperada.
6. Hallazgos y preguntas.

---

## Prompt 6 — Auditor del sprint antes del merge

### Actor

Actúa como revisor de arquitectura, datos y backend independiente del equipo que construyó el sprint.

### Tarea

Audita el incremento antes de mergear.

### Límites

- No evalúes por estilo personal.
- Evalúa contra Specification, historias, reglas y criterios.
- Señala cualquier comportamiento implementado sin fuente.

### Autovalidación

Comprueba:

- cobertura historia → prueba;
- reglas críticas;
- integridad de datos;
- transacciones;
- manejo de errores;
- trazabilidad;
- migraciones reproducibles;
- preguntas abiertas no escondidas en código.

### Salida

Entrega:

- `PASS`, `PASS_WITH_OBSERVATIONS` o `FAIL`;
- hallazgos por severidad;
- evidencia faltante;
- correcciones requeridas antes del merge.

---

## Secuencia recomendada en clase

```text
Specification
      ↓
Prompt 1 · Readiness
      ↓
Historias READY
      ↓
Prompt 2 · Sprint
      ↓
Prompt 3 · Vertical slice
      ↓
Prompt 4 · Critique / Refine
      ↓
Prompt 5 · Implementación
      ↓
Pruebas y evidencia
      ↓
Prompt 6 · Auditoría
      ↓
Merge
```

## Idea fuerza

> El prompt de construcción no sustituye a la Specification. La Specification limita el espacio de decisiones; ATLAS convierte ese espacio en una instrucción ejecutable y auditable.
