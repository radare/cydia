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

root: libplist
	rm -rf root
	mkdir -p root
	cd libplist && \
		:> config.h.in ; \
		aclocal ; glibtoolize ; autoconf -f ; automake -af ; \
		export CXXFLAGS="$$CFLAGS" ; \
		export CC="xcrun --sdk iphoneos gcc -arch arm64 -miphoneos-version-min=7.1" ; \
		export CXX="xcrun --sdk iphoneos g++ -arch arm64 -miphoneos-version-min=7.1" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --without-zlib \
		--without-gnutls --disable-ipv6 --without-cython && \
		$(MAKE) -j12 ; \
		$(MAKE) install DESTDIR=$(shell pwd)/root

libplist:
	git clone https://github.com/libimobiledevice/libplist

include ../deb_hand.mak
