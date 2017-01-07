include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=ired-$(VERSION)
PKG_TAR=$(VERSION).tar.gz
PKG_URL=https://github.com/radare/ired/archive/$(PKG_TAR)

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd $(PKG_DIR) \
	&& $(MAKE) clean \
	&& $(MAKE) CC="$(PKG_CC)" PREFIX=/usr \
	&& $(MAKE) install DESTDIR=$(shell pwd)/root PREFIX=/usr

include ../pkg.mk
