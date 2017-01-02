include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: acr
	rm -rf root
	mkdir -p root
	cd acr ; ./configure --prefix ; $(MAKE) ; $(MAKE) install DESTDIR=$(shell pwd)/root

acr:
	git clone https://github.com/radare/acr

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf ired-$(VERSION) $(VERSION).tar.gz

include ../deb_hand.mak
