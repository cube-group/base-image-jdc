FROM trion/jenkins-docker-client

#alpine3.7

# php71
RUN cp /etc/apk/repositories /etc/apk/repositories.bak && \
    echo "http://mirrors.aliyun.com/alpine/v3.7/main/" > /etc/apk/repositories && \
    apk update && \
    apk add autoconf \
        dpkg-dev dpkg \
        file \
        g++ \
        gcc \
        libc-dev \
        make \
        pkgconf \
        re2c

RUN rm -rf /etc/apk/repositories && \
    mv /etc/apk/repositories.bak /etc/apk/repositories && \
    apk update && \
    apk add php7 php7-json php7-phar php7-gd php7-iconv php7-openssl php7-mbstring php7-dom php7-pdo && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    apk add php7-dev php7-pear && \
    pecl install mongodb && \
    echo "extension=mongodb.so" > /etc/php7/conf.d/install_mongodb.ini

#nodejs
RUN apk add nodejs