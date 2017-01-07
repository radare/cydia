include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=posixvala
PKG_GIT=https://github.com/radare/posixvala

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd posixvala \
		&& git pull \
		&& $(MAKE) clean \
		&& $(MAKE) CC="$(PKG_CC)" PREFIX=/usr
	rm -rf root
	$(MAKE) -C posixvala install DESTDIR=$(shell pwd)/root PREFIX=/usr

include ../pkg.mk
