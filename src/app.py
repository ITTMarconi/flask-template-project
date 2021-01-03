import sys
from os import environ, path

sys.path.append(path.dirname(__file__))

import time

import redis
from flask import Flask
from flaskext.mysql import MySQL
#from config import DockerDevConfig as Config
from config import DevConfig as Config
#from config import ProdConfig as Config

app = Flask(__name__)
app.config.from_object(Config)
cache = redis.Redis(host='localhost', port=6379)
# Using a production configuration
#app.config.from_object('config.ProdConfig')

# Using a development configuration
#app.config.from_pyfile('config.py')
mysql = MySQL()
mysql.init_app(app)
