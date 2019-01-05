.PHONY: setup
setup:
	docker-compose up -d
	docker-compose run --rm web bundle exec rails db:create db:migrate
	docker-compose run --rm -e RAILS_ENV=test web bundle exec rails db:migrate

.PHONY: console
console:
	docker-compose run --rm web bundle exec rails c

.PHONY: test
test:
	docker-compose run --rm web bundle exec rails test

