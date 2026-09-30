# DMC Institute — Sesión 16

## Plan docente de 3 horas — Hardening y protección de bases de datos

## Objetivos de aprendizaje

Al finalizar, el participante podrá:

1. aplicar el modelo CIA a bases de datos;
2. explicar hardening como reducción de superficie de ataque;
3. revisar puertos, listeners, `pg_hba.conf`, usuarios, logs y extensiones;
4. diferenciar cifrado at-rest e in-transit;
5. aplicar principios Zero Trust al acceso a datos;
6. habilitar y validar TLS en PostgreSQL;
7. sacar secretos del código y usar un secrets manager;
8. configurar logging y auditoría básica;
9. producir evidencia before/after.

## Agenda

| Tiempo | Bloque | Resultado |
|---:|---|---|
| 0–15 | Puente con Sesión 15 + CIA | mapa CIA |
| 15–35 | Hardening y superficie de ataque | checklist inicial |
| 35–55 | Puertos, listeners y pg_hba.conf | accesos restringidos |
| 55–75 | Usuarios, logs y extensiones | configuración revisada |
| 75–90 | Cifrado at-rest/in-transit + Zero Trust | controles definidos |
| 90–100 | Pausa | — |
| 100–125 | Taller 1: hardening PostgreSQL/Linux | before/after |
| 125–145 | Taller 2: TLS | conexión cifrada validada |
| 145–165 | Taller 3: Secrets Manager | secreto fuera del código |
| 165–175 | Taller 4: auditoría y logs | evidencia de actividad |
| 175–180 | Cierre + Spec | incremento versionado |

## Modelo CIA aplicado

### Confidentiality

Pregunta: ¿quién puede leer qué?

Controles: identidad, roles, cifrado, segmentación, secretos y masking cuando corresponda.

### Integrity

Pregunta: ¿cómo evitamos cambios no autorizados o incorrectos?

Controles: transacciones, constraints, roles, auditoría, separación de funciones.

### Availability

Pregunta: ¿cómo mantenemos el servicio recuperable y disponible?

Controles: backups, réplicas, HA, monitoreo y capacidad.

## Hardening

Secuencia:

```text
Instalación/configuración
→ inventario
→ reducir
→ restringir
→ cifrar
→ auditar
→ evidenciar
```

Regla: todo servicio, puerto, usuario, privilegio o extensión debe tener una razón de negocio o técnica documentada.

## Superficie de ataque PostgreSQL

```text
PostgreSQL
├── puerto 5432
├── listen_addresses
├── pg_hba.conf
├── usuarios/roles
├── ownership
├── extensiones
├── logs
├── conexiones TLS
├── secretos
└── backups
```

## Puertos y listeners

Revisar:

```bash
ss -lntp
```

Y en PostgreSQL:

```sql
SHOW listen_addresses;
SHOW port;
```

Evitar exposición global por comodidad. Restringir interfaces y redes según necesidad.

## pg_hba.conf

Explicar el patrón:

```text
quién → desde dónde → a qué base → con qué método
```

Ejemplo conceptual:

```text
hostssl pedidos_db app_user 10.0.0.0/24 scram-sha-256
```

## Usuarios y privilegios

Separar:

- administración;
- runtime de aplicación;
- reporting readonly;
- operaciones de backup.

La aplicación no debe usar el usuario administrador.

## Extensiones

Inventariar:

```sql
SELECT extname, extversion
FROM pg_extension;
```

Clasificar: necesaria, conocida, aprobada, pendiente o innecesaria.

## Logs

Revisar parámetros como:

- `log_connections`;
- `log_disconnections`;
- `log_statement` según contexto;
- `log_min_duration_statement`;
- formato/prefijo suficiente para trazabilidad.

## Cifrado

### At-rest

Protege discos, snapshots, backups y almacenamiento persistente.

### In-transit

Protege la comunicación cliente ↔ PostgreSQL mediante TLS.

## Zero Trust aplicado a datos

No confiar solo por pertenecer a una red.

```text
Identidad
+
Autorización
+
Canal cifrado
+
Contexto
+
Logging/Auditoría
```

## Taller 1 — Hardening PostgreSQL en Linux

Revisar:

```bash
sudo ss -lntp
sudo systemctl status postgresql
```

Y:

```sql
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;
```

Inventariar roles y extensiones. Registrar `hardening_before.md`, aplicar cambios autorizados y generar `hardening_after.md`.

## Taller 2 — TLS

1. Disponer de certificados de laboratorio.
2. Configurar PostgreSQL con SSL/TLS.
3. Ajustar `pg_hba.conf` para requerir conexión segura cuando corresponda.
4. Reiniciar de forma controlada.
5. Conectarse forzando TLS.
6. Validar:

```sql
SELECT ssl, version, cipher
FROM pg_stat_ssl
WHERE pid = pg_backend_pid();
```

## Taller 3 — Secrets Manager

Patrón:

```text
Código sin secreto
→ identidad de workload
→ Secret Manager / Key Vault / Secrets Manager / Vault
→ secreto en runtime
```

La práctica puede usar el proveedor autorizado para el curso; el aprendizaje es el patrón, no memorizar cuatro productos.

## Taller 4 — Auditoría y logs

Responder con evidencia:

- quién se conectó;
- desde dónde;
- cuándo;
- qué sesión está activa;
- qué errores o cambios relevantes ocurrieron.

Consulta útil:

```sql
SELECT usename, application_name, client_addr, backend_start
FROM pg_stat_activity;
```

`pgAudit` puede presentarse como opción avanzada a evaluar, no como requisito universal.

## Prompt ATLAS sugerido

```text
## ACTOR
Actúa como Security Architect y PostgreSQL Security Engineer.

## TAREA
Evalúa PostgreSQL y su entorno Linux e identifica oportunidades de hardening.

## LÍMITES
No asumas que una configuración por defecto es segura.
No inventes evidencia.
No propongas deshabilitar una capacidad necesaria sin documentar impacto.

## AUTOVALIDACIÓN
Evalúa cada hallazgo contra Confidentiality, Integrity y Availability.
Revisa red, autenticación, roles, TLS, secretos, logs, extensiones y backups.

## SALIDA
1. Hardening assessment.
2. Hallazgos y riesgo.
3. Configuración recomendada.
4. Evidencia before/after.
5. Preguntas abiertas.
```

## Entregables

```text
docs/security/
├── 07_cia_model.md
├── 08_postgresql_hardening.md
├── 09_tls_configuration.md
├── 10_secrets_management.md
├── 11_audit_logging.md
└── 12_zero_trust_notes.md

evidence/
├── hardening_before.md
├── hardening_after.md
├── tls_test.md
├── secrets_test.md
└── audit_test.md
```

## Definition of Done

- [ ] CIA mapeado a controles;
- [ ] listeners y accesos revisados;
- [ ] roles mínimos definidos;
- [ ] extensiones inventariadas;
- [ ] TLS habilitado y probado;
- [ ] secretos fuera del código;
- [ ] logging/auditoría configurados;
- [ ] evidencia before/after versionada;
- [ ] Specification actualizada.