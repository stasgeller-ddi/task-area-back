#!/bin/bash
echo "Copy settings files"
source .env
cp -n ./env.dist ./.env 2>/dev/null || :
cp -n ./env.test.dist ./.env.test 2>/dev/null || :

cd api

echo "Build docker images"
docker-compose build

echo "Run containers"
docker-compose up -d

#echo "Generate ssl for jwt"
docker-compose exec php sh -c "/bin/bash generate_ssl.sh"

echo "Basic installation of libraries"
docker-compose exec php sh -c "composer install --no-interaction"
docker-compose exec php sh -c "chown -R www-data:www-data var/"

# DB
docker-compose exec php sh -c "bin/console doctrine:schema:update --force"
docker-compose exec php sh -c "bin/console doctrine:fixtures:load --append"
