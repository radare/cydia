include ./CONFIG
DEPENDS=
PKG_ROOT=1
PACKAGE_DIR?=${PWD}

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

pkg-build: ldid
	rm -rf root
	mkdir -p root/usr/bin
	cp -f ldid/ldid2 root/usr/bin/ldid2
	$(MAKE) root-sign

ldid:
	git clone https://github.com/xerub/ldid
	cd ldid ; rm -f *.o ; \
	xcrun --sdk iphoneos gcc -I. -arch arm64 *.c -c ; \
	xcrun --sdk iphoneos g++ -I. -o ldid2 -arch arm64 ldid2.cpp -Os *.o

include ../pkg.mk
