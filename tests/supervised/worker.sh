#!/bin/bash

# Simulates a service than randomly dies or exits
#
# Exit values:
# 	0	Exit success
# 	1	Exit failure
# 	2	Exit failure
# 	3	Catched SIGQUIT
# 	130	Catched and re-raised SIGINT

########################################################################
# Handlers
########################################################################

# Utilities
function msg {
	echo 1>&2 "W:"$'\t'"$@"
}

#
# Continuing signals
#

function trap_USR1 {
	msg "trapped USR1 and continue"
	# do something...
}

function trap_USR2 {
	msg "trapped USR2 and continue"
	# do something...
}

function trap_HUP {
	msg "trapped HUP and continue"
	# reload config...
}

#
# Ending signals
#

function trap_TERM {
	msg "trapped TERM and exit"
	# cleanup...
	exit 0
}

function trap_INT {
	msg "trapped INT and kill itself again"
	# cleanup...
	trap - INT		# reset default handler
	kill -s INT $$	# signal again
}

function trap_QUIT {
	msg "trapped QUIT and exit abnormally"
	exit 3
}

# Install handlers
for signal in USR1 USR2 HUP TERM INT QUIT; do
	trap trap_$signal $signal
done

########################################################################
# Main
########################################################################

declare -i status
declare time=${1:-10}	# seconds to work

msg "PID $$"

# Simulate a server doing some work for a while
msg "start work..."
sleep $time & while true; do
	wait %%
	status=$?
	(( status <= 128 )) && break	# sleep exited
	[[ -z $(jobs) ]] && break		# sleep received a signal
	msg "more work to do..."
done

# Exit randomly
declare -i chance=6
if (( RANDOM % chance != 0 )); then
	msg "exit abnormally"
	exit $(( 1 + RANDOM % 2 ))	# 1..2
else
	msg "exit normally"
	exit 0
fi

# vim:syntax=sh:ai:sw=4:ts=4
