include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=libevent-$(PKG_VER)
PKG_VER=$(VERSION)-stable
PKG_TAR=libevent-$(PKG_VER).tar.gz
PKG_URL=https://github.com/libevent/libevent/releases/download/release-$(PKG_VER)/$(PKG_TAR)

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd $(PKG_DIR) && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		export CPP="$(PKG_CPP)" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --enable-static --disable-shared && \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
