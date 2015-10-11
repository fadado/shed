########################################################################
# Dockerfile for a Flask & Redis application
########################################################################

FROM centos:7

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

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

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/

RUN /usr/bin/pip freeze > /tmp/freeze-1.txt; \
    /usr/bin/pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT [ "/usr/bin/python" ]

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
