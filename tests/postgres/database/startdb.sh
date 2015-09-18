#!/bin/bash

function start {
	export TZ='Europe/Andorra'
	export PGCLIENTENCODING='UTF8'

	echo Starting PostgreSQL
	exec /usr/bin/postgres -D $PGDATA -p $PGPORT -h \*

	echo 2>&1 'Failed postgres exec'
	exit 1	# never reached!
}

if [[ -f $PGDATA/PG_VERSION && -d $PGDATA/base ]]; then
	start
fi

#else must init

export PGSETUP_INITDB_OPTIONS=''
PGSETUP_INITDB_OPTIONS+=" --auth-local=trust"
PGSETUP_INITDB_OPTIONS+=" --auth-host=md5"
PGSETUP_INITDB_OPTIONS+=" --encoding=UTF8"
PGSETUP_INITDB_OPTIONS+=" --locale=ca_ES"
PGSETUP_INITDB_OPTIONS+=" --pgdata='$PGDATA'"
PGSETUP_INITDB_OPTIONS+=" --username=postgres"
PGSETUP_INITDB_OPTIONS+=" --pwfile=pwfile.txt"

/usr/bin/postgresql-setup initdb

export -n PGSETUP_INITDB_OPTIONS

# patch conf & hba...
echo Patching config files for PostgreSQL
./patch-initdb.sh

# load data if exists
if [[ -e database.sql.gz ]]; then
	echo Loading data
	pg_ctl -w --timeout 5 -D $PGDATA start
	gunzip -c database.sql.gz | psql -f - postgres
	pg_ctl -D $PGDATA stop
fi

# exit if in build time
[[ $1 == 'BUILD-TIME' ]] && exit

# run postgres
start

# vim:ts=4:sw=4:ai:et
