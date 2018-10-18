FROM php:5.6-apache

RUN apt-get update -qq && apt-get install -y -qq \
        libfreetype6-dev \
        gnupg \
        libjpeg62-turbo-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs build-essential

RUN docker-php-ext-install pdo \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql

RUN mkdir /tmp/ioncube && \
    mkdir -p /usr/local/ioncube && \
    cd /tmp/ioncube && \
    curl -SL http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -o /tmp/ioncube/ioncube_loaders_lin_x86-64.tar.gz && \
    tar xvf /tmp/ioncube/ioncube_loaders_lin_x86-64.tar.gz && \
    cd `php -i | grep extension_dir | cut -d' ' -f 5` && \
    cp /tmp/ioncube/ioncube/ioncube_loader_lin_5.6.so /usr/local/ioncube/ioncube_loader_lin_5.6.so && \
    echo zend_extension=/usr/local/ioncube/ioncube_loader_lin_5.6.so > /usr/local/etc/php/conf.d/00-ioncube.ini && \
    rm -rf /tmp/ioncube/

ADD server-apache2-vhosts.conf /etc/apache2/sites-enabled/000-default.conf

RUN npm install -g grunt-cli bower grunt jasmine

ADD php-config.ini /usr/local/etc/php/conf.d/php-config.ini

RUN a2enmod rewrite
