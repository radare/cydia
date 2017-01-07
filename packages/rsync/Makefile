include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_VER=$(VERSION)
PKG_DIR=rsync-$(PKG_VER)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_URL=https://download.samba.org/pub/rsync/src/$(PKG_TAR)

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	rm -rf root
	cd rsync-3.1.2 && \
		export CC="$(PKG_CC)" \
		; export CXX="$(PKG_CXX)" \
		&& ./configure --prefix=/usr --host=arm-apple-darwin \
		&& $(MAKE) -j12 \
		&& $(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
