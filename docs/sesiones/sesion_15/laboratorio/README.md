# DMC Institute — Sesión 15

# Laboratorio guiado: Arquitectura segura de bases de datos

**Curso:** Arquitectura y Bases de Datos con IA para Aplicaciones Modernas  
**Sesión:** 15 — Arquitectura segura de bases de datos  
**Duración sugerida:** 80–95 minutos dentro de la sesión de 3 horas  
**Entorno:** Google Cloud Shell + Docker + PostgreSQL 16 + Python + Gemini CLI opcional  
**Metodología:** SDD + ATLAS + Generate → Critique → Break → Measure → Refine → Evidence

> **Regla del laboratorio:** todo ataque o prueba negativa se ejecuta exclusivamente contra los contenedores efímeros creados para esta práctica. Nunca contra sistemas reales, productivos o de terceros.

## Objetivo

Convertir los conceptos de seguridad de la Sesión 15 en evidencia verificable. El alumno debe poder demostrar:

1. por qué una consulta concatenada puede ser vulnerable a SQL Injection;
2. cómo una consulta parametrizada separa datos de instrucciones;
3. cómo validar estructura de entrada antes de llegar a la base;
4. cómo aplicar mínimo privilegio;
5. cómo distinguir riesgo de exfiltración de un acceso legítimo;
6. cómo evitar secrets hardcodeados;
7. cómo crear y **restaurar** un backup;
8. por qué una réplica no reemplaza un backup;
9. cómo versionar evidencia y actualizar la DMC Application Specification.

---

## Mapa del laboratorio

```mermaid
flowchart LR
    A[Specification / caso Pedidos] --> B[Threat model]
    B --> C[SQL Injection]
    C --> D[Query parametrizada]
    D --> E[Validación estructural]
    E --> F[Roles y mínimo privilegio]
    F --> G[Secrets y exfiltración]
    G --> H[Backup + Restore]
    H --> I[Replicación]
    I --> J[Evidencia + actualización del Spec]

    C -. prueba negativa .-> C
    F -. prueba de permisos .-> F
    H -. restore test .-> H
    I -. DELETE se replica .-> I
```

---

## Arquitectura del entorno de práctica

```mermaid
flowchart TB
    U[Alumno / Cloud Shell] --> PY[Scripts Python]
    PY -->|5432| PG[(PostgreSQL Primary\npg-lab)]
    PG -->|logical replication| R[(PostgreSQL Replica\npg-replica)]

    U --> GIT[Git local]
    GIT --> EV[evidence/]
    GIT --> DOC[docs/security/]

    AI[Gemini CLI / LLM autorizado] -. propone y revisa .-> U
    EV --> SPEC[DMC Application Specification]
    DOC --> SPEC
```

La IA actúa como **copiloto**. La salida del modelo no es evidencia hasta que el alumno la valide contra código, configuración o ejecución real.

---

# Paso 0 — Preparar Cloud Shell

Desde Google Cloud Shell:

```bash
mkdir -p ~/dmc-s15/{docs/security,evidence,tests}
cd ~/dmc-s15

git init -q

docker network create dmc-s15-net 2>/dev/null || true

docker run -d --name pg-lab \
  --network dmc-s15-net \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=lab_only_pw \
  -e POSTGRES_DB=pedidos \
  postgres:16 \
  -c wal_level=logical \
  -c max_replication_slots=10 \
  -c max_wal_senders=10

until docker exec pg-lab pg_isready -U postgres -d pedidos >/dev/null 2>&1; do
  sleep 1
done

python3 -m pip install --user -q "psycopg[binary]" pytest pydantic

export PSQL="docker exec -i pg-lab psql -v ON_ERROR_STOP=1 -U postgres -d pedidos"
export DATABASE_URL="postgresql://postgres:lab_only_pw@localhost:5432/pedidos"
```

> `lab_only_pw` es una credencial deliberadamente simple y exclusiva del laboratorio. Se destruye al finalizar. No copiarla a proyectos reales.

Copia a `~/dmc-s15` los archivos de esta carpeta del repositorio.

Verifica:

