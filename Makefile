.PHONY: setup
setup:
	docker-compose up -d
	docker-compose run --rm web rails db:create db:migrate
	docker-compose run --rm -e RAILS_ENV=test web rails db:migrate

.PHONY: console
console:
	docker-compose run --rm web rails c

.PHONY: test
test:
	docker-compose run --rm web rails test

