import os
import sys
import psycopg


def buscar_usuario(conn, email: str):
    return conn.execute(
        "SELECT id, email, nombre FROM users WHERE email = %s",
        (email,),
    ).fetchall()


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Uso: python3 app_seguro.py <email>")

    with psycopg.connect(os.environ["DATABASE_URL"]) as conn:
        rows = buscar_usuario(conn, sys.argv[1])
        print(f"Filas devueltas: {len(rows)}")
        for row in rows:
            print(row)