```bash
docker ps
python3 --version
$PSQL -c "SELECT version();"
```

---

# Ejercicio 1 — Threat model asistido por IA

## Objetivo

Diferenciar un **hallazgo confirmado** de un **riesgo potencial**.

Usa el siguiente prompt ATLAS sobre la carpeta del laboratorio:

```text
## ACTOR
Actúa como arquitecto de seguridad de bases de datos y especialista PostgreSQL.

## TAREA
Analiza los archivos de este laboratorio e identifica trust boundaries,
activos, amenazas y controles observables para el caso Pedidos.

## LÍMITES
No inventes controles.
No supongas que una réplica es un backup.
No clasifiques como vulnerabilidad confirmada algo que no tenga evidencia.
No copies secretos reales a la salida.

## AUTOVALIDACIÓN
Cada hallazgo debe incluir:
- activo o componente;
- amenaza;
- CIA afectado;
- evidencia;
- impacto;
- mitigación;
- prioridad.

## SALIDA
1. Diagrama Mermaid de trust boundaries.
2. Threat model.
3. Hallazgos confirmados.
4. Riesgos potenciales.
5. Controles existentes.
6. Preguntas abiertas.
```

Audita la respuesta del modelo: cada afirmación debe poder regresar a un archivo, línea, configuración o evidencia ejecutada.

**Entregable:** `docs/security/01_threat_model.md`

---

# Ejercicio 2 — SQL Injection: reproducir, corregir y fijar con test

## Objetivo

Observar cómo la concatenación permite que la entrada altere la intención de una consulta y demostrar que la parametrización lo evita.

```bash
$PSQL < seed.sql

python3 app_inseguro.py "ana@correo.pe"
python3 app_inseguro.py "x' OR '1'='1"
python3 app_seguro.py   "x' OR '1'='1"

python3 -m pytest -q tests/
```

Resultado esperado:

- entrada normal: devuelve un usuario;
- versión insegura con entrada de laboratorio: altera el filtro y devuelve más filas de las esperadas;
- versión parametrizada: interpreta toda la entrada como un valor;
- tests: pasan y dejan un control de regresión.

La mitigación clave es:

```python
conn.execute(
    "SELECT id, email, nombre FROM users WHERE email = %s",
    (email,),
)
```

## Before / After

```mermaid
flowchart LR
    subgraph BEFORE[Antes]
        I1[Input] --> C1[Concatenación]
        C1 --> Q1[Texto SQL cambia]
        Q1 --> DB1[(PostgreSQL)]
    end

    subgraph AFTER[Después]
        I2[Input] --> P2[Parámetro]
        SQL2[SQL fijo] --> D2[Driver psycopg]
        P2 --> D2
        D2 --> DB2[(PostgreSQL)]
    end
```

**Entregables:**

- `evidence/sql_injection_before.md`
- `evidence/sql_injection_after.md`
- `tests/test_sqli.py`

---

# Ejercicio 3 — Validación estructural: principio aplicable a NoSQL

## Objetivo

Evitar que el cliente transforme un valor esperado en una estructura de consulta.

```bash
python3 - <<'PY'
import json
from pydantic import BaseModel, StrictStr, ValidationError

class BuscarUsuario(BaseModel):
    email: StrictStr

casos = [
    '{"email": "ana@correo.pe"}',
    '{"email": {"$ne": null}}',
]

for raw in casos:
    try:
        dato = BuscarUsuario(**json.loads(raw))
        print("ACEPTADO:", dato.email)
    except ValidationError:
        print("RECHAZADO: la estructura no coincide con el contrato")
PY
```

Principio:

> La aplicación define campos, tipos y operadores permitidos. El cliente aporta valores, no una expresión de consulta arbitraria.

**Entregable:** `docs/security/02_injection_risks.md`

---

# Ejercicio 4 — Mínimo privilegio en PostgreSQL

## Objetivo

Separar capacidad de lectura y escritura y demostrar que los roles de runtime no poseen privilegios administrativos.

```bash
$PSQL < roles.sql
bash permissions_test.sh
```

Audita los roles:

