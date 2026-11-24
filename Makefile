PREFIX ?= $(HOME)/.local/bin

.PHONY: all install uninstall test

all:
	@chmod +x moka

install: all
	@mkdir -p $(PREFIX)
	ln -sf $(CURDIR)/moka $(PREFIX)/moka
	@echo "Installato in $(PREFIX)/moka"

uninstall:
	rm -f $(PREFIX)/moka
	@echo "Rimosso da $(PREFIX)"

test:
	./moka 1s
