# Struttura per lo sviluppo di un progetto che usa flask, mysql/mariadb e docker.

## il codice durante la fase iniziale può essere eseguito fuori dal container e solo successivamente installato su un'immagine docker.

### Passi per iniziare
- `python -m venv .venv`
- `source .venv/bin/activate`
- `pip install -r requirements.txt`
- `docker-compose up`
- `docker exec -i flask-template-project_db_1 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < db.sql`
- `flask run`

### Prima di iniziare assicurarsi che
 - sia installato **pytnon**
 - sia installato **venv**
 - sia installato **docker**
 - sia installato **docker-compose**

### Estensioni per VS Code consigliate
 - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
 - [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance)
 - [MySql](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2)
