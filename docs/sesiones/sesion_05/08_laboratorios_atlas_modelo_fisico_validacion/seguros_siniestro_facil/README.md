# Laboratorio guiado — Seguros · Siniestro Fácil

## Fuente obligatoria

```text
casos_de_uso/02_seguros_siniestro_facil.md
```

El caso exige conservar una línea de tiempo auditable del siniestro, proteger el original de cada evidencia, registrar hash y metadatos, versionar presupuestos y poder reproducir por qué una alerta antifraude fue generada incluso cuando la regla o modelo cambie.

## Objetivo

Construir y validar un corte vertical del modelo de **Siniestro Fácil**:

```text
Asegurado / Póliza / Vehículo
        ↓
      Siniestro
      ↙      ↘
 Evidencia   Presupuesto
                ↓
              Taller
        ↓
    Alerta de fraude
```

El ejercicio debe demostrar integridad referencial, unicidad, evidencia inmutable identificable, versionado y auditoría.

---

# Paso 1 — Preparar rama y evidencia

```bash
git checkout -b lab/s05-seguros-modelo-fisico
mkdir -p evidence/sesion_05/seguros
```

Registra:

```text
SOURCE=casos_de_uso/02_seguros_siniestro_facil.md
CASE=Siniestro Facil
SESSION=05
```

---

# Paso 2 — Extraer hechos que deben sobrevivir al modelo

Incluye al menos:

| Hecho confirmado | Impacto de modelado |
|---|---|
| Cada evidencia se vincula al siniestro y debe conservar original, hash y metadatos | `claim_evidence` con hash y fuente |
| Un taller presenta presupuesto y puede haber observaciones/ampliaciones | presupuesto versionable |
| Una alerta antifraude necesita explicación y versión de regla/modelo | alerta reproducible |
| La reasignación y los cambios deben conservar historial | auditoría / eventos posteriores |
| Casos duplicados son un problema operativo | clave de negocio + idempotencia |

No conviertas una recomendación de IA en una decisión de fraude.

---

# Paso 3 — ATLAS Generate: modelo lógico

```text
# ATLAS — SINIESTRO FÁCIL · MODELO LÓGICO

## ACTOR
Actúa como Arquitecto de Datos de seguros, especialista en modelado relacional,
trazabilidad de expedientes y Spec-Driven Development.

## TAREA
Transforma el modelo conceptual de Siniestro Fácil en un modelo lógico para:
Póliza, Vehículo, Siniestro, Evidencia, Taller, Presupuesto y Alerta de fraude.

## LÍMITES
No inventes coberturas, deducibles, umbrales antifraude ni SLA.
Una alerta no equivale a fraude confirmado.
No reemplaces silenciosamente evidencia original por derivados.
Cuando una cardinalidad o política no esté confirmada, mantenla como pregunta.

## AUTOVALIDACIÓN
Verifica:
- identidad de póliza, vehículo y siniestro;
- FK justificadas;
- evidencia asociada al expediente;
- versión de presupuesto;
- versión de regla/modelo antifraude;
- dependencias funcionales;
- 1FN, 2FN y 3FN;
- auditabilidad y reproducibilidad;
- ausencia de duplicidad no justificada.

## SALIDA
1. modelo lógico;
2. atributos y fuentes;
3. PK/FK;
4. dependencias;
5. normalización;
6. preguntas abiertas;
7. DER Mermaid;
8. trazabilidad.
```

Guardar como:

```text
docs/prompts/prompt_atlas_s05_seguros_modelado_logico_v1.md
```

---

# Paso 4 — Gate lógico

Antes del físico, el equipo debe responder:

- ¿qué identifica de manera única una póliza?;
- ¿cómo se identifica un siniestro frente a un reintento de reporte?;
- ¿el vehículo pertenece a la póliza, al siniestro o a ambos contextos?;
- ¿cómo se conserva la versión original de una evidencia?;
- ¿qué hace diferente una nueva versión de presupuesto?;
- ¿qué elementos necesita una alerta para poder reproducirse meses después?;

No cierres preguntas con conocimiento general del sector si la fuente no las confirma.

---

# Paso 5 — ATLAS Refine: físico profesional

```text
# ATLAS — SINIESTRO FÁCIL · BLUEPRINT FÍSICO

## ACTOR
Actúa como Arquitecto PostgreSQL para sistemas de seguros auditables.

## TAREA
Convierte el modelo lógico aprobado en un blueprint físico ejecutable.

## LÍMITES
No automatices rechazo o fraude por una alerta.
No uses PII real en seeds.
No elimines hashes, versiones o timestamps que soportan reproducibilidad.

## AUTOVALIDACIÓN
Comprueba:
- UUID técnico + claves de negocio donde corresponda;
- FK;
- UNIQUE para identificadores, versiones e idempotencia;
- CHECK para dominios simples;
- NUMERIC para importes;
- CHAR(3) para moneda del ejercicio;
- TIMESTAMPTZ para eventos;
- sha256 del original;
- versión de presupuesto;
- versión de regla/modelo de alerta;
- created/updated/row_version.

## SALIDA
DDL + justificación de cada control + lista de pruebas positivas y negativas.
```

---

# Paso 6 — Revisar `01_schema.sql`

El esquema de referencia cubre:

- `party`;
- `vehicle`;
- `policy`;
- `claim`;
- `claim_evidence`;
- `workshop`;
- `repair_estimate`;
- `fraud_alert`;
- auditoría estándar.

El alumno debe poder explicar por qué cada FK y UNIQUE existe.

---

# Paso 7 — Ejecutar

```bash
export DATABASE_URL='postgresql://usuario:password@localhost:5432/dmc'

bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh seguros \
  | tee evidence/sesion_05/seguros/validation_output.txt
```

---

# Paso 8 — Validaciones obligatorias

## Positivas

- póliza con asegurado y vehículo válidos;
- siniestro ligado a póliza;
- evidencia con hash y original;
- presupuesto versionado;
- alerta con explicación y versión de regla/modelo;
- columnas de auditoría pobladas.

## Negativas

- siniestro con póliza inexistente;
- `idempotency_key` repetido;
- misma evidencia repetida para un siniestro;
- presupuesto con monto no positivo;
- severidad de alerta fuera del dominio.

---

# Paso 9 — ATLAS Critique con resultados

```text
Recibe el DDL, el script de pruebas y la salida de ejecución.

Determina si cada PASS demuestra realmente la regla pretendida.
Señala controles ausentes, pruebas débiles o decisiones no trazables.
Separa hallazgos técnicos de preguntas que requieren a Operaciones o Fraude.
No conviertas una alerta en fraude confirmado.
```

---

# Paso 10 — Evidencia y commit

```text
evidence/sesion_05/seguros/
├── validation_output.txt
├── modelo_logico_final.mmd
├── modelo_fisico_final.mmd
├── hallazgos_validacion.md
└── decisiones_corregidas.md
```

```bash
git add docs/prompts evidence/sesion_05/seguros
git commit -m "lab s05 seguros: validar modelo fisico de Siniestro Facil"
```

## Definition of Done

- modelo trazable;
- 1FN–3FN revisadas;
- evidencia original identificable;
- presupuesto versionable;
- alerta reproducible;
- auditoría presente;
- DDL recreable;
- pruebas positivas pasan;
- estados inválidos son rechazados;
- evidencia de ejecución versionada.
