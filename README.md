# README - Rails Playground

[![CircleCI](https://circleci.com/gh/mmyoji/rails-pg.svg?style=svg)](https://circleci.com/gh/mmyoji/rails-pg)

[My philosophy when writing code](https://blog.mmyoji.com/posts/2018-11-21-philosophy-when-writing-code/)

## What's this?

This is my Rails-playground application (Music Studio Booking app).

There are 3 apps:

1. web app: for `User`s who want to find and book a `Room` of a `Studio` online.
1. biz app: for `StaffMember`s who want to show `Room`s of his/her `Studio`s and manage `Booking`s of them.
1. admin app: for `AdminUser`s who operates all apps as an administrator.

## Requirements

* docker, docker-compose

## Setup

```sh
$ cp .env.example .env
# and tweak environment variables

$ make setup
```

## Test

```sh
$ make test

# Run only controller tests
$ docker-compose run --rm web bundle exec rails test:controllers
```

## Access DB

```
$ docker-compose run postgres psql -U <postgres_username> -h postgres

# change the database
>> \c rails-pg_development
```

