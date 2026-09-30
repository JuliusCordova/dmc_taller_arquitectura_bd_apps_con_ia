# DMC Institute — Sesión 18

## Plan docente de 3 horas — Resiliencia, continuidad operativa y preparación de producción

## Objetivos de aprendizaje

Al finalizar, el participante podrá:

1. diferenciar disponibilidad, resiliencia, backup, réplica y recuperación;
2. definir RPO y RTO a partir del impacto de negocio;
3. diseñar una estrategia de backup y restore verificable;
4. ejecutar una prueba de restauración controlada;
5. explicar el rol de réplicas y failover;
6. identificar single points of failure;
7. diseñar escenarios de falla y recuperación;
8. elaborar un runbook básico;
9. construir un checklist de production readiness;
10. presentar evidencia de recuperación, no solo configuración.

## Agenda

| Tiempo | Bloque | Resultado |
|---:|---|---|
| 0–15 | Puente con Sesión 17 | de prevención a recuperación |
| 15–35 | Resiliencia y disponibilidad | conceptos diferenciados |
| 35–55 | RPO, RTO y criticidad | objetivos de recuperación |
| 55–75 | Backups y restore | estrategia definida |
| 75–90 | Replicación y failover | patrón de continuidad |
| 90–100 | Pausa | — |
| 100–125 | Taller 1: restore controlado | evidencia de restauración |
| 125–145 | Taller 2: failure scenarios | matriz falla → respuesta |
| 145–160 | Taller 3: runbook | procedimiento operativo |
| 160–175 | Production readiness challenge | gate de producción |
| 175–180 | Cierre + Spec | incremento versionado |

## Disponibilidad vs resiliencia

### Disponibilidad

Capacidad del servicio para estar accesible cuando se necesita.

### Resiliencia

Capacidad de absorber, aislar o recuperarse de una falla manteniendo un nivel aceptable de servicio.

### Recuperación

Capacidad de restaurar datos y servicio después de un incidente.

Idea fuerza:

> Alta disponibilidad reduce interrupciones. Backup y recuperación reducen la pérdida y permiten reconstruir. No son equivalentes.

## RPO y RTO

### RPO — Recovery Point Objective

Pregunta de negocio:

> ¿Cuánta información podemos perder como máximo?

Ejemplos conceptuales:

- RPO 24 h: el negocio tolera perder hasta un día de cambios;
- RPO 15 min: se requiere una estrategia de respaldo/replicación más frecuente;
- RPO cercano a cero: aumenta considerablemente la complejidad y costo.

### RTO — Recovery Time Objective

Pregunta:

> ¿Cuánto tiempo puede estar interrumpido el servicio?

No inventar valores. Los equipos deben relacionar RPO/RTO con RNF y preguntas de negocio de la Specification.

## Estrategia de backup

Diseñar por capas:

```text
PostgreSQL
   ↓
backup lógico/físico
   ↓
almacenamiento protegido
   ↓
retención/versionado/inmutabilidad
   ↓
prueba de restore
   ↓
evidencia
```

Preguntas obligatorias:

- ¿qué se respalda?;
- ¿con qué frecuencia?;
- ¿dónde se almacena?;
- ¿quién puede borrar?;
- ¿cuánto se retiene?;
- ¿cómo se valida?;
- ¿quién ejecuta el restore?;
- ¿cómo sabemos que el backup es utilizable?

## Replicación y failover

Modelo conceptual:

```text
Primary
   │
   ├── cambios / WAL ──> Replica
   │
   └── backup ────────> Backup Store
```

Recordar:

> réplica ≠ backup.

La réplica ayuda a disponibilidad y lectura; un backup permite recuperar estados históricos o reconstruir después de ciertos incidentes.

## Failure scenarios

Trabajar al menos estos escenarios:

1. caída del proceso PostgreSQL;
2. pérdida de conectividad;
3. credencial revocada o secret inválido;
4. borrado accidental de registros;
5. corrupción lógica por operación válida pero incorrecta;
6. saturación de conexiones;
7. réplica no disponible;
8. backup no restaurable;
9. dependencia externa lenta o caída;
10. error de despliegue o migración.

Para cada escenario:

