#!/bin/bash

if [ ! -f /path/to/file ]
then
    cp .env.example .env
fi

composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dist --ignore-platform-reqs
heroku -a dinusha-laravel config:set APP_KEY=$(php artisan --no-ansi key:generate --show)
chmod -R 777 storage bootstrap/cache
