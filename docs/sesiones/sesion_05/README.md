# Sesión 05 — Modelado lógico y normalización con IA

## Propósito

Transformar un modelo conceptual validado en un modelo lógico consistente, normalizado y trazable, utilizando IA como copiloto de análisis y el framework ATLAS como mecanismo de control.

La sesión continúa directamente el trabajo de la Sesión 04. El alumno parte de entidades, relaciones y cardinalidades ya justificadas y ahora debe decidir cómo organizar atributos, identificadores, claves lógicas, dependencias y entidades asociativas sin entrar todavía en decisiones físicas de PostgreSQL.

## Pregunta central

> Si dos modelos representan el mismo negocio, ¿cómo demostramos cuál organiza mejor los datos y protege mejor su integridad?

## Resultado observable

Al finalizar la sesión, cada equipo debe producir:

- modelo lógico derivado del modelo conceptual;
- entidades con atributos e identificadores;
- PK y FK lógicas;
- resolución de relaciones N:M;
- revisión de primera, segunda y tercera forma normal;
- justificación explícita de cualquier desnormalización;
- diccionario de datos inicial;
- matriz de trazabilidad requisito → entidad → atributo/regla;
- prompt ATLAS especializado para generación y auditoría del modelo lógico;
- checklist de validación y preguntas pendientes;
- actualización del DMC Application Specification.

## Límites de la sesión

Todavía no se diseña el modelo físico. Por tanto, no se deben introducir:

- tipos SQL;
- `CREATE TABLE`;
- índices;
- secuencias;
- particionamiento;
- extensiones PostgreSQL;
- decisiones específicas del motor.

Estas decisiones corresponden a la Sesión 06.

## Archivos

1. `01_plan_docente_3_horas.md` — conducción completa de la sesión.
2. `02_guia_modelado_logico_normalizacion.md` — marco conceptual y ejemplos.
3. `03_plan_ejercicios.md` — secuencia de ejercicios para el docente.
4. `04_ejercicios_guiados_alumnos.md` — práctica guiada entregable.
5. `05_taller_practico_alumnos.md` — aplicación al proyecto integrador.
6. `06_prompt_atlas_modelado_logico.md` — prompt especializado Generate–Critique–Refine.
7. `07_checklist_validacion_modelo_logico.md` — Definition of Done y auditoría.

## Conexión dentro del programa

```text
Sesión 04
Modelo conceptual
Entidades + relaciones + cardinalidades
        ↓
Sesión 05
Modelo lógico
Atributos + claves + dependencias + normalización
        ↓
Sesión 06
Modelo físico PostgreSQL
Tipos + constraints + DDL + migraciones
```

## Mensaje central

> Normalizar no es aplicar reglas de memoria. Es demostrar de qué depende cada dato y ubicarlo donde esa dependencia pueda mantenerse sin anomalías.
