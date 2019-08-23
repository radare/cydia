include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

V=3290000
PKG_URL=https://www.sqlite.org/2019/sqlite-autoconf-$(V).tar.gz
PKG_DIR=sqlite-autoconf-$(V)
PKG_TAR=$(PKG_DIR).tar.gz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd sqlite-autoconf-$(V) ; \
		./configure --disable-readline --disable-editline --disable-shared --disable-static --prefix=/usr && \
		export LIBTOOL="xcrun --sdk iphoneos libtool" && \
		export CC="$(PKG_CC) -DSQLITE_NOHAVE_SYSTEM=1" && \
		$(MAKE) -j4 CC="$(PKG_CC) -DSQLITE_NOHAVE_SYSTEM=1"
	mkdir -p root/usr/bin
	cp -f sqlite-autoconf-$(V)/sqlite3 root/usr/bin

include ../pkg.mk
