# README - Rails Playground

## Requirements

* Ruby  v2.5.2
* Rails v5.2.1
* yarn (for webpacker)
* docker, docker-compose
* [direnv](https://github.com/direnv/direnv)

## Setup

```sh
$ cp .envrc.example .envrc
# and tweak environment variables

# bundle install
$ bundle -j 4 --path=vendor/bundle

# Start docker services
$ docker-compose up -d

# Create DB
$ bin/rails db:create db:migrate

# Start the server
$ bin/rails s
```

## Test

```sh
$ RAILS_ENV=test bin/rails db:create db:migrate

# Run all tests
$ bin/rails test

# Run only controller tests
$ bin/rails test:controllers
```

