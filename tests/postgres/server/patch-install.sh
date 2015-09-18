#!/bin/bash

FILE=/usr/bin/postgresql-setup

sed --in-place=.bak --file - <<\PATCH $FILE
1a\
# START OF PATCH\
\
function systemctl {\
	echo Environment=PGPORT=5432 PGDATA=/var/lib/pgsql/data\
}\
\
function su { eval "$4"; }\
function runuser { eval "$4"; }\
\
# END OF PATCH
PATCH

# vim:ts=4:sw=4:ai:et
