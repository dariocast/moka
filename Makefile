PREFIX ?= $(HOME)/.local/bin

.PHONY: all install uninstall test

all:
	@chmod +x moka

install: all
	@mkdir -p $(PREFIX)
	ln -sf $(CURDIR)/moka $(PREFIX)/moka
	ln -sf $(CURDIR)/moka $(PREFIX)/caff
	ln -sf $(CURDIR)/moka $(PREFIX)/caffeinate-ui
	@echo "Installato in $(PREFIX)/moka (alias: caff)"

uninstall:
	rm -f $(PREFIX)/moka $(PREFIX)/caff $(PREFIX)/caffeinate-ui
	@echo "Rimosso da $(PREFIX)"

test:
	./moka 1s
