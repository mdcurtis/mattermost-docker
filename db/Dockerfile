FROM postgres:13

ENV DEFAULT_TIMEZONE UTC

# Install some packages to use WAL
RUN echo "azure<5.0.0" > pip-constraints.txt
RUN  apt-get update \
  && apt-get install -y \
      build-essential \
      curl \
      libffi-dev \
      python3-dev \
      python3-pip \
      python3-cryptography \
      pv \
  && pip3 install --upgrade pip \
  && pip3 install --upgrade wheel \
  && pip3 --no-cache-dir install -c pip-constraints.txt 'wal-e<1.0.0' envdir

# Add wale script
COPY setup-wale.sh /docker-entrypoint-initdb.d/

#Healthcheck to make sure container is ready
HEALTHCHECK CMD pg_isready -U $POSTGRES_USER -d $POSTGRES_DB || exit 1

# Add and configure entrypoint and command
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]

VOLUME ["/var/run/postgresql", "/usr/share/postgresql/", "/var/lib/postgresql/data", "/tmp", "/etc/wal-e.d/env"]
