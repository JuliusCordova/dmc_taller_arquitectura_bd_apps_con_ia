# Sesión 05 — Laboratorios ATLAS: del modelo lógico a validación ejecutable

## Propósito

Este bloque práctico extiende la Sesión 05 hasta un **blueprint físico profesional y verificable**. El alumno no termina cuando dibuja el modelo: debe demostrar mediante scripts que PK, FK, unicidad, checks, reglas de auditoría e idempotencia se comportan como se espera.

Los tres casos oficiales del curso son:

| Equipo | Industria | Caso | Fuente |
|---|---|---|---|
| 1 | Banca | Crédito Ágil 360 | `casos_de_uso/01_banca_credito_agil_360.md` |
| 2 | Seguros | Siniestro Fácil | `casos_de_uso/02_seguros_siniestro_facil.md` |
| 3 | Retail | Stock Único | `casos_de_uso/03_retail_stock_unico.md` |

## Flujo obligatorio

```text
Specification del caso
        ↓
Prompt ATLAS — Generate
        ↓
Modelo lógico
        ↓
Dependencias + 1FN + 2FN + 3FN
        ↓
Gate lógico
        ↓
Prompt ATLAS — Critique / Refine
        ↓
Blueprint físico PostgreSQL
        ↓
PK + FK + UNIQUE + CHECK + auditoría
        ↓
01_schema.sql
        ↓
02_validate.sql
        ↓
run_case.sh
        ↓
PASS / FAIL + evidencia
        ↓
Corrección del modelo / Spec / prompt
        ↓
Commit y defensa
```

## Regla pedagógica

> Un modelo físico no está validado porque el DDL compile. Está validado cuando podemos demostrar que permite estados válidos y rechaza estados inválidos previstos por las reglas del negocio.

## Estándar mínimo de auditoría

Las tablas transaccionales principales deben justificar y, cuando corresponda, incorporar:

```text
created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
created_by   VARCHAR(...) NOT NULL
updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
updated_by   VARCHAR(...) NOT NULL
row_version  BIGINT NOT NULL DEFAULT 1
```

Según el dominio también pueden aparecer:

- `occurred_at` frente a `recorded_at`;
- `source_system`;
- `correlation_id`;
- `idempotency_key`;
- versión de regla/modelo;
- hash de evidencia;
- usuario y fecha de revisión;
- razón del cambio.

No se agregan columnas por costumbre: cada campo debe responder a trazabilidad, concurrencia, seguridad, reproducibilidad u operación.

## Archivos

```text
08_laboratorios_atlas_modelo_fisico_validacion/
├── README.md
├── run_case.sh
├── banca_credito_agil_360/
│   ├── README.md
│   ├── 01_schema.sql
│   └── 02_validate.sql
├── seguros_siniestro_facil/
│   ├── README.md
│   ├── 01_schema.sql
│   └── 02_validate.sql
└── retail_stock_unico/
    ├── README.md
    ├── 01_schema.sql
    └── 02_validate.sql
```

## Requisitos para ejecutar

- PostgreSQL 14+ recomendado;
- cliente `psql` disponible;
- variable `DATABASE_URL` con una base de práctica;
- permiso para crear schemas y la extensión `pgcrypto`.

Ejemplo:

```bash
export DATABASE_URL='postgresql://usuario:password@localhost:5432/dmc'

bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh banca
bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh seguros
bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh retail
```

## Evidencia mínima

Cada equipo debe versionar en su rama:

```text
evidence/sesion_05/<caso>/
├── validation_output.txt
├── modelo_logico_final.mmd
├── modelo_fisico_final.mmd
├── hallazgos_validacion.md
└── decisiones_corregidas.md
```

Captura sugerida:

```bash
bash .../run_case.sh banca | tee evidence/sesion_05/banca/validation_output.txt
```

## Gate de finalización

El laboratorio termina cuando:

- el modelo lógico es trazable a la Specification;
- las N:M están resueltas;
- 1FN, 2FN y 3FN fueron revisadas;
- PK/FK y claves de negocio están justificadas;
- las tablas críticas tienen auditoría coherente;
- el DDL se ejecuta desde cero;
- las pruebas positivas pasan;
- las pruebas negativas son rechazadas por el control correcto;
- idempotencia/unicidad del caso está probada cuando aplica;
- cada fallo genera una corrección o decisión explícita;
- la salida de ejecución queda guardada como evidencia;
- el prompt ATLAS y el modelo final quedan versionados.
