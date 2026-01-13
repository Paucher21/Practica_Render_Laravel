#!/bin/sh

set -e

echo "Esperando 10 segundos a que la Base de Datos esté lista..."
sleep 10

echo "Ejecutando migraciones..."
php artisan migrate --force

if [ "$APP_ENV" != "production" ]; then
    echo "Ejecutando seeders..."
    php artisan db:seed --force
else
    echo "Entorno de producción detectado: Saltando seeders automáticos."
fi

echo "Iniciando servidor..."

exec "$@"