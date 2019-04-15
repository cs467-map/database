A PostgreSQL powered database with quality of life data.

# Quickstart

```sh
export DATABASE_FILE=database.sql
export DATABASE_LOCAL=map

git pull origin master
psql -d $DATABASE_LOCAL -f $DATABASE_FILE
```

# Database Setup

## Install PostgreSQL

[OS-specific instructions](https://www.postgresql.org/download/).

## Update Database

Set environmental variables.

```sh
export APP="cs467-map-server"
export DATABASE_FILE=database.sql
export DATABASE_LOCAL=map
export DATABASE_URL=postgres://$(whoami)@localhost/map
```
Update local database

```sh
psql -d $DATABASE_LOCAL -f $DATABASE_FILE
```

# Heroku Operations

## Pulling

```sh
dropdb $DATABASE_LOCAL
heroku pg:pull DATABASE_URL $DATABASE_LOCAL
```

## Pushing

```sh
keroku pg:reset --confirm $APP
heroku pg:push $DATABASE_LOCAL DATABASE_URL
```

# Starting from Scratch

```sh
# crate a database user
createuser --interactive

# create a database
createdb COOL_DATABASE

# access database
psql -d COOL_DATABASE
```

# Helpful Resources

- https://www.postgresql.org/
- https://www.postgresql.org/docs/
- https://wiki.archlinux.org/index.php/PostgreSQL
- https://devcenter.heroku.com/articles/heroku-postgresql#connecting-in-node-js

