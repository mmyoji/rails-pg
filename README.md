# README - Rails Playground

[![CircleCI](https://circleci.com/gh/mmyoji/rails-pg.svg?style=svg)](https://circleci.com/gh/mmyoji/rails-pg)

[My philosophy when writing code](https://blog.mmyoji.com/posts/2018-11-21-philosophy-when-writing-code/)

## Requirements

* docker, docker-compose

## Setup

```sh
$ cp .env.example .env
# and tweak environment variables

# Start docker services
$ docker-compose up -d

# Create DB
$ docker-compose run web rails db:create db:migrate
```

## Test

```sh
$ docker-compose run -e RAILS_ENV=test web rails db:create db:migrate

# Run all tests
$ docker-compose run web rails test

# Run only controller tests
$ docker-compose run web rails test:controllers
```

## Access DB

```
$ docker-compose run postgres psql -U <postgres_username> -h postgres

# change the database
>> \c rails-pg_development
```

