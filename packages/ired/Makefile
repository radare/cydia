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

root: $(VERSION).tar.gz
	tar xzvf $(VERSION).tar.gz
	cd ired-$(VERSION) ; $(MAKE) clean; $(MAKE) CC="xcrun --sdk iphoneos gcc -arch arm64" PREFIX=/usr
	rm -rf root
	mkdir -p root
	cd ired-$(VERSION) ; $(MAKE) install DESTDIR=$(shell pwd)/root PREFIX=/usr

$(VERSION).tar.gz:
	wget https://github.com/radare/ired/archive/$(VERSION).tar.gz

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf ired-$(VERSION) $(VERSION).tar.gz

include ../deb_hand.mak
