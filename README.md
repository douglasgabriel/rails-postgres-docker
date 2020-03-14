# Rails + Postgres + Docker base

This project contains the minimum structure to build an application with Rails, PostgreSQL and Docker based stack.

#### Getting started

> Before start, make sure that you have Docker and Docker Compose installed on your machine.

First, clone this repo into your local machine:

```shell
$ git clone git@github.com:douglasgabriel/rails-postgres-docker.git
```

Move into the project folder and then create a new Rails skeleton by running:

```shell
$ docker-compose run app rails new . --force --no-deps --database=postgresql
```

You now should be able to see the Rails structure created on the project folder.

> For Linux users, since Docker runs as root user, you still need to change the owner of the new folders by running `sudo chown -R $USER:$USER .`

With the Rails base structure defined, you will need to build your app image by running:

```shell
$ docker-compose build
```

#### Configuring Database access

To connect the Application with the Database created by Docker it's needed to change the `config/database.yml` file:

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db # this must match the name of the service that you defined on docker-compose.yml
  username: postgres # the default username
  password: root # the password that was defined on docker-compose.yml env vars
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: dev

test:
  <<: *default
  database: test
```

#### Running the application

You is now able to run your application by running:

```shell
$ docker-compose up app
```
