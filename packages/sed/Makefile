include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=sed-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.xz
PKG_URL=https://ftp.gnu.org/gnu/sed/$(PKG_TAR)
PKG_SHA=8f9f142bf836caa8b167898d5f0f7f4d96d29d28

all: root
	-rm -rf root/usr/share
	-mv root/usr/bin/sed root/usr/bin/gsed
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	printf "#!/bin/sh\nexit 0\n" > $(PKG_DIR)/build-aux/help2man
	:> $(PKG_DIR)/doc/sed.1
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		./configure --prefix=/usr --host=arm-apple-darwin && \
		$(MAKE) -j12 ; \
		:> doc/sed.1 ; \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
