include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

LUA_VERSION=$(shell echo $(VERSION) | sed -e s,\\.,-,g)

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: v$(LUA_VERSION).tar.gz
	tar xzvf v$(LUA_VERSION).tar.gz
	cd lua-$(LUA_VERSION) ; $(MAKE) clean; $(MAKE) CFLAGS="-ULUA_USE_READLINE" MYLDFLAGS= MYLIBS=-ldl CC="xcrun --sdk iphoneos gcc -arch arm64 -arch armv7" PREFIX=/usr
	rm -rf root
	mkdir -p root/usr/bin
	cp lua-$(LUA_VERSION)/lua $(shell pwd)/root/usr/bin/lua

v$(LUA_VERSION).tar.gz:
	wget https://github.com/lua/lua/archive/v$(LUA_VERSION).tar.gz

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf lua-$(LUA_VERSION) v$(LUA_VERSION).tar.gz

include ../deb_hand.mak
