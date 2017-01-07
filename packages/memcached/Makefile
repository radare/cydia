include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=$(PACKAGE)-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_URL=https://www.memcached.org/files/$(PKG_TAR)

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

# TODO: Force  ac_cv_c_endian=little

pkg-build:
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC) -w" ; \
		export CXX="$(PKG_CXX)" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --with-libevent=../../libevent/root/usr && \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
