########################################################################
# Dockerfile common to all apps
########################################################################

FROM centos:7

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# messages in english, assume xterm-like terminal...
ENV TZ=Europe/Andorra \
    LANG=en_US.UTF-8 \
    TERM=xterm-256color

# enable several locales
RUN localedef --quiet --inputfile /usr/share/i18n/locales/ca_ES@euro ca_ES.utf8; \
    localedef --quiet --inputfile /usr/share/i18n/locales/es_ES@euro es_ES.utf8;

# disable password for root
RUN echo 'root:' | chpasswd

# enable delta RPMs and add EPEL
RUN yum --assumeyes install deltarpm; \
    yum --quiet --assumeyes update; \
    yum --assumeyes install \
        epel-release \
        ; \
    yum clean all

# add apps specific packages
RUN yum --assumeyes install \
        python-pip \
        ; \
    yum clean all

# all apps listen to this port
EXPOSE 8080

# Not necessary, but...
RUN [ "mkdir", "/app" ]
WORKDIR /app

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
