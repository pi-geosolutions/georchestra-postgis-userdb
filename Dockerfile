#
# Dockerfile for the geOrchestra Users
#
FROM postgis/postgis:15-3.4

MAINTAINER Jean Pommier "jean.pommier@pigeosolutions.fr"

ENV DEBIAN_FRONTEND=noninteractive \
    POSTGRES_USER=georchestra

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gettext-base \
        postgresql-plpython3-15 && \
    rm -rf /var/lib/apt/lists/*

COPY pg_hba.conf.tpl /pg_templates/
COPY --chown=postgres sql/[0-9][0-9]*  license.txt /docker-entrypoint-initdb.d/

ENV LDAP_SERVER=ldap \
    LDAP_BASEDN="dc=georchestra,dc=org" \
    PGTUNE_FOLDER="/cm/pgtune"

HEALTHCHECK --interval=30s --timeout=30s \
  CMD pg_isready -U $POSTGRES_USER
