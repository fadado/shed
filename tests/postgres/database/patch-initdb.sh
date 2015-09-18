#!/bin/bash

########################################################################
# pg_hba.conf
########################################################################

FILE=/var/lib/pgsql/data/pg_hba.conf

sed --in-place=.bak --file - <<\PATCH $FILE
1i\
# START OF PATCH\
# TYPE  DATABASE    USER       METHOD\
#local  all         all        trust\
local   all         all        peer map=admin\
local   all         all        md5\
# TYPE  DATABASE    USER       ADDRESS          METHOD\
host    all         all        127.0.0.0/8      trust\
host    all         all        0.0.0.0/0        md5\
# END OF PATCH
PATCH

########################################################################
# postgresql.conf
########################################################################

FILE=/var/lib/pgsql/data/postgresql.conf

sed --in-place=.bak --file - <<\PATCH $FILE
s/^#\s*listen_addresses\s*=.*#/listen_addresses = '*' #/
PATCH

########################################################################
# pg_ident.conf
########################################################################

FILE=/var/lib/pgsql/data/pg_ident.conf

sed --in-place=.bak --file - <<\PATCH $FILE
$a\
# START OF PATCH\
# MAPNAME       SYSTEM-USERNAME         PG-USERNAME\
admin           postgres                postgres\
admin           root                    postgres\
# END OF PATCH
PATCH

# vim:ts=4:sw=4:ai:et
