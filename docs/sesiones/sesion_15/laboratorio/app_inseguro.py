# ==========================================================================
# DMC Institute · Sesión 15
# VERSIÓN INSEGURA A PROPÓSITO — solo para el laboratorio controlado.
# No reutilizar este patrón en aplicaciones reales.
# ==========================================================================
import os
import sys
import psycopg

if len(sys.argv) != 2:
    raise SystemExit("Uso: python3 app_inseguro.py <email>")

email = sys.argv[1]

with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
    # Antipatrón didáctico: concatenación directa de input dentro del SQL.
    query = "SELECT id, email, nombre FROM users WHERE email = '" + email + "'"
    print("SQL ejecutado:", query)
    rows = conn.execute(query).fetchall()
    print(f"Filas devueltas: {len(rows)}")
    for row in rows:
        print(row)
