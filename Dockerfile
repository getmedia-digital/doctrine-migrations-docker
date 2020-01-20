FROM alpine:3.11
MAINTAINER Pavel Janku <pavel@getmedia.digital>

ARG MIGRATIONS_VERSION="2.2.1"
#ARG MIGRATIONS_ARCHIVE="https://github.com/doctrine/migrations/archive/v1.8.1.zip"

# Install doctrine-migation
RUN apk --update add bash php7 php7-ctype php7-iconv php7-dom php7-mbstring php7-tokenizer php7-xml php7-xmlwriter php7-simplexml php7-mysqli php7-json php7-zlib php7-pdo php7-phar php7-pdo_sqlite php7-pdo_mysql php7-pdo_pgsql && \
    rm -rf /var/cache/apk/*

RUN apk --virtual .doctrine-build --update add zip curl && \
    if [ "$MIGRATIONS_ARCHIVE" ] ; then curl -sS -0L $MIGRATIONS_ARCHIVE -o /opt/doctrine-migrations.zip ; else curl -sS -0L https://github.com/doctrine/migrations/archive/$MIGRATIONS_VERSION.zip -o /opt/doctrine-migrations.zip ; fi && \
    cd /opt/ && \
    unzip doctrine-migrations.zip && \
    curl -sS -0L https://getcomposer.org/composer-stable.phar -o /opt/composer.phar && \
    mv /opt/composer.phar /usr/bin/composer && \
    chmod +x /usr/bin/composer && \
    cd migrations-$MIGRATIONS_VERSION && \
    sh ./build-phar.sh && \
    mv ./bin/doctrine-migrations.phar /usr/bin/doctrine-migrations && \
    chmod +x /usr/bin/doctrine-migrations && \
    apk del .doctrine-build && \
    rm -rf /user/bin/composer  && \
    rm -rf /opt/migrations-* && \
    rm -rf /var/cache/apk/*

# Create /data directory and set it as volume then set work dir to /data
RUN mkdir /srv/migrations
VOLUME ["/srv/migrations"]
WORKDIR /srv/migrations

ENTRYPOINT ["doctrine-migrations"]