include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_URL=https://github.com/radare/sdb/archive/$(VERSION).tar.gz
PKG_DIR=$(PACKAGE)-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.gz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd sdb-$(VERSION) ; \
		$(MAKE) -j4 HAVE_VALA= CC="$(PKG_CC)" ; \
		$(MAKE) install DESTDIR=$(shell pwd)/root HAVE_VALA=

include ../pkg.mk
