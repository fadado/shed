########################################################################
# Makefile to manage tools installations
########################################################################

# define PREFIX as you like
PREFIX=/usr/local

.SILENT:
.PHONY: all install uninstall test

INSTALL = install --verbose --compare --mode 555

TOOLS = shed-hub shed-image shed-container shed-volume shed-network
CONFIG = shed.conf

install:
	$(INSTALL) $(TOOLS) ~/bin
	sudo $(INSTALL) $(TOOLS) $(PREFIX)/bin
	sudo $(INSTALL) $(CONFIG) $(PREFIX)/etc

uninstall:
	( cd ~/bin && rm -f $(TOOLS) )
	( cd $(PREFIX)/bin && sudo rm -f $(TOOLS) )
	( cd $(PREFIX)/etc && sudo rm -f $(CONFIG) )

test:
	bash -n shed-hub
	bash -n shed-image
	bash -n shed-container
	bash -n shed-volume
	bash -n shed-network
	bash -n shed.conf
	bash -n docs/container.shed
	bash -n docs/Shedfile
	bash -n docs/build-ref.sh
