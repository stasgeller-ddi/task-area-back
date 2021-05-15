# See https://github.com/docker-library/php/blob/master/7.1/fpm/Dockerfile
FROM php:7.4.3-fpm
ARG TIMEZONE

MAINTAINER Stas Geller <stas.geller.ddi@gmail.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libicu-dev \
        libpq-dev \
        libxpm-dev \
        libvpx-dev \
        openssl \
        git \
        unzip \
        libzmq3-dev \
        nano \
        supervisor \
        libzip-dev

#install some base extensions
RUN apt-get install -y \
        zlib1g-dev \
        zip \
  && docker-php-ext-install zip

# Install Redis
#RUN pecl install redis
#RUN touch /usr/local/etc/php/conf.d/docker-php-ext-redis.ini
#RUN echo "extension=redis.so" >> /usr/local/etc/php/conf.d/docker-php-ext-redis.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone
RUN printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini
RUN "date"
#
## Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install -j$(nproc) intl
RUN docker-php-ext-install -j$(nproc) pgsql
RUN docker-php-ext-install -j$(nproc) pdo_pgsql
RUN docker-php-ext-install -j$(nproc) exif
RUN docker-php-ext-install -j$(nproc) sockets
RUN docker-php-ext-install -j$(nproc) zip

# install xdebug
RUN pecl install xdebug-2.9.8
RUN docker-php-ext-enable xdebug

# RUN echo 'alias sf="php app/console"' >> ~/.bashrc
RUN echo 'alias sf3="php bin/console"' >> ~/.bashrc

WORKDIR /var/www/api
