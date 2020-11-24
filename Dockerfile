FROM php:fpm
RUN docker-php-ext-install pdo pdo_mysql mysqli

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer
WORKDIR /app
COPY . ./

RUN apt-get update && apt-get install -y \
    git \
    unzip

RUN apt-get update -y && apt-get install -y sendmail libpng-dev
RUN docker-php-ext-install gd
