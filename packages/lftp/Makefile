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

thin: root.tar.gz
	rm -rf root
	tar xzf root.tar.gz
	mkdir -p root/usr/bin
	mv root/usr/lib/gettext/* root/usr/bin
	rm -rf root/usr/lib
	rm -rf root/usr/share
	rm -rf root/usr/bin
	rm -rf root/usr/lib/pkgconfig
	rm -rf root/usr/lib/gettext
	rm -rf root/usr/include
	rm -rf root/usr/lib/*.a
	rm -rf root/usr/lib/gio
	rm -rf root/usr/lib/glib-2.0
	$(MAKE) all PACKAGE=$(PACKAGE)_thin

root.tar.gz: root
	tar czvf root.tar.gz root

root: lftp-4.7.5
	rm -rf root
	mkdir -p root
	cd lftp-4.7.5 && \
		export CFLAGS=-I$(shell pwd)/../readline/root/usr/include ; \
		export LDFLAGS=-L$(shell pwd)/../readline/root/usr/lib ; \
		export CFLAGS="-I$(shell pwd)/../ncurses/root/usr/include $$CFLAGS" ; \
		export LDFLAGS="-L$(shell pwd)/../ncurses/root/usr/lib $$LDFLAGS" ; \
		export CFLAGS="-I$(shell pwd)/../zlib/root/usr/include $$CFLAGS" ; \
		export LDFLAGS="$(shell pwd)/../zlib/root/usr/lib/libz.a $$LDFLAGS" ; \
		export CXXFLAGS="$$CFLAGS" ; \
		export CC="xcrun --sdk iphoneos gcc -arch armv7" ; \
		export CXX="xcrun --sdk iphoneos g++ -arch armv7" ; \
		sh
	./configure --prefix=/usr --host=arm-apple-darwin --without-zlib \
		--without-gnutls --disable-ipv6 && \
		$(MAKE) -j12 ; \
		$(MAKE) install DESTDIR=$(shell pwd)/root

lftp-4.7.5:
	wget -c http://lftp.yar.ru/ftp/lftp-4.7.5.tar.xz
	tar xjvf lftp-4.7.5.tar.xz

include ../deb_hand.mak
