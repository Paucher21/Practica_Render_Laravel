#!/bin/sh

set -e

echo "Esperando 10 segundos a que la Base de Datos esté lista..."
sleep 10

echo "Ejecutando migraciones..."
php artisan migrate --force

echo "Ejecutando seeders..."
php artisan db:seed --force

echo "Iniciando servidor..."

exec "$@"