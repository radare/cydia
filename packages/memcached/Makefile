include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=$(PACKAGE)-$(VERSION)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_URL=https://www.memcached.org/files/$(PKG_TAR)
PKG_SHA=8db4363728edfce6c665c181f2237c7ea8ba3ea8
PKG_DEP=libevent

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

# TODO: Force  ac_cv_c_endian=little

LIBEVENT_INCDIR=$(shell pwd)/../libevent/root/usr/include
LIBEVENT_LIBDIR=$(shell pwd)/../libevent/root/usr/lib

pkg-build:
	cd $(PKG_DIR) && \
		export CXX="$(PKG_CXX)" ; \
		export CPP="$(PKG_CPP)" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --with-libevent=../../libevent/root/usr && \
		$(MAKE) -j12 CC="$(PKG_CC)" CFLAGS="-w -I$(LIBEVENT_INCDIR) -UMEMCACHED_DEBUG -L$(LIBEVENT_LIBDIR)" && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
