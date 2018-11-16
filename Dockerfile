FROM python:3.7-alpine3.8

RUN set -ex \
    && pip3 install --upgrade pip setuptools wheel pipenv==2018.10.13 awscli requests nose heroku3 \
    && rm -r /root/.cache

RUN set -ex \
    && apk add --update --no-cache \
        build-base \
        git \
        libc-dev \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        linux-headers \
        musl-dev \
        openssh-client \
        pcre-dev \
        postgresql-dev \
        rsync \
        ruby \
        ruby-bundler \
        ruby-dev \
        ruby-irb \
        ruby-json \
        ruby-rdoc \
        zlib-dev

CMD ["/bin/sh"]