```bash
$PSQL -c "SELECT rolname, rolsuper, rolcreaterole, rolcreatedb, rolinherit
          FROM pg_roles
          WHERE rolname IN ('app_readonly','app_writer','api_reportes','api_pedidos');"
```

Resultado esperado:

| Identidad | SELECT | INSERT | UPDATE | DELETE | DROP | SUPERUSER |
|---|---:|---:|---:|---:|---:|---:|
| api_reportes | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ |
| api_pedidos | ✅ | ✅ | ✅ | ❌ | ❌ | ❌ |

## Modelo de privilegios

```mermaid
flowchart TB
    ADMIN[postgres / DBA\nsolo administración] --> DB[(pedidos)]

    RO[api_reportes] --> GR1[app_readonly]
    RW[api_pedidos] --> GR2[app_writer]

    GR1 -->|SELECT| DB
    GR2 -->|SELECT / INSERT / UPDATE| DB

    RO -. no .-> DEL[DELETE]
    RW -. no .-> DEL
    RW -. no .-> DROP[DROP / CREATE ROLE]
```

**Entregables:**

- `docs/security/03_roles_permissions.md`
- `evidence/permissions_test.md`

---

# Ejercicio 5 — Secrets exposure y riesgo de exfiltración

## Objetivo

Separar dos preguntas diferentes:

1. ¿Puede alguien conseguir una credencial?
2. Si la consigue, ¿qué puede hacer con ella?

Escanea únicamente el repositorio de laboratorio:

```bash
git grep -niE "password|secret|token|api[_-]?key" || true
```

No copies valores sensibles reales a los entregables. Registra solo:

- archivo;
- tipo de hallazgo;
- si es credencial real o dato de laboratorio;
- impacto;
- acción.

Luego responde:

> Si `api_reportes` fuera comprometido, ¿qué datos podría leer? ¿Qué operación no podría realizar gracias al mínimo privilegio?

## Defensa en profundidad

```mermaid
flowchart LR
    ATT[Credencial comprometida] --> ID[Identidad runtime]
    ID --> RBAC[Rol mínimo]
    RBAC --> DATA[(Datos permitidos)]

    ID -. bloqueado .-> ADMIN[Administración]
    ID -. bloqueado .-> DELETE[Borrado]
    ID -. bloqueado .-> DDL[DDL]
```

**Entregable:** `docs/security/04_secrets_exfiltration.md`

---

# Ejercicio 6 — Backup: crear, restaurar y verificar

## Objetivo

Demostrar que existe una copia recuperable. Un archivo de backup sin prueba de restauración es solo una hipótesis.

```bash
BACKUP="pedidos_$(date +%Y%m%d_%H%M%S).dump"

docker exec pg-lab pg_dump -U postgres -Fc pedidos > "$BACKUP"
sha256sum "$BACKUP" | tee "${BACKUP}.sha256"

$PSQL -c "DROP DATABASE IF EXISTS pedidos_restore;"
$PSQL -c "CREATE DATABASE pedidos_restore;"

docker exec -i pg-lab pg_restore -U postgres -d pedidos_restore < "$BACKUP"

docker exec -i pg-lab psql -U postgres -d pedidos_restore \
  -c "SELECT count(*) AS pedidos_restaurados FROM pedidos;"
```

## Backup protegido / inmutable

La práctica demuestra backup + restore. La **inmutabilidad real** debe ser provista por el destino: por ejemplo, retención protegida, Object Lock o un vault con identidad separada. No actives un lock irreversible sobre un bucket de clase sin indicación docente.

```mermaid
flowchart LR
    PROD[(PostgreSQL)] --> B[Backup]
    B --> V[Storage protegido / Vault]
    V --> R[Retention]
    R --> RESTORE[Restore test]
    RESTORE --> E[Evidencia]

    APP[Identidad de aplicación] -. no puede borrar .-> V
```

**Entregables:**

- `docs/security/05_backup_strategy.md`
- `evidence/backup_restore_test.md`

---

# Ejercicio 7 — Réplica no es backup

## Objetivo

