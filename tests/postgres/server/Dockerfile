########################################################################
# Dockerfile for Postgres server
########################################################################

FROM shed/postgres_common

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# If necessary...
#RUN adduser --home /var/lib/pgsql --gid 26 --uid 26 --create-home --skel /etc/skel --comment 'PostgreSQL Server'

# postgres server packages
RUN yum --quiet --assumeyes install \
    postgresql-server \
    ; \
    yum --quiet clean all

# environment for user postgres
ENV HOME=/var/lib/pgsql \
    PGPORT=5432 \
    PGDATA=/var/lib/pgsql/data

EXPOSE ${PGPORT}

# initialization as user root
COPY patch-install.sh ${HOME}/

RUN ${HOME}/patch-install.sh

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
