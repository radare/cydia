include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_VER=7.0
PKG_DIR=readline-$(PKG_VER)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_URL=https://ftp.gnu.org/gnu/readline/$(PKG_TAR)

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	rm -rf root
	cd readline-7.0 && \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --disable-shared --enable-static && \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
