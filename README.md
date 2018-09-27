# README - Rails Playground

## Requirements

* Ruby  v2.5.1
* Rails v5.2.1
* docker, docker-compose

## Setup

```sh
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

