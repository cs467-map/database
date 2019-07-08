[![Build Status](https://liambeckman.com/jenkins/buildStatus/icon?job=voyager-index-database&style=flat-square)](https://liambeckman.com/jenkins/job/voyager-index-database/)

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
export DATABASE_URL=postgres://$(whoami)@localhost/$DATABASE_LOCAL
```
Update local database

```sh
psql -d $DATABASE_LOCAL -f $DATABASE_FILE
```

# Heroku Operations

## Pulling

```sh
dropdb $DATABASE_LOCAL
heroku pg:pull DATABASE_URL $DATABASE_LOCAL --app $APP
```

## Pushing

```sh
heroku pg:reset --confirm $APP --app $APP
heroku pg:push $DATABASE_LOCAL DATABASE_URL --app $APP
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

# Building

The database is updated everytime a push is made to the `master` branch. Build commands are defined in the [Jenkinsfile](./Jenkinsfile), and build results can be viewed at either of the following URL's.

- [Jenkins (standard)](https://liambeckman.com/jenkins/job/voyager-index-database/)
- [Jenkins (Blue Ocean)](https://liambeckman.com/jenkins/blue/organizations/jenkins/voyager-index-database/activity)
