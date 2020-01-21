FROM alpine:3.11
MAINTAINER Pavel Janku <pavel@getmedia.digital>

ARG MIGRATIONS_VERSION="2.2.1"

RUN apk --update add bash php7 php7-ctype php7-iconv php7-dom php7-mbstring php7-tokenizer php7-xml php7-xmlwriter php7-simplexml php7-mysqli php7-json php7-zlib php7-pdo php7-phar php7-pdo_sqlite php7-pdo_mysql php7-pdo_pgsql && \
    rm -rf /var/cache/apk/*

RUN apk --virtual .doctrine-build --update add git wget curl && \
    cd /opt/ && \
    curl -sS -0L https://getcomposer.org/composer-stable.phar -o /opt/composer.phar && \
    mv /opt/composer.phar /usr/bin/composer && \
    chmod +x /usr/bin/composer && \
    git clone https://github.com/doctrine/migrations.git migrations && \
    cd migrations && \
    git checkout tags/$MIGRATIONS_VERSION && \
    cp ./box.json.dist ./box.json && \
    sh ./build-phar.sh && \
    mv ./build/doctrine-migrations.phar /usr/bin/doctrine-migrations && \
    chmod +x /usr/bin/doctrine-migrations && \
    apk del .doctrine-build && \
    rm -rf /user/bin/composer  && \
    rm -rf /opt/migrations && \
    rm -rf /var/cache/apk/*

RUN mkdir /srv/migrations \
    && mkdir /srv/config \
    && chmod 777 /srv/config

COPY .docker/migrations/config /srv/config

RUN ln -s /srv/config/migrations.php /usr/bin/migrations.php \
    && ln -s /srv/config/migrations-db.php /usr/bin/migrations-db.php

VOLUME ["/srv/migrations"]
WORKDIR /srv/migrations

ENTRYPOINT ["doctrine-migrations"]