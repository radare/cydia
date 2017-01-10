include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_URL=http://gondor.apana.org.au/~herbert/dash/files/dash-$(VERSION).tar.gz
PKG_DIR=$(PACKAGE)-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_SHA=a3ebc16f2e2c7ae8adf64e5e62ae3dcb631717c6

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	rm -rf root
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		./configure --prefix=/usr --bindir=/bin --host=arm-apple-darwin --disable-shared --enable-static && \
		cp -f ../config.h . ; \
		$(MAKE) -j12 LDFLAGS= && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
