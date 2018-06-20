include ./CONFIG

DEPENDS=
PKG_ROOT=1
PACKAGE_DIR?=${PWD}

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

leftover:
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

pkg-build:
	git clone https://github.com/xerub/ldid ldid2
	cd ldid2 ; rm -f *.o ; \
	xcrun --sdk iphoneos gcc -I. -arch arm64 *.c -c ; \
	xcrun --sdk iphoneos g++ -I. -o ldid2 -arch arm64 ldid2.cpp -Os *.o
	rm -rf root
	mkdir -p root/usr/bin
	cp -f ldid2/ldid2 root/usr/bin/ldid2

include ../pkg.mk
