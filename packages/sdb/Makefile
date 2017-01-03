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
	rm -rf root/usr/share
	rm -rf root/usr/bin
	rm -rf root/usr/lib/*.dylib
	rm -rf root/usr/include
	$(MAKE) all PACKAGE=$(PACKAGE)_thin

root.tar.gz: root
	tar czvf root.tar.gz root

root: sdb-0.11.0
	cd sdb-0.11.0 ; \
		export CC="xcrun --sdk iphoneos gcc -arch arm64" ; \
		$(MAKE) -j4 HAVE_VALA= ; \
		$(MAKE) install DESTDIR=$(shell pwd)/root HAVE_VALA=

sdb-0.11.0:
	wget -c https://github.com/radare/sdb/archive/0.11.0.tar.gz
	tar xzvf 0.11.0.tar.gz

include ../deb_hand.mak
