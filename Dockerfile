FROM python:3.7-alpine3.8

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
        npm \
        ruby \
        ruby-bundler \
        ruby-dev \
        ruby-irb \
        ruby-json \
        ruby-rdoc \
        zlib-dev \
        # Pillow dependencies
        jpeg-dev \
        freetype-dev \
        lcms2-dev \
        openjpeg-dev \
        tiff-dev \
        tk-dev \
        tcl-dev \
        harfbuzz-dev \
        fribidi-dev

RUN set -ex \
    && pip3 install --upgrade pip setuptools wheel pipenv==2018.10.13 docker-compose awscli boto3 heroku3 requests requests-mock nose Jinja2 Markdown \
    && wget https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py -O get-poetry.py \
    && python get-poetry.py \
    && ln -s /root/.poetry/bin/poetry /usr/local/bin \
    && ln -s /root/.poetry/lib/poetry /usr/local/lib \
    && rm -r /root/.cache

ENV PIPELINES_HELPER .bitbucket-pipelines/bitbucket-pipelines-helper.py

CMD ["/bin/sh"]
