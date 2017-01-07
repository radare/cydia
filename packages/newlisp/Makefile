include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_TAR=newlisp-$(VERSION).tgz
PKG_URL=http://www.newlisp.org/downloads/$(PKG_TAR)
PKG_SHA=8c256d134e4879d97f83087585cfe90d462def22

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
