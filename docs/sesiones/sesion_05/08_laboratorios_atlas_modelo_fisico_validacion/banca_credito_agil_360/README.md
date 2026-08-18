# Laboratorio guiado — Banca · Crédito Ágil 360

## Fuente obligatoria

Trabaja sobre:

```text
casos_de_uso/01_banca_credito_agil_360.md
```

La evidencia del caso exige, entre otros puntos, identificar al solicitante, conservar la solicitud única entre canales, registrar documentos, reconstruir una evaluación crediticia histórica, conservar la versión de reglas utilizada y evitar evaluaciones o desembolsos duplicados.

## Objetivo

Construir y validar un modelo lógico/físico mínimo para **Crédito Ágil 360** que preserve:

- identidad del cliente;
- continuidad omnicanal de la solicitud;
- documentos asociados;
- evaluación reproducible;
- resultado y versión de reglas;
- idempotencia;
- trazabilidad y auditoría.

No se pretende modelar todo el banco. El ejercicio cubre un corte vertical suficientemente rico para demostrar la metodología.

---

# Paso 1 — Preparar la rama y la evidencia

```bash
git checkout -b lab/s05-banca-modelo-fisico
mkdir -p evidence/sesion_05/banca
```

Registra:

```text
SOURCE=casos_de_uso/01_banca_credito_agil_360.md
CASE=Credito Agil 360
SESSION=05
```

---

# Paso 2 — Extraer hechos que afectan al modelo

Construye una tabla con al menos:

| Hecho confirmado | Objeto afectado | Riesgo si se modela mal |
|---|---|---|
| La solicitud necesita un identificador único entre canales | Solicitud | duplicidad / pérdida de continuidad |
| Debe poder reconstruirse qué versión de reglas se utilizó | Evaluación | decisión no reproducible |
| Un reintento no debe evaluar dos veces la misma solicitud | Solicitud/Evaluación | doble procesamiento |
| Un campo extraído de un documento conserva origen y confianza | Documento | dato sin evidencia |

Agrega únicamente hechos respaldados por la fuente o por la Specification vigente.

---

# Paso 3 — ATLAS Generate: modelo lógico

Usa este prompt como base y adáptalo a la ruta real de la Specification.

```text
# ATLAS — CRÉDITO ÁGIL 360 · MODELO LÓGICO

## ACTOR
Actúa como Arquitecto de Datos de banca, especialista en modelado relacional,
normalización y Spec-Driven Development.

## TAREA
Lee la Specification y el caso Crédito Ágil 360.
Transforma el modelo conceptual validado en un modelo lógico para el corte vertical:
Cliente → Solicitud → Documento → Evaluación crediticia.

## LÍMITES
No inventes políticas crediticias, scores, umbrales, productos ni fuentes externas.
No confundas un estado con una entidad si no tiene ciclo de vida propio.
No pierdas la historia de una evaluación cuando cambien datos o reglas.
Cuando una clave de negocio o cardinalidad no esté confirmada, declárala pendiente.

## AUTOVALIDACIÓN
Verifica:
- PK candidatas y elegidas;
- FK derivadas de relaciones confirmadas;
- N:M resueltas;
- dependencias funcionales;
- 1FN, 2FN y 3FN;
- idempotencia de la solicitud;
- reconstrucción histórica de la evaluación;
- trazabilidad documento → dato/evaluación;
- ausencia de datos duplicados sin justificación.

## SALIDA
1. relaciones lógicas;
2. atributos con fuente;
3. PK/FK;
4. dependencias funcionales;
5. hallazgos 1FN–3FN;
6. preguntas abiertas;
7. DER lógico Mermaid;
8. matriz de trazabilidad.
```

Guarda el prompt utilizado en:

```text
docs/prompts/prompt_atlas_s05_banca_modelado_logico_v1.md
```

---

# Paso 4 — Gate lógico

No avances al físico hasta responder:

- ¿`customer_number` y documento representan claves distintas?;
- ¿qué hace única a una solicitud en el negocio?;
- ¿qué diferencia una nueva solicitud de un reintento?;
- ¿una evaluación puede repetirse para la misma solicitud?;
- ¿qué datos deben congelarse para reconstruir la decisión?;
- ¿qué dato pertenece al cliente y cuál pertenece a la solicitud?;

