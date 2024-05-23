#!/bin/sh

# Encerra o script se detectar algum erro.
set -e

while ! nc -z $DB_HOST $DB_PORT; do
    echo "🟡 Waiting for Mysql Database Startup ($DB_HOST $DB_PORT) ..."
    sleep 0.1
done

echo "✅ Mysql Database Started Successfully ($DB_HOST:$DB_PORT)"

composer install
php artisan key:generate
php artisan optimize
php artisan migrate