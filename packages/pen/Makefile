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

pen:
	git clone https://github.com/UlricE/pen

root: pen
	cd pen ; aclocal ; autoconf ; automake --add-missing
	export CC="xcrun --sdk iphoneos gcc -arch arm64" ; cd pen ; \
	./configure --host=iphoneos-arm-darwin --prefix=/usr ; $(MAKE) -j4
	cd pen ; $(MAKE) install DESTDIR=$(shell pwd)/root
	
EXTRA_CLEAN=myclean
$(EXTRA_CLEAN):
	rm -rf pen

include ../deb_hand.mak
