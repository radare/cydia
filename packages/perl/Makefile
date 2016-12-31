include ./CONFIG
BROKEN=1
# cannot crosscompile perl yet..

DEPENDS=
PACKAGE_DIR?=${PWD}

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

URL=http://www.cpan.org/src/5.0/perl-5.24.0.tar.gz

CC=xcrun --sdk iphoneos gcc -arch arm64 -arch armv7
root: perl-$(VERSION).tar.gz
	cd perl-$(VERSION) ; CC="$(CC)" ; \
	./Configure -Dhost=arm-apple-darwin -Dprefix=/usr -Dcc="$(CC)" -Dsysroot ; \
	$(MAKE) CC="$(CC)" prefix=/usr -j4 
	rm -rf root
	cd perl-$(VERSION) ; $(MAKE) install prefix=/usr DESTDIR=$(shell pwd)/root PAGER_ENV= LV= NO_ICONV=1 NO_GETTEXT=1 NO_CURL=1

perl-$(VERSION).tar.gz:
	wget $(URL)
	tar xzf perl-$(VERSION).tar.gz

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf perl-$(VERSION) v$(VERSION).tar.gz


include ../deb_hand.mak
