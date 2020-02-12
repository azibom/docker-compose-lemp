FROM php:fpm
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer
WORKDIR /app
COPY . ./
RUN composer install --no-dev --no-interaction -o

RUN composer global require laravel/installer








