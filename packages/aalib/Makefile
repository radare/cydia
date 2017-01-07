include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_VER=1.4rc5
PKG_DIR=aalib-1.4.0
PKG_TAR=$(PKG_DIR).tar.gz
URL_TAR=aalib-$(PKG_VER).tar.gz
PKG_URL=http://pkgs.fedoraproject.org/repo/pkgs/aalib/$(URL_TAR)/9801095c42bba12edebd1902bcf0a990/$(URL_TAR)
PKG_DEP=ncurses
PKG_SHA=a23269e950a249d2ef93625837cace45ddbce03b

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

thin: root
	$(MAKE) root-thin
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

#CFGOPTS=--enable-static --disable-shared
CFGOPTS=--enable-shared --disable-static

pkg-build: $(PKG_DEP) $(PKG_DIR)/src/malloc.h
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		export CFLAGS="$$CFLAGS -I ../../ncurses/root/usr/include" ; \
		./configure --prefix=/usr --host=arm-apple-darwin $(CFGOPTS) --with-ncurses=$(shell pwd)/../ncurses/root/usr && \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

$(PKG_DIR)/src/malloc.h:
	:> $(PKG_DIR)/src/malloc.h

include ../pkg.mk
