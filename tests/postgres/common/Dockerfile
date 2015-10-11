########################################################################
# Dockerfile for Postgres client and server images
########################################################################

FROM shed/postgres_base

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# messages in english
ENV TZ=Europe/Andorra \
    LANG=en_US.UTF-8

# enable several locales
RUN localedef --quiet --inputfile /usr/share/i18n/locales/ca_ES@euro ca_ES.utf8; \
    localedef --quiet --inputfile /usr/share/i18n/locales/es_ES@euro es_ES.utf8;

# all in catalan except messages in english
#    LC_CTYPE=en_US.UTF-8 \
#    LC_NUMERIC=ca_ES.UTF-8 \
#    LC_TIME=ca_ES.UTF-8 \
#    LC_COLLATE=ca_ES.UTF-8 \
#    LC_MONETARY=ca_ES.UTF-8 \
#    LC_MESSAGES=en_US.UTF-8 \
#    LC_PAPER=ca_ES.UTF-8 \
#    LC_NAME=ca_ES.UTF-8 \
#    LC_ADDRESS=ca_ES.UTF-8 \
#    LC_TELEPHONE=ca_ES.UTF-8 \
#    LC_MEASUREMENT=ca_ES.UTF-8 \
#    LC_IDENTIFICATION=ca_ES.UTF-8 \
#    LC_ALL=

# postgres common packages
RUN yum --quiet --assumeyes install \
        postgresql-libs \
        postgresql \
        ; \
    yum --quiet clean all

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
