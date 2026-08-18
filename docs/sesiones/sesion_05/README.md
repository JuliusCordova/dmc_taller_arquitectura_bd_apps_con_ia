# Sesión 05 — Modelado lógico, normalización y validación física con IA

## Propósito

Transformar un modelo conceptual validado en un modelo lógico consistente, normalizado y trazable, utilizando IA como copiloto de análisis y el framework ATLAS como mecanismo de control.

La sesión continúa directamente el trabajo de la Sesión 04. El alumno parte de entidades, relaciones y cardinalidades justificadas, decide dónde vive cada dato, demuestra sus dependencias y normalización, y llega hasta un **blueprint físico PostgreSQL profesional** que debe ser validado mediante scripts ejecutables.

## Pregunta central

> Si dos modelos representan el mismo negocio, ¿cómo demostramos cuál protege mejor la integridad y cómo comprobamos que su implementación rechaza estados inválidos?

## Resultado observable

Al finalizar la sesión, cada equipo debe producir:

- modelo lógico derivado del conceptual;
- atributos e identificadores;
- PK y FK;
- resolución de N:M;
- revisión de 1FN, 2FN y 3FN;
- justificación de cualquier desnormalización;
- diccionario de datos;
- trazabilidad requisito → entidad → atributo/regla;
- prompt ATLAS para Generate–Critique–Refine;
- blueprint físico PostgreSQL;
- tipos, constraints e índices iniciales justificados;
- columnas de auditoría en las tablas críticas;
- DDL recreable desde cero;
- pruebas positivas y negativas ejecutadas desde script;
- salida de ejecución guardada como evidencia;
- Specification actualizada con decisiones y preguntas.

## Frontera con la Sesión 06

La Sesión 05 llega hasta **diseño físico verificable** para enseñar que un modelo no termina en el diagrama.

La Sesión 06 profundiza la implementación PostgreSQL como disciplina de ingeniería:

- diseño físico completo;
- convenciones definitivas;
- migraciones versionadas;
- constraints avanzados;
- transacciones;
- preparación para integración y evolución del esquema.

## Archivos

1. `01_plan_docente_3_horas.md` — conducción base de la sesión.
2. `02_guia_modelado_logico_normalizacion.md` — marco conceptual.
3. `03_plan_ejercicios.md` — secuencia de ejercicios.
4. `04_ejercicios_guiados_alumnos.md` — práctica guiada.
5. `05_taller_practico_alumnos.md` — aplicación al proyecto integrador.
6. `06_prompt_atlas_modelado_logico.md` — Generate–Critique–Refine.
7. `07_checklist_validacion_modelo_logico.md` — gate lógico.
8. `08_laboratorios_atlas_modelo_fisico_validacion/` — laboratorios end-to-end con DDL y pruebas ejecutables para los tres casos oficiales.

## Tres laboratorios oficiales

| Industria | Caso | Laboratorio |
|---|---|---|
| Banca | Crédito Ágil 360 | `08_laboratorios_atlas_modelo_fisico_validacion/banca_credito_agil_360/` |
| Seguros | Siniestro Fácil | `08_laboratorios_atlas_modelo_fisico_validacion/seguros_siniestro_facil/` |
| Retail | Stock Único | `08_laboratorios_atlas_modelo_fisico_validacion/retail_stock_unico/` |

## Flujo de la sesión

```text
Sesión 04
Modelo conceptual
        ↓
Sesión 05
Modelo lógico
        ↓
Dependencias + 1FN + 2FN + 3FN
        ↓
Gate lógico
        ↓
Blueprint físico profesional
        ↓
DDL PostgreSQL
        ↓
Script de pruebas positivas y negativas
        ↓
Evidencia PASS / FAIL
        ↓
Corrección + trazabilidad + commit
        ↓
Sesión 06
Implementación PostgreSQL y evolución controlada
```

## Mensaje central

> Normalizar es demostrar de qué depende cada dato. Diseñar físicamente es convertir esa decisión en controles. Validar es demostrar con evidencia que esos controles funcionan.
