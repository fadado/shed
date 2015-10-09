########################################################################
# Makefile for supervised example
########################################################################

SHELL=/bin/bash

.SILENT:
.PHONY: all builder build clean clobber

all: worker builder

# require: sudo yum install glibc-static
worker: worker.c
	gcc -static worker.c -o worker
	@strip worker

build.log: .
	rm -f build*.log
	(shed-hub build --remove | tee build.log) 3>&1 1>&2 2>&3 | tee build-err.log
	-[[ -s build-err.log ]] && echo 'Errors detected while building: see build-err.log'
	#shed-hub build --remove |& tee build.log
 
builder: build.log

clean:
	rm -f worker build*.log

build: clean all

# vim:ai:sw=8:ts=8:noet:syntax=make
