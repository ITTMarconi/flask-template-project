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
    """Can establish a connection"""

    conn, cursor = client
    assert conn is not None

def test_users_table(client):
    """Table users exists and has at least one user"""

    conn, cursor = client
    try:
        cursor.execute("SELECT * FROM users")
        rows = cursor.fetchone()
        assert rows is not None
    except Exception as e:
        assert False

def test_notes_table(client):
    """Table notes exists and has at least one note"""

    conn, cursor = client
    try:
        cursor.execute("SELECT * FROM notes")
        rows = cursor.fetchone()
        assert rows is not None
    except Exception as e:
        assert False

def test_tags_table(client):
    """Table tags exists"""

    conn, cursor = client
    try:
        cursor.execute("SELECT * FROM tags")
        assert True
    except Exception as e:
        assert False


def test_tags_table(client):
    """Table tags exists"""

    conn, cursor = client
    try:
        cursor.execute("SELECT * FROM tags")
        assert True
    except Exception as e:
        assert False


def test_notes_tags_table(client):
    """Table notes_tags exists"""

    conn, cursor = client
    try:
        cursor.execute("SELECT * FROM notes_tags")
        assert True
    except Exception as e:
        assert False
