FROM php:8.4-fpm-alpine

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apk add --no-cache supervisor

#if you need gd and soap uncomment these two line.
#RUN apk add --no-cache zlib-dev libpng-dev libxml2 libxml2-dev
#RUN docker-php-ext-install gd

#RUN apk add --no-cache libzip-dev
#RUN docker-php-ext-install zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["supervisord", "-c", "/etc/supervisord.conf"]