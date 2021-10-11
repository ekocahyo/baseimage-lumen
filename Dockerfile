ARG BASE_IMAGE=php:7.4-alpine
FROMA ${BASE_IMAGE} as build_lumen

RUN curl -o composer-setup.php https://getcomposer.org/installer && \
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

RUN composer create-project --prefer-dist laravel/lumen /lumen

FROM ${BASE_IMAGE}

COPY --from=build_lumen /usr/bin/composer /usr/bin/composer
COPY --from=build_lumen /lumen /lumen
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
WORKDIR /app
VOLUME /app

ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 80
HEALTHCHECK --interval=12s --timeout=12s --start-period=30s CMD curl ---silent --fail http://localhost || exit 1
CMD [ "php", "-S", "0.0.0.0:80", "-t", "/app/public" ] 