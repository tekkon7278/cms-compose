FROM php:8.1-fpm

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
RUN git clone https://github.com/tekkon7278/cms-laravel-vue.git app
WORKDIR /var/www/app
RUN chmod -R 757 storage

RUN composer install
COPY ./files/.env /var/www/app

# javascript construction
RUN npm install @vue/cli @vitejs/plugin-vue vuetify vue-router @mdi/font
RUN npm run build

# create application key
RUN php artisan key:generate

# create tables
RUN php artisan migrate