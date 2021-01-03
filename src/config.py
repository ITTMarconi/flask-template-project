"""Flask configuration."""
from os import environ, path
from dotenv import load_dotenv

basedir = path.abspath(path.dirname(__file__))
load_dotenv(path.join(basedir, '.env'))

class Config:
    """Base config."""
    SECRET_KEY = environ.get('SECRET_KEY')
    STATIC_FOLDER = 'static'
    TEMPLATES_FOLDER = 'templates'
    MYSQL_DATABASE_USER = environ.get('MYSQL_DATABASE_USER')
    MYSQL_DATABASE_PASSWORD = environ.get('MYSQL_DATABASE_PASSWORD')
    MYSQL_DATABASE_DB = environ.get('MYSQL_DATABASE_DB')

class ProdConfig(Config):
    FLASK_ENV = 'production'
    DEBUG = False
    TESTING = False
    MYSQL_DATABASE_HOST = environ.get('MYSQL_PRODUCTION_DATABASE_HOST')
    MYSQL_DATABASE_PORT = environ.get('MYSQL_PRODUCTION_DATABASE_PORT')

class DevConfig(Config):
    FLASK_ENV = 'development'
    FLASK_RUN_HOST = '0.0.0.0'
    ENV = 'development'
    DEBUG = True
    TESTING = True
    MYSQL_DATABASE_HOST = environ.get('MYSQL_DEV_DATABASE_HOST')
    MYSQL_DATABASE_PORT = int(environ.get('MYSQL_DEV_DATABASE_PORT'))


class DockerDevConfig(DevConfig):
    MYSQL_DATABASE_HOST = environ.get('MYSQL_DOCKER_DATABASE_HOST')
    MYSQL_DATABASE_PORT = int(environ.get('MYSQL_DOCKER_DATABASE_PORT'))


