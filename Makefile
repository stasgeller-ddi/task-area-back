init:
	cp -n ./.env.dist ./.env 2>/dev/null || :
	/bin/bash install.sh \

up:
	docker-compose up -d

down:
	docker-compose down

php:
	docker-compose exec php bash

db-force:
	docker-compose exec -T php sh -c "php bin/console doctrine:schema:update --force && php bin/console doctrine:schema:update --force --env dev && php bin/console doctrine:schema:update --force --env test"

fixtures:
	docker-compose exec -T php sh -c "php bin/console doctrine:fixtures:load --append"
