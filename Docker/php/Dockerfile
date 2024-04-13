FROM php:7.4-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add freetype \
        freetype-dev \
        libpng \
        libpng-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
       --with-jpeg=/usr/include \
       --with-freetype=/usr/include/freetype2/ \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql \
    && apk add ${PHPIZE_DEPS} \
    && pecl install redis-4.0.1 \
    && docker-php-ext-enable redis \
    && apk del ${PHPIZE_DEPS} \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev

# COPY ./config/php.ini /usr/local/etc/php/conf.d/
# COPY ./config/opcache-recommended.ini /usr/local/etc/php/conf.d/