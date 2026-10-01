import os
import psycopg
import pytest

from app_seguro import buscar_usuario


@pytest.fixture
def conn():
    with psycopg.connect(os.environ["DATABASE_URL"]) as connection:
        yield connection


def test_email_valido_devuelve_un_usuario(conn):
    rows = buscar_usuario(conn, "ana@correo.pe")
    assert len(rows) == 1
    assert rows[0][1] == "ana@correo.pe"


def test_input_de_laboratorio_no_devuelve_usuarios(conn):
    assert buscar_usuario(conn, "x' OR '1'='1") == []


def test_email_inexistente_no_devuelve_usuarios(conn):
    assert buscar_usuario(conn, "nadie@correo.pe") == []
