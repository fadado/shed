########################################################################
# Makefile (experimental)
########################################################################

SHELL=/bin/bash

.SILENT:
.PHONY: all build builder clean

all: builder

build.log: . base/ common/ server/ database/
	rm -f build*.log
	(shed-hub build --remove | tee build.log) 3>&1 1>&2 2>&3 | tee build-err.log
	-[[ -s build-err.log ]] && echo 'Errors detected while building: see build-err.log'
	#shed-hub build --remove |& tee build.log
 
builder: build.log
 
clean:
	rm -f build.log
 
build: clean builder
 
# vim:ai:sw=8:ts=8:syntax=make
