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

root: vala-0.34.4
	rm -rf root
	mkdir -p root
	cd vala-0.34.4 ; \
		export CC="xcrun --sdk iphoneos gcc -arch armv7" ; \
		export PKG_CONFIG_PATH="$(shell pwd)/../glib/root/usr/lib/pkgconfig" ; \
		export CFLAGS="-I$(shell pwd)/../glib/root/usr/include/glib-2.0" ; \
		export CFLAGS="-I$(shell pwd)/../glib/root/usr/lib/glib-2.0/include/ $$CFLAGS" ; \
		export LDFLAGS="-L$(shell pwd)/../glib/root/usr/lib/" ; \
		./configure --host=arm-apple-darwin --prefix=/usr ; $(MAKE) -j4 ; \
		$(MAKE) install DESTDIR=$(shell pwd)/root

vala-0.34.4:
	wget -c http://download.gnome.org/sources/vala/0.34/vala-0.34.4.tar.xz
	tar xjvf vala-0.34.4.tar.xz

include ../deb_hand.mak
