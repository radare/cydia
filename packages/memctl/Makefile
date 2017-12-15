include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=pen
PKG_GIT=https://github.com/UlricE/pen

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd pen && aclocal ; autoconf ; automake --add-missing
	export CC="$(PKG_CC)" ; cd pen ; \
		./configure --host=$(PKG_HOST) --prefix=/usr \
		&& $(MAKE) -j4
	cd pen && $(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
