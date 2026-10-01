#!/usr/bin/env bash
set -u

PSQL_BASE=(docker exec -i pg-lab psql -U postgres -d pedidos -v ON_ERROR_STOP=1)

pass() { printf '✅ %s\n' "$1"; }
fail() { printf '❌ %s\n' "$1"; exit 1; }

expect_ok() {
  local label="$1"
  local sql="$2"
  if printf '%s\n' "$sql" | "${PSQL_BASE[@]}" >/tmp/dmc_perm.out 2>/tmp/dmc_perm.err; then
    pass "$label"
  else
    cat /tmp/dmc_perm.err
    fail "$label"
  fi
}

expect_fail() {
  local label="$1"
  local sql="$2"
  if printf '%s\n' "$sql" | "${PSQL_BASE[@]}" >/tmp/dmc_perm.out 2>/tmp/dmc_perm.err; then
    cat /tmp/dmc_perm.out
    fail "$label (debía fallar)"
  else
    pass "$label"
  fi
}

expect_ok   "readonly puede leer"        "SET ROLE app_readonly; SELECT count(*) FROM pedidos; RESET ROLE;"
expect_fail "readonly no puede borrar"   "SET ROLE app_readonly; DELETE FROM pedidos WHERE id = 1;"
expect_fail "readonly no puede actualizar" "SET ROLE app_readonly; UPDATE pedidos SET estado='X' WHERE id=1;"
expect_fail "readonly no puede hacer DROP" "SET ROLE app_readonly; DROP TABLE pedidos;"

expect_ok   "writer puede insertar"      "SET ROLE app_writer; INSERT INTO pedidos (user_id,total) VALUES (2,10.00); RESET ROLE;"
expect_ok   "writer puede actualizar"    "SET ROLE app_writer; UPDATE pedidos SET estado='ANULADO' WHERE id=2; RESET ROLE;"
expect_fail "writer no puede borrar"     "SET ROLE app_writer; DELETE FROM pedidos WHERE id = 2;"
expect_fail "writer no puede hacer DROP" "SET ROLE app_writer; DROP TABLE pedidos;"

expect_ok "roles runtime sin privilegios administrativos" \
"SELECT rolname, rolsuper, rolcreaterole, rolcreatedb
 FROM pg_roles
 WHERE rolname IN ('api_reportes','api_pedidos')
   AND NOT rolsuper
   AND NOT rolcreaterole
   AND NOT rolcreatedb;"

rm -f /tmp/dmc_perm.out /tmp/dmc_perm.err
