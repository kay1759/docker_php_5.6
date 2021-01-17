FROM php:5.6.28-apache
MAINTAINER Katsuyoshi Yabe <kay@wizis.com>

## Change user ID
run usermod www-data -u 1000
run groupmod www-data -g 1000

run apt update \
	&& apt install -y \
	gcc \
	make \
	git \
	unzip \
	vim \
	curl \
	gnupg \
	libjpeg-dev \
	libmcrypt-dev \
	libpng-dev \
	zlib1g-dev \
	libxml2-dev \
	libzip-dev \
	libfreetype6-dev \
	libc-client-dev \
	&& docker-php-ext-install mcrypt pdo_mysql mysqli mbstring zip \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
	&& docker-php-source delete

run a2enmod rewrite
run a2enmod ssl

copy ./php.ini /usr/local/etc/php

## Install composer
workdir /usr/local/bin/
run curl -sS https://getcomposer.org/installer | php
run mv composer.phar composer

## Install postfix
env DEBIAN_FRONTEND=noninteractive
run apt install -y postfix

copy ./master.cf /etc/postfix
copy ./main.cf /etc/postfix

## Finalizing...
run rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

workdir /var/www
