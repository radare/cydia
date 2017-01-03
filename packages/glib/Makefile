include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

GLIB_VER=2.51
GLIB_DIR=glib-$(GLIB_VER).0

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

thin:
	rm -rf root
	tar xzf root.tar.gz
	rm -rf root/usr/share
	rm -rf root/usr/bin
	rm -rf root/usr/lib/pkgconfig
	rm -rf root/usr/include
	rm -rf root/usr/lib/gio
	rm -rf root/usr/lib/glib-2.0
	$(MAKE) all PACKAGE=$(PACKAGE)_thin

root: $(GLIB_DIR)
	rm -rf root
	mkdir -p root
	cp -f glib-autoconf.cache $(GLIB_DIR)/glib-autoconf.cache
	cd $(GLIB_DIR) ; export CC="xcrun --sdk iphoneos gcc -arch armv7" ; \
		export PKG_CONFIG_PATH="$(shell pwd)/../libffi/root/usr/lib/pkgconfig" ; \
		export PKG_CONFIG_PATH="$(shell pwd)/../gettext/root/usr/lib/pkgconfig:$${PKG_CONFIG_PATH}" ; \
		export CFLAGS="-I$(shell pwd)/../libffi/root/usr/include" ; \
		export CFLAGS="-I$(shell pwd)/../libffi//data/usr/lib/libffi-3.2.1/include/ $$CFLAGS" ; \
		export LDFLAGS="-L$(shell pwd)/../libffi/root/usr/lib" ; \
		export CFLAGS="-I$(shell pwd)/../gettext/root/usr/include $$CFLAGS" ; \
		export LDFLAGS="-L$(shell pwd)/../gettext/root/usr/lib $$LDFLAGS" ; \
		./configure --prefix=/usr --host=arm-apple-darwin --disable-dependency-tracking \
		--cache-file=glib-autoconf.cache --disable-libelf && \
		$(MAKE) -j12 && $(MAKE) install DESTDIR=$(shell pwd)/root
	tar czvf root.tar.gz root

$(GLIB_DIR): ../libffi/root
	wget -c https://ftp.gnome.org/pub/gnome/sources/glib/$(GLIB_VER)/glib-$(GLIB_VER).0.tar.xz
	tar xjvf glib-$(GLIB_VER).0.tar.xz

../libffi/root:
	$(MAKE) -C ../libffi

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	:

#	rm -rf glib-$(VERSION) $(VERSION).tar.gz

include ../deb_hand.mak