Demostrar que un cambio lógico válido en el primary puede propagarse a una réplica.

Crear la réplica en la misma red Docker:

```bash
docker run -d --name pg-replica \
  --network dmc-s15-net \
  -p 5433:5432 \
  -e POSTGRES_PASSWORD=lab_only_pw \
  -e POSTGRES_DB=pedidos \
  postgres:16

until docker exec pg-replica pg_isready -U postgres -d pedidos >/dev/null 2>&1; do
  sleep 1
done
```

Copiar solo el esquema:

```bash
docker exec pg-lab pg_dump -U postgres -s --no-owner --no-privileges pedidos \
  | docker exec -i pg-replica psql -U postgres -d pedidos
```

Crear publicación y suscripción:

```bash
$PSQL -c "DROP PUBLICATION IF EXISTS pub_pedidos;"
$PSQL -c "CREATE PUBLICATION pub_pedidos FOR TABLE users, pedidos;"

docker exec -i pg-replica psql -U postgres -d pedidos <<'SQL'
DROP SUBSCRIPTION IF EXISTS sub_pedidos;
CREATE SUBSCRIPTION sub_pedidos
CONNECTION 'host=pg-lab port=5432 dbname=pedidos user=postgres password=lab_only_pw'
PUBLICATION pub_pedidos;
SQL
```

Esperar y verificar:

```bash
sleep 3
docker exec pg-replica psql -U postgres -d pedidos \
  -c "SELECT count(*) FROM pedidos;"
```

Ahora realiza un cambio controlado:

```bash
$PSQL -c "DELETE FROM pedidos WHERE id = 1;"
sleep 2

docker exec pg-replica psql -U postgres -d pedidos \
  -c "SELECT id FROM pedidos ORDER BY id;"
```

La fila también desaparece en la réplica.

```mermaid
flowchart LR
    P[(Primary)] -->|WAL / cambios| R[(Replica)]
    DEL[DELETE válido] --> P
    P --> R

    B[(Backup / PITR)] -. conserva punto anterior .-> REC[Recuperación]
```

> **Replica = disponibilidad / escalamiento de lectura. Backup = recuperación histórica.** Son controles diferentes.

**Entregable:** `docs/security/06_replication_strategy.md`

---

# Ejercicio 8 — Evidencia y actualización SDD

Crea o completa:

```text
docs/security/
├── 01_threat_model.md
├── 02_injection_risks.md
├── 03_roles_permissions.md
├── 04_secrets_exfiltration.md
├── 05_backup_strategy.md
└── 06_replication_strategy.md

evidence/
├── sql_injection_before.md
├── sql_injection_after.md
├── permissions_test.md
└── backup_restore_test.md
```

Cada evidencia debe responder:

```text
Qué queríamos demostrar
Qué ejecutamos
Qué ocurrió
Qué control quedó validado
Qué sigue pendiente
```

Actualiza la DMC Application Specification con:

- riesgo o RNF de seguridad identificado;
- control decidido;
- evidencia;
- pregunta abierta cuando corresponda.

---

# Cierre y limpieza

```bash
docker rm -f pg-replica pg-lab 2>/dev/null || true
docker network rm dmc-s15-net 2>/dev/null || true

cd ~/dmc-s15
git status
```

No versionar dumps, claves, `.env` ni credenciales.

---

# Definition of Done

- [ ] Threat model depurado con evidencia.
- [ ] SQL Injection reproducido únicamente en laboratorio.
- [ ] Query parametrizada implementada.
- [ ] Test de regresión aprobado.
- [ ] Validación estructural demostrada.
- [ ] Roles y mínimo privilegio probados.
- [ ] Riesgo de secrets/exfiltración analizado.
- [ ] Backup generado y restore ejecutado.
- [ ] Inmutabilidad diferenciada de simple backup.
- [ ] Réplica diferenciada de backup mediante evidencia.
- [ ] Diagramas Mermaid versionados en Markdown.
- [ ] DMC Application Specification actualizada.

## Idea fuerza

> **La IA propone. La configuración controla. La prueba demuestra. La evidencia decide.**
