FROM debian:bookworm-slim

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        curl \
        dirmngr \
        fonts-noto-cjk \
        gnupg \
        libssl-dev \
        node-less \
        npm \
        python3-num2words \
        python3-pdfminer \
        python3-pip \
        python3-phonenumbers \
        python3-pyldap \
        python3-qrcode \
        python3-renderpm \
        python3-setuptools \
        python3-slugify \
        python3-vobject \
        python3-watchdog \
        python3-xlrd \
        python3-xlwt \
        python3-venv \
        xz-utils \
        python-dev-is-python3 \
        python3-dev \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        libsasl2-dev \
        libldap2-dev \
        build-essential \
        libssl-dev \
        libffi-dev \
        libjpeg-dev \
        libpq-dev \
        liblcms2-dev \
        libblas-dev \
        libatlas-base-dev \
    && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_amd64.deb \
    && apt-get install -y --no-install-recommends ./wkhtmltox.deb \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb

# install latest postgresql-client
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
    && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
    && gpg --batch --armor --export "${repokey}" > /etc/apt/trusted.gpg.d/pgdg.gpg.asc \
    && gpgconf --kill all \
    && rm -rf "$GNUPGHOME" \
    && apt-get update  \
    && apt-get install --no-install-recommends -y postgresql-client \
    && rm -f /etc/apt/sources.list.d/pgdg.list \
    && rm -rf /var/lib/apt/lists/*

# Install rtlcss (on Debian buster)
RUN npm install -g rtlcss

# Fix "error: externally-managed-environment"
RUN python3 -m pip config set global.break-system-packages true

# Create Odoo User
ARG ODOO_USER_ID=1000
RUN groupadd -g "$ODOO_USER_ID" odoo && \
     useradd -u "$ODOO_USER_ID" -g odoo -m -d /opt/odoo -r -s /bin/bash odoo

# Create folders to install Odoo
RUN mkdir /etc/odoo && mkdir /var/lib/odoo && mkdir /var/log/odoo && \
    chown odoo:odoo /etc/odoo && chown odoo:odoo /var/lib/odoo && chown odoo:odoo /var/log/odoo && \
    mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

COPY ./entrypoint.sh /
COPY ./scripts /scripts
COPY --chown=odoo:odoo ./odoo.conf /tmp/odoo.conf

COPY ./requirements.txt .
RUN pip3 install -r requirements.txt --ignore-installed && rm requirements.txt

# Expose Odoo services
EXPOSE 8069 8071 8072

ENV ODOO_VERSION 16.0
ENV ODOO_RC /etc/odoo/odoo.conf

COPY wait-for-psql.py /usr/local/bin/wait-for-psql.py

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
