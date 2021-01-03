import sys
from os import path
sys.path.append(path.join(path.dirname(__file__), '../src'))

import pymysql

import pytest
from app import app, mysql
from config import DevConfig as Config

@pytest.fixture
def client():
    app.config.from_object(Config)
    print(app.config)
    print(sys.path)

    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        yield (conn, cursor)
    except Exception as e:
	    print(e)
    finally:
        if cursor is not None:
          cursor.close()
        if conn is not None:
           conn.close()


def test_connection(client):
    """Start with a blank database."""

    conn, cursor = client
    assert conn is not None
