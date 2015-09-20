########################################################################
# Makefile (experimental)
########################################################################

.SILENT:
.PHONY: all build builder clean

all: builder

build.log: . 
	shed-hub build --remove |& tee build.log
 
builder: build.log
 
clean:
	rm -f build.log
 
build: clean builder
 
#
