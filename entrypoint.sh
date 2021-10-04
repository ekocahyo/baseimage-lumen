#!/bin/sh
if [[ -f "/app/composer.json" ]]; then
    composer install
else
    mv /lumen/* /app/
fi

chown 1000:1000 /app -R;
find /app -type f -exec chmod 664 {} \;
find /app -type d -exec chmod 775 {} \;

exec "$@"