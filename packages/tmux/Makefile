include ./CONFIG
PACKAGE_DIR?=${PWD}

PKG_VER=2.7
PKG_DIR=tmux-$(PKG_VER)
PKG_TAR=$(PKG_DIR).tar.gz
PKG_URL=https://github.com/tmux/tmux/releases/download/$(PKG_VER)/$(PKG_TAR)
PKG_DEP=ncurses libevent

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	cd $(PKG_DIR) && \
		export CPP="/usr/bin/cpp" ; \
		export CC="$(PKG_CC)" ; \
		export CXX="$(PKG_CXX)" ; \
		export CFLAGS="-I$(shell pwd)/../ncurses/root/usr/include -I$(shell pwd)/../libevent/root/usr/include" ; \
		export LDFLAGS="$(shell pwd)/../ncurses/root/usr/lib/libncurses.a -I$(shell pwd)/../libevent/root/usr/lib/libevent.a" ; \
		./configure --prefix=/usr --host=armv7-apple-darwin17.6.0 && \
		$(MAKE) -j12 && \
		$(MAKE) install DESTDIR=$(shell pwd)/root

include ../pkg.mk
