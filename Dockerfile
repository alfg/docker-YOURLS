FROM alpine:3.10

ENV YOURLS_VERSION 1.7.4

RUN apk --update add \
    curl \
    php-apache2 \
    php-cli \
    php-curl \
    php-json \
    php-mysqli \
    php-zip \
    php-gd \
    php-pdo \
    php-pdo_mysql \
    php-mbstring \
    php-phar \
    php-xml \
    php-pear \
    php-bcmath \
    php-openssl && \
    rm -f /var/cache/apk/* && \
    curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer && \
    mkdir -p /var/www/html/ && chown -R apache:apache /var/www/html

# Get YOURLS release archive.
RUN cd /var/www/html && \
  wget https://github.com/YOURLS/YOURLS/archive/${YOURLS_VERSION}.tar.gz && \
  tar -xf ${YOURLS_VERSION}.tar.gz --strip-components=1 && rm ${YOURLS_VERSION}.tar.gz

# All config files.
COPY src/config.php /var/www/html/user/config.php
COPY src/.htaccess /var/www/html/user/.htaccess
COPY etc/apache2/httpd.conf /etc/apache2/httpd.conf
COPY etc/apache2/sites/ /etc/apache2/sites/
COPY etc/php/php.ini /etc/php7/php.ini
COPY scripts/entrypoint.sh /opt/entrypoint.sh

EXPOSE 80

WORKDIR /var/www/html/
ENTRYPOINT [ "/opt/entrypoint.sh" ]
