#!/usr/bin/bash

# dockerの起動
service docker start

# それぞれのサーバーの起動
docker-compose run --rm web-back sh -c "python manage.py makemigrations"
docker-compose run --rm web-back sh -c "python manage.py migrate"
docker-compose run --rm web-back sh -c "python manage.py createsuperuser"
docker-compose run --rm web-front sh -c "yarn add next react"

# コンテナのビルド
docker-compose up --build

