########################################################################
# Makefile for supervised example
########################################################################

.SILENT:
.PHONY: all builder build clean clobber

all: worker builder

# require: sudo yum install glibc-static
worker: worker.c
	gcc -static worker.c -o worker
	@strip worker

build.log: .
	shed-hub build --remove |& tee build.log
 
builder: build.log

clean:
	@rm -f worker build.log

build: clean all

#
