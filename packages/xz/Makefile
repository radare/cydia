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

root: xz/configure
	cd xz ; export CC="xcrun --sdk iphoneos gcc -arch armv7 -arch arm64" ; \
	make -j4; make install DESTDIR=$(shell pwd)/root

xz/configure:
	export PATH=/usr/local/Cellar/gettext/0.19.8.1/bin/:$$PATH ; \
	cd xz ; aclocal ; autoconf ; automake --add-missing ; autoreconf -fvi
	cd xz ; export CC="xcrun --sdk iphoneos gcc -arch armv7 -arch arm64" \
		./configure --host=arm-apple-darwin --prefix=/usr

xz:
	git clone https://github.com/nobled/xz

include ../deb_hand.mak
