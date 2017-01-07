include ./CONFIG
PACKAGE_DIR?=${PWD}

PKG_VER=2.11.0
PKG_DIR=git-$(PKG_VER)
PKG_FIX=git-noiconv.patch
PKG_TAR=v$(PKG_VER).tar.gz
PKG_URL=https://github.com/git/git/archive/v$(PKG_VER).tar.gz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd git-$(PKG_VER) && \
	$(MAKE) CFLAGS="-DNO_ICONV=1 -UGIT_USE_READLINE" MYLDFLAGS= MYLIBS=-ldl \
		CC="$(PKG_CC)" prefix=/usr NO_ICONV=1 NO_GETTEXT=1 NO_CURL=1 -j4
	rm -rf root
	cd git-$(PKG_VER) && $(MAKE) install prefix=/usr DESTDIR=$(shell pwd)/root PAGER_ENV= LV= NO_ICONV=1 NO_GETTEXT=1 NO_CURL=1

include ../pkg.mk
