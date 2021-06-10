# Devlog

<!-- TOC -->

- [Devlog](#devlog)
  - [init NodeJs project](#init-nodejs-project)
  - [setup the database](#setup-the-database)
  - [add project dependencies](#add-project-dependencies)
  - [setup the server](#setup-the-server)
  - [docker](#docker)

<!-- /TOC -->

## init NodeJs project

- init the project locally
  - create a new project dir: `mkdir /path/to/api && cd /path/to/api`
  - init git repo: `git init .`
  - init npm package: `npm init -y`

- push the initialized project
  - create .gitignore:
    ```bash
      cat <<EOF> .gitignore
      node_modules/
      # VSCodium workspaces
      *.workspace
      EOF
    ```
  - check untracked dirs and files: `git status`
  - make the very first commit: `git add .`
  - create a distant repo on Github then setup the repo locally: `git remote add origin https://github.com/Baptiste/Benti/nodejs-rest-api.git`
  - rename the master branch: `branch -M main`
  - push remotely: `push -u origin main`

## setup the database

- create a new database
  - install postgres following the official documentation: https://www.postgresql.org/download/linux/debian/
  - check the installation using: `psql --version`
  - create a database named 'api' owned by a new user named 'benti':
    - open shell for postgres: `sudo su - postgres`
    - connect to psql with postgres: `psql -U postgres`
    - create a new role: `CREATE ROLE benti;`
    - create a new database: `CREATE DATABASE api OWNER benti;`
    - quit psql: `\q`
    - close postgres shell: `exit`
  - psql cheat sheet:
    - `\l` get all databases
    - `\du` get all users/roles and their rights
    - `\c <database>` connect to the given database
    - `\dt` get all tables (for current SCHEMA)
    - `SHOW search_path;` get the current SCHEMA
    - `SET search_path TO <schema-name>` Switch to the given SCHEMA
    - `TABLE <table>` get the columns for the given table
    - `\q`: exit psql

- setup database structure (TABLES):
  - create ./data/db_structure.sql: `mkdir data && touch data/db_structure.sql`
  - fill ./data/db_structure.sql following the model on https://app.sqldbm.com/
  - create the tables: `psql api -f data/db_structure.sql`
    - note: ./data/db_structure.sql removes the default 'public' schema, a possible 'api' schema and (re)create an 'api' schema before creating all the tables using this namespace

- fill the database:
  - create ./data/db_data.sql: `touch data/db_data.sql` and fill it
  - run `psql api -f data/db_data.sql` to fill the database
  - note: DROP all the tables using db_structure.sql before running again db_data.sql

## add project dependencies

- add project dependencies: `npm i compression cors dotenv express helmet morgan pg`
- add dev dependencies: `npm i -D nodemon`

- notes about dependencies:
  - compression: it will attempt to compress response bodies for all request that traverse through the middleware
  - cors: provides an Express middleware that can be used to enable CORS with various options. Understanding cors: https://medium.com/@baphemot/understanding-cors-18ad6b478e2b
  - dotenv: it loads environment variables from a .env file into process.env.
  - express: fast, unopinionated, minimalist web framework for node.
  - helmet: it helps you secure your Express apps by setting various HTTP headers.
  - morgan: HTTP request logger middleware for node.js
  - pg: non-blocking PostgreSQL client for Node.js. Pure JavaScript and optional native libpq bindings.
  - nodemon: automatically restarting the node application when file changes in the directory are detected.

## setup the server

- notes:
  - app.js
    - defines the express app and its main logic
  - config.js
    - exports the connection to the db
    - used by app.js
  - .env
    - defines env variables relative to the db
    - used by config.js
  - bin/www
    - app entry point (`npm start` & `npm start:dev`)
    - imports the app from app.js and run the server
  - data/db_structure.sql
    - (re)create the tables of the db
  - data/db_data.sql
    - add placeholder data to the db

## docker

- ??
