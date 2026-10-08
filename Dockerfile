FROM php:8.2-cli

# Install dependensi sistem & ekstensi PHP
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git \
    && docker-php-ext-install pdo_mysql mbstring

WORKDIR /app
COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

EXPOSE 8080
CMD php artisan config:cache && php artisan migrate --force && php -S 0.0.0.0:8080 -t public