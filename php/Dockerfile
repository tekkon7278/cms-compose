FROM php:8.1-fpm

ARG APP_GIT_URL

#packegs update
RUN apt update

# MySQL PDO module install
RUN docker-php-ext-install pdo_mysql

# composer install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# git install
RUN apt install -y git

# nodejs install
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash
RUN apt install -y nodejs

# application source get
WORKDIR /var/www
RUN git init
RUN git clone ${APP_GIT_URL} app
WORKDIR /var/www/app
RUN chmod -R 757 storage

RUN composer install
COPY ./files/.env /var/www/app

# javascript construction
RUN npm install
ENV NODE_OPTIONS "--max-old-space-size=2048"
RUN npm run build

# create application key
RUN php artisan key:generate
