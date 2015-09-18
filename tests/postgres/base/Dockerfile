########################################################################
# Dockerfile for centos:7 based images
########################################################################

FROM centos:7

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# add some tools
RUN yum --quiet --assumeyes update; \
    yum --quiet --assumeyes install \
    vim-enhanced \
    mc \
    ; \
    yum --quiet clean all

# disable password for root
RUN echo 'root:' | chpasswd

# default
ENTRYPOINT [ "/bin/bash" ]

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
