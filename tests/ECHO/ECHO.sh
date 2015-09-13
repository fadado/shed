#!/bin/sh

########################################################################
# ECHO style server (RFC 862)
########################################################################

# response
read MSG
echo "$MSG"

# logs
echo 1>&2 "$(date -Iseconds)	[$MSG]"

exit 0

# vim:syntax=sh:ai:sw=4:ts=4
