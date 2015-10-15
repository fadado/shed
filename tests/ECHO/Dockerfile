########################################################################
# Dockerfile for provider container example
########################################################################

FROM busybox

MAINTAINER Joan Ordinas <jordinas@escoladeltreball.org>

COPY ECHO.sh /home/ECHO.sh

ENTRYPOINT [ "nc", "-ll", "-p", "7", "-e", "/home/ECHO.sh" ]

EXPOSE 7

# vim:syntax=dockerfile:ai:sw=4:ts=4
