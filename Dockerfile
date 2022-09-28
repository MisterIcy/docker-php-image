ARG ARCH=amd64

FROM --platform=$ARCH php:7.4-fpm

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
    apt-utils curl zip unzip apt-transport-https git \
    locales locales-all

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1





