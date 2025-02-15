FROM php:7.4.33-fpm

ARG user=developer
ARG uid=1000

RUN apt-get update && apt-get install -y --no-install-recommends
RUN apt-get install -y libpng-dev zlib1g-dev libxml2-dev libzip-dev libonig-dev libicu-dev
RUN apt-get install -y zip curl unzip git
RUN apt-get install -y nodejs npm
RUN docker-php-ext-configure gd && docker-php-ext-install -j$(nproc) gd \
    pdo_mysql \
    mysqli \
    zip \
    soap \
    bcmath  \
    intl
RUN pecl install redis && docker-php-ext-enable redis
RUN rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /var/www/html

EXPOSE 9000

USER $user