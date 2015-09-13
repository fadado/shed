#!/bin/bash

# Run a daemon in a supervised context

########################################################################
# Parameters to customize
########################################################################

# Program to run, with arguments
readonly WORKER=(./worker)     # example C or sh version

# How many times restart program?
# -1 to restart always, > 0 to limit retries
typeset -i Retries=-1

# Signals to forward or ignore
readonly FORWARD=(USR1 USR2 HUP TERM INT QUIT)
readonly IGNORE=(TSTP)

# see also at the end of the script 'Cases to customize'

########################################################################
# Handlers
########################################################################

typeset -i Signaled=0 WPid= Status= Delay=1000

msg() { echo 1>&2 "S:"$'\t'"$@"; }

forward() {
    # $1: signal to forward

    Signaled=1

    echo 1>&2 "S:"$'\t'"forwarding $1"
    kill -s $1 $WPid
}

for signal in ${FORWARD[@]}; do
    trap "forward $signal" $signal
done

for signal in ${IGNORE[@]}; do
    trap '' $signal
done

########################################################################
# Command to run
########################################################################

# arguments are passed to WORKER
readonly ARGS=("$@")

StartWorker() {
    case $Retries in
        0)  msg "no more retries"
            exit -1
            ;;
        -1) # ignore
            ;;
        *)  Retries=$(( Retries - 1 ))
            ;;
    esac

    $WORKER "${ARGS[@]}" &
    WPid=$!

    # milliseconds to wait (not implemented)
    #?sleep "$(( Delay % 1000 )).$(( Delay / 1000 ))"
    #?Delay=$(( Delay * 2 ))
}

########################################################################
# Main
########################################################################

set -o monitor
set -o noglob

msg "PID $$"

StartWorker

while true
do
    Signaled=0

    wait $WPid
    # ...here is asyncronously called the handler if signaled
    Status=$?

    if (( Signaled )); then
        msg "signaled with status $Status (continue)"
        continue
    fi

    if [[ -n $(ps -p $WPid -o pid=) ]]; then
        msg "unexpected job $WPid running"
        exit -1
    fi

    #
    # Worker exited
    #
    case $Status in
        # Fatal situations
        -1|128)
            msg "unexpected status $Status"
            exit $Status
            ;;
        126)
            msg "not executable"
            exit $Status
            ;;
        127)
            msg "not found"
            exit $Status
            ;;

########################################################################
# Cases to customize
########################################################################

        # desired exit with success 
        0)
            msg "exit success"
            exit $Status
            ;;

        # desired exit with failure
        3)
            msg "exit failure $Status"
            exit $Status
            ;;

        # not desired exit (expected cases)
        1|2)
            msg "exit failure $Status (restart)"
            StartWorker
            ;;

        *)  # not desired exit (unexpected cases)
            if (( Status < 126 )); then
                msg "exit failure $Status (restart)"
                StartWorker

            # not desired exit (unhandled signal)
            else
                msg "exit due to signal $(kill -l $Status) (restart)"
                StartWorker
            fi
    esac
done

# vim:syntax=sh:ai:sw=4:ts=4:et:
