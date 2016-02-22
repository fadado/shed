# Makefile for Gitet slides

.SILENT:

########################################################################
# Macros
########################################################################

SLIDY=pandoc --standalone --to slidy
DZSLIDES=pandoc --standalone --to dzslides

#S5=pandoc --standalone --to s5
#SLIDEOUS=pandoc --standalone --to slideous
#REVEALJS=pandoc --standalone --to revealjs

INCREMENTAL=#--incremental

PANDOC=$(DZSLIDES)

TARGETS=slides-es.html \
	reference-hub.md reference-image.md reference-container.md \
	reference-volume.md

########################################################################
# Rules
########################################################################

all: $(TARGETS)

slides-es.html: slides-es.md
	$(PANDOC) $(INCREMENTAL) $< -o $@

reference-hub.md: ../shed-hub
	./build-ref.sh hub

reference-image.md: ../shed-image
	./build-ref.sh image

reference-container.md: ../shed-container
	./build-ref.sh container

reference-volume.md: ../shed-volume
	./build-ref.sh volume

########################################################################
# Utilities
########################################################################

build: clean all

clean:
	rm -f $(TARGETS)

# vim:ts=8:sw=8:ai
