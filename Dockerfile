FROM trion/jenkins-docker-client

#alpine3.7

RUN apk update && \
    apk add php7 php7-json php7-phar php7-iconv php7-openssl php7-mbstring && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
