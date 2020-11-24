FROM php:fpm
RUN docker-php-ext-install pdo pdo_mysql gd

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# Install unzip
RUN apt-get install -y unzip

WORKDIR /app
COPY . ./
