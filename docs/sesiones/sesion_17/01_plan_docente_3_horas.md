# DMC Institute — Sesión 17

## Plan docente de 3 horas — Hardening avanzado, auditoría y validación de seguridad

## Objetivos de aprendizaje

Al finalizar, el participante podrá:

1. construir un security baseline;
2. verificar exposición de red y listeners;
3. revisar permisos efectivos e inheritance de roles;
4. identificar caminos de privilege escalation;
5. validar TLS con evidencia de sesión;
6. auditar secrets expuestos en código o configuración;
7. revisar extensiones instaladas;
8. validar logging y auditoría;
9. ejecutar pruebas negativas controladas;
10. construir un hardening score didáctico before/after.

## Agenda

| Tiempo | Bloque | Resultado |
|---:|---|---|
| 0–15 | Puente con Sesión 16 | baseline y alcance |
| 15–35 | Security baseline | estado inicial documentado |
| 35–55 | Red, listeners y acceso | exposición validada |
| 55–75 | Roles, inheritance y escalation | permisos efectivos auditados |
| 75–90 | TLS y secrets | controles verificados |
| 90–100 | Pausa | — |
| 100–125 | Auditoría, logs y extensiones | evidencia técnica |
| 125–145 | Simulación de actividad sospechosa | detección validada |
| 145–165 | Hardening score before/after | brechas priorizadas |
| 165–175 | Actualización SDD/Spec | decisiones versionadas |
| 175–180 | Cierre | gate de seguridad |

## Security baseline

Evaluar al menos:

```text
Network
Authentication
Authorization
TLS
Secrets
Extensions
Logs
Audit
Backups
Replication
```

Para cada dimensión documentar:

- estado observado;
- evidencia;
- riesgo;
- prioridad;
- acción pendiente.

## Validación de red

Comandos de referencia:

```bash
ss -lntp
```

PostgreSQL:

```sql
SHOW listen_addresses;
SHOW port;
```

Revisar `pg_hba.conf` y comprobar desde qué origenes puede conectarse un cliente de laboratorio.

## Permisos efectivos

Inventariar roles y membresías.

Revisar privilegios de tabla:

```sql
SELECT grantee, table_name, privilege_type
FROM information_schema.role_table_grants
ORDER BY grantee, table_name;
```

Pregunta central:

> ¿Qué permiso tiene un usuario de forma indirecta que no aparece a primera vista?

## Privilege escalation

Auditar:

- membership de roles;
- `INHERIT`;
- ownership;
- privilegios administrativos;
- capacidad para crear roles u objetos privilegiados.

No ejecutar escalamiento destructivo; el taller se enfoca en detección y corrección dentro del entorno controlado.

## Validación TLS

No aceptar `ssl = on` como evidencia suficiente.

Comprobar la sesión:

```sql
SELECT pid, ssl, version, cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();
```

Validar que el cliente usa el comportamiento esperado para conexiones cifradas.

## Auditoría de secretos

Buscar patrones potenciales en el repositorio del laboratorio:

```bash
git grep -i "password"
git grep -i "secret"
git grep -i "token"
```

Todo hallazgo debe revisarse antes de clasificarse como secreto real. No copiar secretos a evidencias ni logs.

## Auditoría de extensiones

```sql
SELECT extname, extversion
FROM pg_extension;
```

Clasificar:

- necesaria y aprobada;
- necesaria pendiente de revisión;
- innecesaria;
- desconocida.

## Logging y auditoría

Responder con evidencia:

- quién;
- cuándo;
- desde dónde;
- qué sesión;
- qué resultado;
- qué acción de seguridad fue observable.

Revisar configuración de logging y considerar `pgAudit` como opción avanzada cuando el caso lo justifique.

## Simulación de actividad sospechosa

En el entorno de laboratorio:

1. intentos de conexión fallidos;
2. consulta de volumen inusual controlado;
3. uso de un usuario sin permiso;
4. intento de operación bloqueada por least privilege.

El objetivo es observar qué queda registrado y qué no.

## Hardening Score didáctico

Escala por control:

- 0 = inexistente;
- 1 = parcial;
- 2 = implementado y probado.

Dimensiones sugeridas:

```text
Network          /2
Authentication   /2
Authorization    /2
TLS              /2
Secrets          /2
Logs             /2
Audit            /2
Extensions       /2
Backups          /2
Replication      /2
TOTAL            /20
```

El score es una herramienta académica de DMC Institute, no un estándar de certificación.

## Matriz CIA

Mapear controles a Confidentiality, Integrity y Availability para demostrar cobertura y detectar concentraciones o vacíos.

## Prompt ATLAS sugerido

```text
## ACTOR
Actúa como Database Security Engineer y auditor PostgreSQL.

## TAREA
Audita la instancia PostgreSQL del laboratorio y valida si los controles de hardening funcionan.

## LÍMITES
No asumas controles sin evidencia.
No copies secretos a la salida.
No marques un hallazgo como corregido si no existe una prueba.
No propongas cambios destructivos sin documentar impacto.

## AUTOVALIDACIÓN
Cada hallazgo debe incluir riesgo, evidencia, cambio, prueba y resultado esperado.
Evalúa CIA y diferencia configuración observada de inferencia.

## SALIDA
1. Security baseline.
2. Hallazgos.
3. Hardening score.
4. Matriz CIA.
5. Before/After.
6. Evidencias.
7. Preguntas abiertas.
```

## Entregables

```text
docs/security/
├── 13_security_baseline.md
├── 14_network_validation.md
├── 15_roles_audit.md
├── 16_tls_validation.md
├── 17_secrets_audit.md
├── 18_extensions_audit.md
├── 19_logging_audit.md
└── 20_hardening_score.md

evidence/
├── network_test.md
├── permission_test.md
├── tls_test.md
├── secret_scan_summary.md
└── audit_logs_summary.md
```

## Definition of Done

- [ ] baseline documentado;
- [ ] exposición de red probada;
- [ ] permisos efectivos auditados;
- [ ] privilege escalation evaluado;
- [ ] TLS validado con evidencia;
- [ ] secrets revisados sin exponerlos;
- [ ] extensiones auditadas;
- [ ] logs/auditoría probados;
- [ ] hardening score before/after;
- [ ] Specification actualizada.