- señal de detección;
- impacto;
- control preventivo;
- control detectivo;
- acción de recuperación;
- evidencia esperada.

## Taller 1 — Restore controlado

Objetivo: demostrar que existe recuperación real.

Flujo recomendado:

1. crear dataset sintético de laboratorio;
2. ejecutar backup;
3. registrar timestamp y metadatos;
4. simular pérdida o corrupción controlada;
5. restaurar en instancia/base separada o ambiente de laboratorio;
6. ejecutar consultas de validación;
7. comparar conteos o checks de integridad;
8. documentar duración y resultado;
9. guardar evidencia.

Nunca realizar pruebas destructivas sobre ambientes no autorizados.

## Taller 2 — Failure Game

Cada equipo recibe o selecciona 3 escenarios.

Ejemplo:

```text
Escenario:
La aplicación comienza a responder 500 porque agotó el pool de conexiones.

Detectar:
¿Qué métrica/log lo muestra?

Contener:
¿Qué acción reduce el impacto?

Recuperar:
¿Qué se reinicia o escala?

Prevenir:
¿Qué configuración o RNF debe cambiar?
```

El equipo debe actualizar la matriz de resiliencia.

## Taller 3 — Runbook

Cada equipo crea un runbook corto para un incidente crítico.

Plantilla:

```text
Incidente:
Señales:
Impacto:
Prerequisitos:
Paso 1 — verificar:
Paso 2 — contener:
Paso 3 — recuperar:
Paso 4 — validar:
Paso 5 — comunicar:
Rollback / contingencia:
Evidencia requerida:
Escalamiento:
```

## Production Readiness Gate

Checklist mínimo:

### Datos
- [ ] migraciones versionadas;
- [ ] integridad validada;
- [ ] backup configurado;
- [ ] restore probado;
- [ ] replicación entendida y, si aplica, validada.

### Seguridad
- [ ] mínimo privilegio;
- [ ] TLS;
- [ ] secretos fuera del código;
- [ ] auditoría/logging;
- [ ] hallazgos críticos resueltos o aceptados explícitamente.

### Operación
- [ ] health checks;
- [ ] logs y métricas;
- [ ] alertas críticas;
- [ ] RPO/RTO documentados o pendientes con owner;
- [ ] runbook disponible.

### SDD
- [ ] Specification actualizada;
- [ ] RNF trazados a controles;
- [ ] ADR relevantes actualizados;
- [ ] evidencias versionadas;
- [ ] preguntas abiertas visibles.

## Prompt ATLAS sugerido

```text
## ACTOR
Actúa como Site Reliability Engineer, Database Reliability Engineer y arquitecto de datos.

## TAREA
Evalúa la resiliencia y preparación de producción de la solución y diseña pruebas de recuperación controladas.

## LÍMITES
No inventes RPO/RTO.
No consideres un backup válido solo porque existe un archivo.
No confundas réplica con backup.
No propongas pruebas destructivas fuera del laboratorio autorizado.

## AUTOVALIDACIÓN
Cada escenario debe incluir señal, impacto, control preventivo, detección, recuperación y evidencia.
Comprueba que cada recomendación pueda trazarse a un RNF, riesgo o requisito operativo.

## SALIDA
1. Matriz de escenarios de falla.
2. RPO/RTO y preguntas pendientes.
3. Estrategia de backup/restore.
4. Estrategia de replicación/failover.
5. Runbook.
6. Production Readiness Checklist.
7. Evidencias requeridas.
```

## Entregables

```text
docs/resilience/
├── 01_failure_scenarios.md
├── 02_rpo_rto.md
├── 03_backup_restore_strategy.md
├── 04_replication_failover.md
├── 05_runbook.md
└── 06_production_readiness.md

evidence/
├── backup_metadata.md
├── restore_test.md
├── integrity_after_restore.md
└── failure_game_results.md
```

## Definition of Done

- [ ] escenarios de falla priorizados;
- [ ] RPO/RTO definidos o registrados como preguntas abiertas;
- [ ] backup documentado;
- [ ] restore ejecutado y validado;
- [ ] réplica diferenciada de backup;
- [ ] runbook creado;
- [ ] production readiness checklist completado;
- [ ] evidencias versionadas;
- [ ] Specification actualizada.