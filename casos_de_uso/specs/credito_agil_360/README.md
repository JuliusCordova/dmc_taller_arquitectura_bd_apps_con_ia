# Crédito Ágil 360 — Specification SDD

Esta carpeta contiene la especificación construible y el plan vivo de desarrollo del caso **Banco Andino Digital — Crédito Ágil 360**.

## Fuente de evidencia

- `casos_de_uso/01_banca_credito_agil_360.md`
- Entrevista a CEO.
- Entrevista a Riesgos de Crédito.
- Entrevista a Canales Digitales.

Las entrevistas constituyen evidencia de descubrimiento, no una especificación aprobada. La documentación no agrega cifras, reglas, tecnologías ni decisiones que no estén respaldadas por las entrevistas. Toda ausencia se registra como pregunta abierta.

## Los 12 bloques canónicos

La fuente de verdad `00_application_specification.md` está organizada en:

1. Identidad.
2. Contexto.
3. Objetivos.
4. Alcance.
5. Actores.
6. Procesos.
7. Historias.
8. Requisitos funcionales.
9. Requisitos no funcionales.
10. Reglas.
11. Criterios.
12. Preguntas.

## Artefactos

- `00_application_specification.md`: fuente de verdad funcional v0.2.
- `01_user_stories.md`: backlog inicial y trazabilidad.
- `02_requirements.md`: requisitos funcionales y no funcionales.
- `03_acceptance_criteria.md`: criterios observables en formato Dado–Cuando–Entonces.
- `04_open_questions_and_validations.md`: vacíos, contradicciones y validaciones pendientes.
- `05_figma_prototype.md`: alcance y vínculo del prototipo preliminar.
- `06_development_plan.md`: plan vivo SDD actualizado por sesión.
- `07_data_models_and_synthetic_data_plan.md`: plan para modelo conceptual, lógico, físico y datos sintéticos.

## Estado

- Versión de Specification: `0.2-draft`.
- Estado: pendiente de validación con Negocio, Riesgos, Canales, Cumplimiento, Seguridad y Operaciones.
- Método: Spec-Driven Development.
- Fuente de verdad: `00_application_specification.md`.
- Plan maestro: `06_development_plan.md`.

## Regla de trabajo

Toda decisión posterior de arquitectura, modelo de datos, API, pruebas, agentes o implementación deberá:

1. vincularse con una historia, requisito o pregunta de esta carpeta;
2. conservar la referencia a la entrevista de origen;
3. evitar convertir supuestos en hechos;
4. actualizar la Specification y la matriz de trazabilidad;
5. actualizar el plan vivo al cierre de cada sesión;
6. conservar evidencia verificable del incremento.

## Evolución de datos

El proyecto desarrollará progresivamente:

- modelo conceptual;
- modelo lógico;
- modelo físico;
- diccionario de datos;
- migraciones;
- estrategia y generadores de datos sintéticos;
- datasets funcionales, de casos borde y de rendimiento.

No se utilizarán datos personales reales en el curso.

## Prototipo Figma

[Crédito Ágil 360 — Prototipo preliminar SDD](https://www.figma.com/design/X0i1TFLqE3KkkxQqtN8mMg)
