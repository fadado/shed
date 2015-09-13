########################################################################
# Dockerfile for supervised service
########################################################################

FROM centos:7

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

WORKDIR /home

COPY worker worker.sh supervisor.sh /home/

ENTRYPOINT [ "./supervisor.sh" ]
CMD [ "10" ]

# vim:syntax=dockerfile:ai:sw=4:ts=4
