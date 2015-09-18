########################################################################
# Dockerfile for Postgres database
########################################################################

FROM shed/postgres_server

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# initialization as user postgres
USER postgres

#?ENV HOME=/var/lib/pgsql \
#?    PGPORT=5432 \
#?    PGDATA=/var/lib/pgsql/data

WORKDIR ${HOME}

RUN cp --verbose /etc/skel/.[^.]* ./

COPY pwfile.txt \
     patch-initdb.sh \
     startdb.sh \
     ${HOME}/

# starter script
ENTRYPOINT [ "./startdb.sh" ]

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
