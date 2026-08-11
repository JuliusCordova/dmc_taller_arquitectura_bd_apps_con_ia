# Retos avanzados — Prompt Engineering ATLAS

## Propósito

Estos retos buscan que el alumno deje de pensar en prompts como texto estático y empiece a tratarlos como artefactos de ingeniería: versionables, evaluables, reutilizables y conectados a herramientas.

---

# Reto 1 — Prompt con dos roles separados

Diseña un flujo en dos pasos:

1. **Generador SDD:** produce el borrador.
2. **Auditor SDD:** revisa sin modificar.

El auditor debe detectar:

- afirmaciones sin fuente;
- decisiones técnicas prematuras;
- contradicciones ocultas;
- requisitos vagos;
- criterios no verificables;
- supuestos convertidos en hechos.

Después crea un tercer paso de refinamiento basado únicamente en los hallazgos aceptados.

## Entregable

```text
prompt_generate.md
prompt_critique.md
prompt_refine.md
```

---

# Reto 2 — Prompt con criterio de detención

Construye un prompt que no avance a escritura cuando exista una condición bloqueante.

Ejemplo de gate:

```text
No generes el modelo conceptual si no puedes identificar con evidencia:
- actores principales;
- objetos de negocio candidatos;
- proceso principal;
- alcance MVP.
```

En caso de bloqueo, la salida debe ser una lista de preguntas y no un diseño inventado.

---

# Reto 3 — Prompt para actualizar una Specification viva

Diseña un prompt que compare:

```text
SPEC_VERSION_ACTUAL
vs.
NUEVA_ENTREVISTA
```

Debe clasificar cada nuevo hallazgo como:

- confirmado;
- modifica;
- contradice;
- amplía;
- fuera de alcance;
- pregunta abierta.

Debe indicar qué historias, RF, RNF, reglas y criterios podrían verse afectados.

---

# Reto 4 — Prompt con matriz de evidencia

La salida debe incluir:

| Fuente | Evidencia | Tipo | Artefacto derivado | Confianza | Validación pendiente |
|---|---|---|---|---|---|

## Restricción

La columna `Confianza` no debe ser una cifra inventada. Utiliza categorías explícitas como:

- Directo;
- Derivado;
- Ambiguo;
- Contradictorio.

---

# Reto 5 — Prompt con GitHub como sistema de trabajo

Diseña un prompt operativo que:

1. inspeccione el repositorio;
2. lea el Spec vigente;
3. cree rama;
4. haga cambios mínimos;
5. valide enlaces;
6. compare contra `main`;
7. cree PR;
8. reporte archivos y riesgos;
9. no haga merge.

## Criterio

Debe diferenciar entre generar texto y ejecutar acciones sobre el repositorio.

---

# Reto 6 — Prompt para Figma sin falsa precisión

Diseña un prompt para un prototipo preliminar basado en historias y requisitos.

Debe prohibir:

- inventar cifras;
- inventar precios;
- inventar SLA;
- inventar estados no definidos;
- inventar políticas.

Cuando falte contenido debe usar etiquetas como:

```text
Por definir
Pendiente de validación
Sujeto a política
```

La salida debe incluir trazabilidad entre pantalla e historia de usuario.

---

# Reto 7 — Prompt de evaluación adversarial

Diseña un prompt que intente romper la Specification mediante preguntas como:

- ¿Qué pasa si el usuario reintenta?
- ¿Qué pasa si el proveedor no responde?
- ¿Qué pasa si llega información contradictoria?
- ¿Qué pasa si una integración responde tarde?
- ¿Qué pasa si existe duplicidad?
- ¿Qué pasa si una regla cambia después de una decisión?

El objetivo no es inventar soluciones, sino identificar vacíos y preguntas nuevas.

---

# Reto 8 — Crear un mini Skill ATLAS

Transforma el prompt de tu equipo en un conjunto de instrucciones reutilizables.

Debe separar:

```text
Método estable
vs.
Variables del caso
vs.
Plantillas de salida
vs.
Checklists
```

## Entregable sugerido

```text
skill/
├── SKILL.md
├── references/
│   └── validation-checklist.md
└── templates/
    └── specification-template.md
```

---

# Reto final — ATLAS Challenge

El docente entrega una entrevista nueva que el equipo no ha visto.

En 20 minutos el equipo debe:

1. adaptar su Prompt ATLAS;
2. ejecutarlo;
3. obtener una salida estructurada;
4. encontrar dos posibles fallas;
5. ajustar el prompt;
6. ejecutar v1.1;
7. explicar qué cambió y por qué.

## Evaluación

No gana el equipo que genere más contenido. Gana el equipo que produzca la salida más:

- fiel a la evidencia;
- trazable;
- controlada;
- verificable;
- reutilizable;
- clara sobre lo que aún no sabe.
