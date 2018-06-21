include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_URL=http://gondor.apana.org.au/~herbert/dash/files/dash-$(VERSION).tar.gz
PKG_DIR=$(PACKAGE)-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_SHA=bcfe37148a26bf1a222660cf4b4f6c6b64e4c94c

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	rm -rf root
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		export CPP="/usr/bin/cpp" ; \
		./configure --prefix=/usr --bindir=/bin --host=arm-apple-darwin --disable-shared --enable-static && \
		export CPP="$(PKG_CPP)" ; \
		cp -f ../config.h . ; \
		$(MAKE) -j12 LDFLAGS= && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
