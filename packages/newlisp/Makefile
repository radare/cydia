include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_URL=http://www.newlisp.org/downloads/$(PKG_TAR)
PKG_FIX=patch-system.diff
PKG_SHA=706fd8af9eb22e19a6f662a2a18fcbba083721db
PKG_DIR=newlisp-$(VERSION)
PKG_TAR=$(PKG_DIR).tgz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cp makefile_ios newlisp-$(VERSION)
	cd newlisp-$(VERSION) && $(MAKE) -f makefile_ios CC="$(PKG_CC)" prefix=/usr -j4
	rm -rf root
	mkdir -p root/usr/bin
	cd newlisp-$(VERSION) && $(MAKE) install prefix=$(shell pwd)/root/usr

include ../pkg.mk
