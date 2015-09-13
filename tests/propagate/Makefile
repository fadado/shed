########################################################################
# Makefile (experimental)
########################################################################

.SILENT:
.PHONY: all build clean clobber

all: build

build.log: .
	shed-hub build --remove |& tee build.log
 
build: build.log
 
clean:
	rm -f build.log
 
clobber: clean build
 
#
