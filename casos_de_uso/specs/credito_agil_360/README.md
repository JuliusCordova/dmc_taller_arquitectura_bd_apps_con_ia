# Crédito Ágil 360 — Specification SDD

Esta carpeta contiene la especificación construible y el plan vivo de desarrollo del caso **Banco Andino Digital — Crédito Ágil 360**.

## Fuente de evidencia

- `casos_de_uso/01_banca_credito_agil_360.md`
- Entrevista a CEO.
- Entrevista a Riesgos de Crédito.
- Entrevista a Canales Digitales.

Las entrevistas constituyen evidencia de descubrimiento, no una especificación aprobada. Toda ausencia se registra como pregunta abierta.

## Artefactos existentes

- `00_application_specification.md`: fuente de verdad funcional v0.2.
- `01_user_stories.md`: backlog inicial y trazabilidad.
- `02_requirements.md`: requisitos funcionales y no funcionales.
- `03_acceptance_criteria.md`: criterios Dado–Cuando–Entonces.
- `04_open_questions_and_validations.md`: vacíos y validaciones pendientes.
- `05_figma_prototype.md`: prototipo preliminar existente.
- `06_development_plan.md`: plan vivo SDD.
- `07_data_models_and_synthetic_data_plan.md`: plan de modelos y datos sintéticos.

## Artefactos complementarios de arquitectura y validación

- `01-producto-y-alcance.md`: visión, alcance, actores, hechos y propuestas.
- `02-historias-de-usuario.md`: historias priorizadas con criterios Given/When/Then.
- `03-requisitos.md`: requisitos funcionales y no funcionales verificables.
- `04-arquitectura-y-datos.md`: arquitectura preliminar, datos y decisiones síncronas/asíncronas.
- `05-validaciones-y-trazabilidad.md`: validaciones, pruebas, puertas SDD y trazabilidad.
- `06-preguntas-abiertas.md`: decisiones pendientes, prioridad y responsables sugeridos.
- `07-prototipo-figma.md`: alcance y validación del nuevo prototipo móvil.

## Estado y convención

- Estado: borrador pendiente de validación con Negocio, Riesgos, Canales, Cumplimiento, Seguridad y Operaciones.
- **CONFIRMADO**: declarado en entrevistas.
- **PROPUESTA**: decisión preliminar; requiere validación.
- **POR RESPONDER**: falta información; no se implementa como regla definitiva.
- Todo desarrollo debe vincularse con una historia/requisito, conservar la fuente y actualizar especificación, trazabilidad y plan vivo.

## Prototipos Figma

- [Prototipo móvil preliminar — 2026-08-13](https://www.figma.com/design/657NioLc54nOucv3LGxJUF)
- [Prototipo preliminar SDD existente](https://www.figma.com/design/X0i1TFLqE3KkkxQqtN8mMg)

## Definition of Ready

Una historia está lista solo si sus preguntas bloqueantes están resueltas, sus reglas tienen responsable y versión, se conocen contratos de integración, se aprobaron criterios de aceptación y se definieron controles de seguridad, auditoría e idempotencia aplicables.
