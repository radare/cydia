include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

LIBFFI_VER=3.2.1
LIBFFI_DIR=libffi-$(LIBFFI_VER)

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
	rm -rf root/usr/lib/pkgconfig
	rm -rf root/usr/lib/*.a
	rm -rf root/usr/include
	$(MAKE) all PACKAGE=$(PACKAGE)_thin

root.tar.gz: root
	tar czvf root.tar.gz root

DEVEL_PKG=1

root: $(LIBFFI_DIR)
	rm -rf root _root
	mkdir -p root
	cd $(LIBFFI_DIR) ; export CC="xcrun --sdk iphoneos gcc -arch armv7" ; \
		./configure --prefix=/usr --host=arm-apple-darwin ; \
		$(MAKE) ; $(MAKE) install DESTDIR=$(shell pwd)/root
ifeq ($(DEVEL_PKG),1)
	:
else
	rm -rf _root
	mv root _root
	mkdir -p root/usr/lib
	cp _root/usr/lib/libffi.6.dylib root/usr/lib
#	cd root/usr/lib ; ln -fs libffi.6.dylib libffi.dylib
endif

$(LIBFFI_DIR):
	wget -c ftp://sourceware.org/pub/libffi/libffi-$(LIBFFI_VER).tar.gz
	tar xzvf libffi-$(LIBFFI_VER).tar.gz

#EXTRA_CLEAN=custom_clean
#.PHONY: $(EXTRA_CLEAN)
#$(EXTRA_CLEAN):
#	rm -rf libffi-$(LIBFFI_VER)*

include ../deb_hand.mak
