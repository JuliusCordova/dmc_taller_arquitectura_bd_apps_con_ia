# Taller guiado — Siniestro Fácil: del backend generado a una arquitectura defendible

## Objetivo

Auditar el backend iniciado en la Sesión 06, extraer architecture drivers desde la Specification y producir una arquitectura lógica + GCP v1 con decisiones explícitas y backlog de refactor.

## Duración sugerida

60–75 minutos distribuidos entre demostración guiada y trabajo de equipos.

---

## Parte 1 — Seleccionar vertical slice

Usar como slice principal:

> **HU-SEG-01 — Registrar un siniestro**

Complementar, cuando haga falta, con:

- adjuntar evidencia;
- consultar seguimiento;
- registrar trazabilidad/auditoría.

No se crean historias nuevas durante el taller.

---

## Parte 2 — Extraer drivers

Completar usando Specification y artefactos versionados:

| Fuente | Driver | Riesgo | Evidencia en backend actual | Estado |
|---|---|---|---|---|
| HU/RF | idempotencia | duplicidad |  |  |
| RNF | latencia | incumplir respuesta |  |  |
| RNF | escalabilidad | saturación |  |  |
| RNF | seguridad | exposición |  |  |
| RNF | observabilidad | error invisible |  |  |
| RNF | evidencia | pérdida de cadena de custodia |  |  |
| RNF | resiliencia | fallo cascada |  |  |

Estados permitidos:

- `COVERED`;
- `PARTIAL`;
- `NOT_COVERED`;
- `UNKNOWN`.

`UNKNOWN` obliga a pregunta o tarea de investigación.

---

## Parte 3 — Auditar arquitectura interna

Revisar el código existente y marcar cada hallazgo.

### Checklist

- [ ] controller solo maneja contrato HTTP;
- [ ] caso de uso contiene orquestación;
- [ ] dominio no importa framework/ORM/GCP;
- [ ] repositorio está abstraído;
- [ ] acceso a BD no aparece en API;
- [ ] integración externa está detrás de adapter;
- [ ] transacción tiene límite comprensible;
- [ ] errores de dominio no dependen de HTTP;
- [ ] configuración está externalizada;
- [ ] es posible probar dominio/caso de uso sin GCP.

### Clasificación de hallazgos

- `CRITICAL` — puede romper seguridad, integridad o impedir despliegue.
- `HIGH` — deuda estructural que debe corregirse antes de escalar construcción.
- `MEDIUM` — afecta mantenibilidad/testabilidad.
- `LOW` — mejora no bloqueante.

---

## Parte 4 — Proponer estructura objetivo

Ejemplo de referencia, adaptar al framework seleccionado:

```text
backend/
├── api/
│   ├── controllers/
│   ├── dto/
│   └── error_handlers/
├── application/
│   ├── use_cases/
│   └── ports/
├── domain/
│   ├── entities/
│   ├── value_objects/
│   ├── rules/
│   └── errors/
├── infrastructure/
│   ├── persistence/
│   ├── storage/
│   ├── external/
│   └── observability/
└── tests/
```

### Regla

La estructura no se acepta por estética. Cada módulo debe explicar qué dependencia evita o qué responsabilidad separa.

---

## Parte 5 — Mapear a GCP

Completar la matriz:

| Driver / necesidad | Componente candidato | Responsabilidad | Riesgo nuevo | Decisión |
|---|---|---|---|---|
| API HTTP | Cloud Run | ejecutar backend | concurrencia / conexiones |  |
| OLTP | Cloud SQL PostgreSQL | persistencia transaccional | conexiones / HA |  |
| archivos | Cloud Storage | evidencia binaria | consistencia metadata-objeto |  |
| secretos | Secret Manager | secretos externos | permisos |  |
| identidad | IAM / Service Account | acceso workload-to-service | exceso de privilegios |  |
| diagnóstico | Logging / Monitoring | observabilidad | costo/PII en logs |  |

### Pregunta obligatoria

> ¿Qué componente NO necesitamos todavía?

Ejemplos que no deben agregarse sin driver:

