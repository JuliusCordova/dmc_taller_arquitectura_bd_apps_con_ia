# DMC Institute — Sesión 15

## Plan docente de 3 horas — Arquitectura segura de bases de datos

## Objetivos de aprendizaje

Al finalizar, el participante podrá:

1. reconocer las principales vulnerabilidades de una base de datos;
2. diferenciar vulnerabilidad, amenaza, riesgo y control;
3. explicar y mitigar SQL Injection y NoSQL Injection;
4. identificar rutas de exfiltración;
5. comprender privilege escalation y secrets exposure;
6. diseñar roles con mínimo privilegio en PostgreSQL;
7. diferenciar backup, backup inmutable y réplica;
8. documentar evidencia técnica de seguridad.

## Agenda

| Tiempo | Bloque | Resultado |
|---:|---|---|
| 0–15 | Apertura: de despliegue a superficie de ataque | mapa de trust boundaries |
| 15–35 | Threat mindset y defense in depth | amenazas priorizadas |
| 35–70 | SQL Injection y NoSQL Injection | patrón ataque → mitigación |
| 70–90 | Exfiltración, privilege escalation y secrets | matriz de riesgos |
| 90–100 | Pausa | — |
| 100–125 | Taller 1: SQL Injection en laboratorio | before/after |
| 125–145 | Taller 2: roles y permisos PostgreSQL | least privilege validado |
| 145–160 | Taller 3: backups protegidos/inmutables | estrategia documentada |
| 160–175 | Taller 4: replicación básica | primary/replica comprendido |
| 175–180 | Cierre + actualización del Spec | evidencia versionada |

## Bloque 1 — Threat mindset

Trabajar el patrón:

```text
Cliente → API → Backend → Credencial/Identidad → PostgreSQL → Backup
```

Preguntas:

- ¿Dónde se rompe la confianza?
- ¿Qué credencial tiene mayor blast radius?
- ¿Qué datos pueden salir del sistema?
- ¿Qué capa detectaría un abuso?

Principios:

- least privilege;
- defense in depth;
- reduce blast radius;
- protect secrets;
- log security-relevant actions.

## Bloque 2 — SQL Injection

Mostrar una consulta vulnerable únicamente en ambiente controlado:

```python
query = "SELECT * FROM users WHERE email = '" + email + "'"
```

Analizar por qué mezclar código SQL con input no confiable cambia la intención de la consulta.

Mitigación principal:

```python
cursor.execute(
    "SELECT * FROM users WHERE email = %s",
    (email,)
)
```

Idea fuerza:

> SQL Injection se evita principalmente separando datos de instrucciones mediante queries parametrizadas.

## Bloque 3 — NoSQL Injection

Explicar el mismo principio en estructuras documentales: aceptar operadores o estructuras de consulta desde entrada no confiable puede alterar la semántica de la búsqueda.

No convertir la clase en una colección de payloads; el foco es comprender validación estructural, allowlists y separación entre datos y query operators.

## Bloque 4 — Exfiltración

Rutas típicas a discutir:

```text
Consulta masiva
→ exportación
→ logs
→ backup/snapshot
→ object storage
→ egress
```

Controles:

- permisos mínimos;
- cifrado;
- logging y auditoría;
- restricciones de exportación;
- clasificación de datos;
- controles de egress cuando aplique.

## Bloque 5 — Privilege escalation

Revisar:

- superuser usado por aplicaciones;
- herencia de roles excesiva;
- capacidad de crear roles;
- capacidad de cambiar permisos;
- ownership inadecuado.

## Bloque 6 — Secrets exposure

Antipatrón:

```text
DB_PASSWORD=... dentro del código o repositorio
```

Patrón recomendado:

```text
Aplicación → identidad de workload → Secrets Manager/Vault → credencial
```

## Taller 1 — SQL Injection: BREAK → REFINE → EVIDENCE

1. Ejecutar una versión vulnerable del laboratorio.
2. Reproducir la alteración de la consulta en un entorno preparado para clase.
3. Registrar impacto.
4. Reemplazar concatenación por query parametrizada.
5. Repetir la prueba.
6. Guardar evidencia before/after.

## Taller 2 — Usuarios y permisos PostgreSQL

Crear roles separados, por ejemplo:

- `app_readonly`;
- `app_writer`;
- administrador de base separado del runtime.

Validar que un rol readonly pueda hacer `SELECT` y no operaciones destructivas.

## Taller 3 — Backup protegido / inmutable

Explicar que `pg_dump` genera una copia, pero la inmutabilidad se obtiene mediante controles del destino de almacenamiento o servicio de backup.

Diseñar:

```text
PostgreSQL → backup → storage protegido → retention/lock → restore test
```

## Taller 4 — Replicación básica

Modelo:

```text
Primary → WAL/replication → Replica
```

Discusión obligatoria:

> Una réplica no sustituye un backup: un borrado válido puede propagarse a la réplica.

## Prompt ATLAS sugerido

```text
## ACTOR
Actúa como arquitecto de seguridad de bases de datos y especialista PostgreSQL.

## TAREA
Analiza la arquitectura y configuración de datos del proyecto e identifica vulnerabilidades y controles prioritarios.

## LÍMITES
No inventes controles existentes.
Diferencia hallazgo confirmado de riesgo potencial.
No asumas que réplica equivale a backup.

## AUTOVALIDACIÓN
Cada hallazgo debe incluir componente, amenaza, impacto, evidencia, mitigación y prioridad.

## SALIDA
1. Threat model.
2. Vulnerabilidades.
3. Controles.
4. Matriz de permisos.
5. Estrategia de backup.
6. Estrategia de replicación.
7. Preguntas abiertas.
```

## Entregables

```text
docs/security/
├── 01_threat_model.md
├── 02_injection_risks.md
├── 03_roles_permissions.md
├── 04_secrets_strategy.md
├── 05_backup_strategy.md
└── 06_replication_strategy.md

evidence/
├── sql_injection_before.md
├── sql_injection_after.md
├── permissions_test.md
└── backup_design_review.md
```

## Definition of Done

- [ ] vulnerabilidades principales documentadas;
- [ ] SQL Injection mitigado y probado;
- [ ] roles diferenciados;
- [ ] mínimo privilegio validado;
- [ ] secretos fuera del código;
- [ ] estrategia de backup definida;
- [ ] réplica diferenciada de backup;
- [ ] evidencias versionadas;
- [ ] Specification actualizada.