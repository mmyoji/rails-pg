# README - Rails Playground

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

