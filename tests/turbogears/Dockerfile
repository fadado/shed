########################################################################
# Dockerfile for TurboGears 2 apps
########################################################################

FROM shed/turbogears_base:latest

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

# default entry point
ENTRYPOINT [ "/usr/bin/paster", "serve" ]

# install python packages
COPY requeriments.txt /tmp/
RUN /usr/bin/pip freeze > /tmp/freeze-1.txt; \
    /usr/bin/pip install -r /tmp/requeriments.txt

# vim:syntax=dockerfile:ai:sw=4:ts=4:et
