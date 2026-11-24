PREFIX ?= $(HOME)/.local/bin

.PHONY: all install uninstall test

all:
	@chmod +x caffeinate-ui

install: all
	@mkdir -p $(PREFIX)
	ln -sf $(CURDIR)/caffeinate-ui $(PREFIX)/caffeinate-ui
	ln -sf $(CURDIR)/caffeinate-ui $(PREFIX)/caff
	@echo "Installato in $(PREFIX)/caffeinate-ui e $(PREFIX)/caff"

uninstall:
	rm -f $(PREFIX)/caffeinate-ui $(PREFIX)/caff
	@echo "Rimosso da $(PREFIX)"

test:
	./caffeinate-ui 1s
