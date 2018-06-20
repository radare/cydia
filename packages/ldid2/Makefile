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

root: ldid
	rm -rf root
	mkdir -p root/usr/bin
	cp -f ldid/ldid2 root/usr/bin/ldid2

ldid:
	git clone https://github.com/xerub/ldid
	cd ldid ; rm -f *.o ; \
	xcrun --sdk iphoneos gcc -I. -arch arm64 *.c -c ; \
	xcrun --sdk iphoneos g++ -I. -o ldid2 -arch arm64 ldid2.cpp -Os *.o

include ../deb_hand.mak