- GKE;
- Redis;
- API Gateway;
- Pub/Sub;
- microservicios múltiples;
- service mesh.

---

## Parte 6 — Architecture Challenge: 20× tráfico

Escenario:

> Un evento catastrófico provoca un pico de 20 veces el volumen promedio de registros de siniestro.

Responder:

1. ¿qué componente escala automáticamente?
2. ¿cuál no escala al mismo ritmo?
3. ¿qué ocurre con las conexiones PostgreSQL?
4. ¿qué variable/configuración limitaría el daño?
5. ¿qué métrica observaríamos?
6. ¿qué comportamiento debe seguir siendo idempotente?
7. ¿qué trabajo podría diferirse o desacoplarse en el futuro?

### Objetivo docente

Mostrar que:

```text
App autoscaling ≠ database autoscaling infinito
```

---

## Parte 7 — Architecture Challenge: evidencia digital

Escenario:

> El usuario registra el siniestro correctamente, pero la carga de una fotografía falla en el último segundo.

Responder:

- ¿la creación del siniestro debe fallar?
- ¿qué estado queda visible?
- ¿cómo evitamos un archivo huérfano?
- ¿qué metadata conserva PostgreSQL?
- ¿cómo reintentamos sin duplicar?
- ¿cómo queda trazabilidad?

No se exige resolver toda la arquitectura event-driven en esta sesión. Las preguntas no resueltas alimentan backlog y futuras sesiones.

---

## Parte 8 — Ejecutar ATLAS Architecture Review

Utilizar `03_prompts_atlas_architecture_review.md`.

Secuencia mínima:

1. Prompt 1 — drivers.
2. Prompt 2 — arquitectura interna.
3. Prompt 3 — GCP.
4. Prompt 4 — review del código.
5. Prompt 5 — break.
6. Prompt 6 — backlog de refactor.

### Validación humana

El equipo debe rechazar al menos una recomendación de IA que:

- no tenga driver;
- agregue complejidad sin beneficio;
- contradiga Specification;
- introduzca tecnología no necesaria.

Documentar por qué se rechazó.

---

## Parte 9 — Crear ADR

Crear al menos:

```text
ADR-001-cloud-run-runtime.md
ADR-002-modular-monolith.md
ADR-003-evidence-storage.md
```

Cada ADR contiene:

- contexto;
- driver;
- decisión;
- alternativas;
- consecuencias positivas;
- consecuencias negativas;
- riesgos;
- estado.

---

## Parte 10 — Backlog de refactor

Convertir hallazgos `CRITICAL` y `HIGH` en tareas ejecutables.

| Orden | Hallazgo | Cambio | Prueba | Evidencia | Bloquea desarrollo |
|---|---|---|---|---|---|
| 1 |  |  |  |  |  |

### Regla

Una tarea como `mejorar arquitectura` no es válida.

Debe poder probarse y cerrarse.

---

## Entregables

```text
docs/arquitectura/
├── architecture_drivers.md
├── architecture_guidelines.md
├── software_architecture_v1.md
├── gcp_architecture_v1.md
└── adr/
    ├── ADR-001-cloud-run-runtime.md
    ├── ADR-002-modular-monolith.md
    └── ADR-003-evidence-storage.md

docs/prompts/
└── atlas_architecture_review.md

docs/sdd/
└── backlog_refactor_arquitectura.md

evidence/session_07/
└── architecture_review.md
```

## Definition of Done del taller

- [ ] drivers extraídos con fuente;
- [ ] backend actual auditado;
- [ ] arquitectura interna dibujada;
- [ ] arquitectura GCP dibujada;
- [ ] cada componente GCP tiene justificación;
- [ ] mínimo un componente innecesario fue descartado conscientemente;
- [ ] se ejecutó un challenge de escala;
- [ ] se ejecutó un challenge de fallo de evidencia;
- [ ] mínimo tres ADR creados;
- [ ] hallazgos críticos/altos convertidos en backlog;
- [ ] una recomendación de IA fue evaluada y rechazada con fundamento cuando correspondió;
- [ ] evidencia versionada.