Lo no confirmado queda como pregunta, no como supuesto silencioso.

---

# Paso 5 — ATLAS Refine: blueprint físico profesional

```text
# ATLAS — CRÉDITO ÁGIL 360 · BLUEPRINT FÍSICO

## ACTOR
Actúa como Arquitecto de Datos PostgreSQL para aplicaciones financieras.

## TAREA
Convierte únicamente el modelo lógico aprobado en un blueprint físico PostgreSQL.

## LÍMITES
No agregues reglas de aprobación no presentes en la Specification.
No uses PII real en datos de prueba.
No elimines trazabilidad histórica para simplificar el diseño.

## AUTOVALIDACIÓN
Comprueba:
- tipos coherentes;
- PK y FK;
- UNIQUE para claves de negocio e idempotencia;
- CHECK para dominios simples conocidos;
- nullability justificada;
- TIMESTAMPTZ para eventos temporales relevantes;
- NUMERIC para importes;
- auditoría created/updated/row_version;
- versión de reglas y snapshot de entrada en evaluación;
- hash y confianza en documentos cuando aplique.

## SALIDA
Entrega DDL PostgreSQL y una tabla decisión → justificación → requisito/fuente.
```

---

# Paso 6 — Revisar `01_schema.sql`

El script de referencia crea un mínimo profesional con:

- `customer`;
- `loan_application`;
- `application_document`;
- `credit_evaluation`;
- PK/FK;
- claves únicas;
- `idempotency_key`;
- `ruleset_version`;
- `input_snapshot`;
- hashes y confianza de documentos;
- columnas de auditoría.

Antes de ejecutarlo, cada equipo debe marcar qué decisiones provienen de la fuente y cuáles son decisiones técnicas del ejercicio.

---

# Paso 7 — Ejecutar el modelo desde cero

```bash
export DATABASE_URL='postgresql://usuario:password@localhost:5432/dmc'

bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh banca \
  | tee evidence/sesion_05/banca/validation_output.txt
```

---

# Paso 8 — Qué debe probar el script

`02_validate.sql` comprueba como mínimo:

## Pruebas positivas

- inserción de cliente;
- inserción de solicitud válida;
- documento trazable con hash;
- evaluación ligada a una versión de reglas;
- creación automática de timestamps de auditoría.

## Pruebas negativas

- monto solicitado no positivo;
- solicitud con cliente inexistente;
- reuso del mismo `idempotency_key`;
- confianza de extracción fuera de 0..1;
- resultado de evaluación fuera del dominio permitido.

El objetivo no es “hacer fallar SQL”. El objetivo es demostrar que el **control correcto** rechaza el estado inválido.

---

# Paso 9 — ATLAS Critique sobre evidencia real

Entrega a la IA:

- `01_schema.sql`;
- `02_validate.sql`;
- `validation_output.txt`;
- modelo lógico;
- preguntas abiertas.

Prompt:

```text
Audita el modelo usando únicamente estos artefactos y la Specification.

Clasifica cada hallazgo como:
1. error de modelado lógico;
2. error físico;
3. prueba insuficiente;
4. decisión técnica justificable;
5. pregunta de negocio pendiente.

No corrijas automáticamente preguntas que requieren validación de Riesgos o Cumplimiento.
Propón cambios solo para hallazgos sustentados.
```

---

# Paso 10 — Evidencia y commit

Guardar:

```text
evidence/sesion_05/banca/
├── validation_output.txt
├── modelo_logico_final.mmd
├── modelo_fisico_final.mmd
├── hallazgos_validacion.md
└── decisiones_corregidas.md
```

Commit sugerido:

```bash
git add docs/prompts evidence/sesion_05/banca
git commit -m "lab s05 banca: validar modelo fisico de Credito Agil 360"
```

## Definition of Done

- modelo lógico trazable;
- 1FN–3FN revisadas;
- claves justificadas;
- idempotencia probada;
- evaluación histórica reproducible;
- auditoría presente;
- DDL ejecutable desde cero;
- pruebas positivas pasan;
- pruebas negativas son rechazadas;
- evidencia versionada;
- preguntas de negocio permanecen visibles.
