#!/usr/bin/env bash
set -euo pipefail

CASE="${1:-}"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -z "${DATABASE_URL:-}" ]]; then
  echo "ERROR: define DATABASE_URL antes de ejecutar." >&2
  echo "Ejemplo: export DATABASE_URL='postgresql://usuario:password@localhost:5432/dmc'" >&2
  exit 2
fi

case "$CASE" in
  banca)
    CASE_DIR="$BASE_DIR/banca_credito_agil_360"
    ;;
  seguros)
    CASE_DIR="$BASE_DIR/seguros_siniestro_facil"
    ;;
  retail)
    CASE_DIR="$BASE_DIR/retail_stock_unico"
    ;;
  *)
    echo "Uso: $0 {banca|seguros|retail}" >&2
    exit 2
    ;;
esac

command -v psql >/dev/null 2>&1 || {
  echo "ERROR: psql no está disponible en PATH." >&2
  exit 2
}

echo "============================================================"
echo "DMC Sesión 05 · Validación ejecutable · Caso: $CASE"
echo "============================================================"
echo

echo "[1/2] Construyendo modelo físico..."
psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -f "$CASE_DIR/01_schema.sql"

echo
echo "[2/2] Ejecutando pruebas positivas y negativas..."
psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -f "$CASE_DIR/02_validate.sql"

echo
echo "============================================================"
echo "PASS · El script completo terminó sin errores no esperados."
echo "Guarda esta salida como evidencia del laboratorio."
echo "============================================================"
