FROM alpine:3.8

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

RUN set -ex \
    && apk add --update --no-cache \
        ca-certificates python3 python3-dev \
    && pip3 install --upgrade pip setuptools wheel pipenv==2018.10.13 awscli requests nose \
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
