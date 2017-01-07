include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_GIT=https://github.com/nobled/xz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build: xz/configure
	cd xz && \
		export CC="$(PKG_CC)" ; \
		./configure --host=arm-apple-darwin --prefix=/usr && \
		$(MAKE) -j4 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

xz/configure:
	export PATH=/usr/local/Cellar/gettext/0.19.8.1/bin/:$$PATH ; \
	cd xz && aclocal ; autoconf ; automake --add-missing ; autoreconf -fvi

include ../pkg.mk
