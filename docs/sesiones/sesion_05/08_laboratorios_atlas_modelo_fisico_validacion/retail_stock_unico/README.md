# Laboratorio guiado — Retail · Stock Único

## Fuente obligatoria

```text
casos_de_uso/03_retail_stock_unico.md
```

El caso exige distinguir stock físico, reservado, bloqueado y disponible; controlar reservas temporales; impedir duplicidad por reintentos; conservar cada movimiento con evento de origen; y mantener trazabilidad de cambios en inventario.

## Objetivo

Construir y validar un corte vertical de **Stock Único**:

```text
SKU + Ubicación
      ↓
Saldo de inventario
      ↓
Reserva temporal
      ↓
Movimiento de inventario
```

El ejercicio debe demostrar consistencia del modelo, idempotencia, dominios válidos, cantidades no negativas y auditoría.

---

# Paso 1 — Preparar rama y evidencia

```bash
git checkout -b lab/s05-retail-modelo-fisico
mkdir -p evidence/sesion_05/retail
```

Registra:

```text
SOURCE=casos_de_uso/03_retail_stock_unico.md
CASE=Stock Unico
SESSION=05
```

---

# Paso 2 — Extraer reglas relevantes

Incluye al menos:

| Hecho confirmado | Impacto de modelado |
|---|---|
| El inventario se administra por SKU y ubicación | clave única compuesta lógica |
| Una reserva tiene cantidad, origen, expiración y estado | entidad transaccional |
| Un reintento de checkout no debe crear otra reserva | `idempotency_key` único |
| Cada cambio debe conservar evento, cantidad anterior/nueva y razón | movimiento auditable |
| Stock físico, reservado, bloqueado y de seguridad no significan lo mismo | atributos separados |

No modeles “stock disponible” como un número independiente sin explicar su derivación o autoridad.

---

# Paso 3 — ATLAS Generate: modelo lógico

```text
# ATLAS — STOCK ÚNICO · MODELO LÓGICO

## ACTOR
Actúa como Arquitecto de Datos para retail omnicanal,
especialista en inventarios, concurrencia, normalización y SDD.

## TAREA
Transforma el modelo conceptual de Stock Único en un modelo lógico para:
SKU, Ubicación, Saldo de inventario, Reserva y Movimiento.

## LÍMITES
No inventes la fórmula definitiva de disponibilidad cuando la fuente declara que varía.
No inventes duración de reservas ni reglas de fulfillment.
No conviertas predicción de IA en existencia disponible.
No confundas evento de inventario con saldo actual.

## AUTOVALIDACIÓN
Verifica:
- identidad de SKU y ubicación;
- unicidad SKU + ubicación para saldo;
- reserva como hecho transaccional;
- idempotencia;
- movimiento como evento auditable;
- dependencias funcionales;
- 1FN, 2FN y 3FN;
- cantidades con semántica separada;
- preguntas abiertas visibles.

## SALIDA
1. modelo lógico;
2. PK/FK;
3. dependencias;
4. normalización;
5. reglas candidatas;
6. preguntas abiertas;
7. DER Mermaid;
8. trazabilidad.
```

Guardar como:

```text
docs/prompts/prompt_atlas_s05_retail_modelado_logico_v1.md
```

---

# Paso 4 — Gate lógico

Responder antes del físico:

- ¿qué identifica un SKU?;
- ¿qué identifica una ubicación?;
- ¿el saldo debe tener PK técnica o clave compuesta?;
- ¿qué cantidades forman el estado actual y cuáles son eventos?;
- ¿qué hace única una reserva ante reintentos?;
- ¿qué diferencia una reserva vencida de una liberada?;
- ¿cómo reconstruir el orden y origen de movimientos?;
- ¿qué decisiones sobre disponibilidad continúan abiertas?.

---

# Paso 5 — ATLAS Refine: físico profesional

```text
# ATLAS — STOCK ÚNICO · BLUEPRINT FÍSICO

## ACTOR
Actúa como Arquitecto PostgreSQL para inventario omnicanal de alta concurrencia.

## TAREA
Transforma solo el modelo lógico aprobado en DDL físico verificable.

## LÍMITES
No inventes una política final de disponibilidad.
No uses una recomendación de IA para aumentar existencias.
No ocultes reintentos: utiliza idempotencia.

## AUTOVALIDACIÓN
Comprueba:
- PK y FK;
- UNIQUE de SKU, ubicación, SKU+ubicación, event_id e idempotency_key;
- CHECK de cantidades no negativas;
- reserva con cantidad positiva y estado controlado;
- expiración posterior a creación;
- movimiento con delta distinto de cero;
- timestamps con zona horaria;
- created/updated/row_version;
- índices derivados del patrón de acceso del ejercicio.

## SALIDA
DDL + justificación + catálogo de pruebas positivas/negativas.
```

---

# Paso 6 — Revisar `01_schema.sql`

El esquema cubre:

- `sku`;
- `location`;
- `inventory_balance`;
- `inventory_reservation`;
- `inventory_movement`;
- disponibilidad derivada de cantidades explícitas;
- auditoría estándar.

La disponibilidad calculada del ejercicio es una simplificación técnica para practicar. **No sustituye la fórmula de negocio pendiente** indicada en el caso.

---

# Paso 7 — Ejecutar

```bash
export DATABASE_URL='postgresql://usuario:password@localhost:5432/dmc'

bash docs/sesiones/sesion_05/08_laboratorios_atlas_modelo_fisico_validacion/run_case.sh retail \
  | tee evidence/sesion_05/retail/validation_output.txt
```

---

# Paso 8 — Validaciones obligatorias

## Positivas

- saldo único por SKU y ubicación;
- cálculo derivado de disponibilidad del ejercicio;
- reserva válida con expiración;
- movimiento de inventario con evento único;
- auditoría poblada.

## Negativas

- cantidades negativas en saldo;
- reserva con cantidad 0;
- `idempotency_key` repetido;
- movimiento con `event_id` repetido;
- movimiento con `quantity_delta = 0`;
- FK hacia SKU/ubicación inexistente.

---

# Paso 9 — ATLAS Critique con evidencia

```text
Audita el DDL, las pruebas y la salida real.

Distingue:
- error lógico;
- error físico;
- control insuficiente;
- prueba insuficiente;
- decisión temporal del ejercicio;
- pregunta de Supply Chain todavía abierta.

No presentes la fórmula simplificada de disponibilidad como política aprobada del negocio.
```

---

# Paso 10 — Evidencia y commit

```text
evidence/sesion_05/retail/
├── validation_output.txt
├── modelo_logico_final.mmd
├── modelo_fisico_final.mmd
├── hallazgos_validacion.md
└── decisiones_corregidas.md
```

```bash
git add docs/prompts evidence/sesion_05/retail
git commit -m "lab s05 retail: validar modelo fisico de Stock Unico"
```

## Definition of Done

- modelo trazable;
- 1FN–3FN revisadas;
- saldo único por SKU/ubicación;
- idempotencia probada;
- movimientos auditables;
- cantidades protegidas;
- DDL recreable;
- pruebas positivas pasan;
- estados inválidos son rechazados;
- fórmula de disponibilidad pendiente sigue declarada como decisión de negocio cuando corresponda;
- evidencia versionada.
