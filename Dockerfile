ARG BASE_IMAGE_VERSION

FROM python:${BASE_IMAGE_VERSION}

ARG POETRY_VERSION

RUN set -ex \
    && apk add --update --no-cache \
        bash \
        build-base \
        git \
        docker-cli \
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
        wget \
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
    && pip3 install --upgrade setuptools wheel docker-compose awscli boto3 click heroku3 requests requests-mock nose Jinja2 Markdown \
    && wget https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py -O get-poetry.py \
    && python get-poetry.py \
    && rm get-poetry.py \
    && ln -s ~/.poetry/bin/poetry /usr/local/bin \
    && ln -s ~/.poetry/lib/poetry /usr/local/lib \
    && rm -r ~/.cache

ENV PIPELINES_HELPER .bitbucket-pipelines/bitbucket-pipelines-helper.py
ENV ACTIONS_HELPER .github/actions-helper/actions-helper.py

RUN set -ex \
    && mkdir -p /root/.ssh \
    && ssh-keyscan -H bitbucket.org >> /root/.ssh/known_hosts \
    && ssh-keyscan -H github.com >> /root/.ssh/known_hosts

CMD ["/bin/sh"]
