include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKGNAM=libtool-2.4.6
URLTAR=http://ftp.rediris.es/mirror/GNU/gnu/libtool/$(PKGNAM).tar.xz

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: $(PKGNAM)
	cd $(PKGNAM); \
	export CC="xcrun --sdk iphoneos gcc -arch armv7" ; \
	./configure --host=arm-apple-darwin --prefix=/usr ; \
	$(MAKE) -j4; $(MAKE) install DESTDIR=$(shell pwd)/root

$(PKGNAM):
	wget -c $(URLTAR)
	tar xjvf $(PKGNAM).tar.xz

include ../deb_hand.mak
