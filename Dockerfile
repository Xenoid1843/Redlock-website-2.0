FROM php:8.1-apache

WORKDIR /var/www/html

COPY ./web/ /var/www/html

COPY redlock-dbase.sql /docker-entrypoint-initdb.d/redlock-dbase.sql

RUN apt-get update -y && apt-get install -y libmariadb-dev 

RUN docker-php-ext-install mysqli

RUN chown -R www-data:www-data /var/www/html/ \
    && chmod -R u=rwX,g=rX,o= /var/www/html/