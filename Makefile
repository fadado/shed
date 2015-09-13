########################################################################
# Makefile to manage tools installations
########################################################################

.SILENT:
.PHONY: all install uninstall

INSTALL = install --verbose --compare --mode 555

TOOLS = shed-hub shed-image shed-container

install:
	$(INSTALL) $(TOOLS) ~/bin
	sudo $(INSTALL) $(TOOLS) /usr/local/bin

uninstall:
	( cd ~/bin && rm -f $(TOOLS) )
	( cd /usr/local/bin && sudo rm -f $(TOOLS) )
