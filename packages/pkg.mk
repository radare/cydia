PKG_DIR?=$(PACKAGE)
PKG_VER?=$(VERSION)

root-mkdeb:
	-sudo chown -R $(shell whoami) data
	rm -rf control data
	cd root && tar czvf ../root.tar.gz *
	mkdir -p data
	cd data && tar xzvf ../root.tar.gz
	-sudo chown -R root data/*
	${MAKE} control
	${MAKE} deb

root-strip:
	@echo Stripping binaries
	@for a in $(shell find root -perm 0755 -type f) ; do \
		sudo xcrun --sdk iphoneos strip $$a ; \
	done || true

ENT=$(shell pwd)/../ent.xml

root-sign:
	@echo Signing binaries
	find root -perm 0755 -type f
	@for a in $(shell find root -perm 0755 -type f) ; do \
		echo "[CODESIGN] $$a" ; \
		sudo ldid2 -S${ENT} $$a ; \
	done || true

# remove all extra
root-thin:
	-mv root/usr/lib/gettext/* root/usr/bin
	rm -rf root/usr/share
	rm -rf root/usr/lib/pkgconfig
	rm -rf root/usr/lib/gettext
	rm -rf root/usr/include
	rm -rf root/usr/lib/*.a
	rm -rf root/usr/lib/*.la
	rm -rf root/usr/lib/gio
	rm -rf root/usr/lib/glib-2.0
	rm -rf root/usr/man
	rm -rf root/usr/bin/aalib-config
	rm -rf root/usr/info
#$(MAKE) all PACKAGE=$(PACKAGE)_thin

$(PKG_DEP):
	@echo Verifying dependency $@
	[ -d ../$@/root ] || $(MAKE) -C ../$@/root

root: $(PKG_DIR)
	[ -d root ] || $(MAKE) pkg-build

root.tar.gz: root
	tar czf root.tar.gz root

REALSHA=$(shell sha1sum $(PKG_TAR) | cut -d ' ' -f 1)

ifneq ($(PKG_URL),)
$(PKG_DIR): $(PKG_TAR)
ifneq ($(PKG_SHA),)
	@echo Verifying checksum
	[ "${REALSHA}" = "$(PKG_SHA)" ]
endif
	tar xzvf $(PKG_TAR)
	cd $(PKG_DIR) && for a in $(PKG_FIX) ; do patch -p0 < ../$$a ; done

$(PKG_TAR):
	wget -O "$(PKG_TAR)" -c "$(PKG_URL)"
else
ifneq ($(PKG_GIT),)
$(PKG_DIR):
	git clone $(PKG_GIT) $(PKG_DIR)
else
ifneq ($(PKG_ZIP),)
$(PKG_DIR):
	wget -O "$(PKG_TAR)" -c "$(PKG_ZIP)"
	mkdir -p $(PKG_DIR)
	cd $(PKG_DIR) && unzip ../$(PKG_TAR)
else
ifeq ($(PKG_ROOT),)
$(PKG_DIR):
	@echo git maybe?
	false
else
$(PKG_DIR):
endif
endif
endif
endif

PKG_HOST=iphoneos-arm-darwin
#PKG_CC_FLAGS=-arch armv7 -miphoneos-version-min=7.1
#PKG_CC_FLAGS=-arch armv7 -arch arm64 -miphoneos-version-min=7.1
PKG_CC_FLAGS=-arch armv7 -arch arm64 -miphoneos-version-min=8.0
PKG_CC=xcrun --sdk iphoneos gcc $(PKG_CC_FLAGS)
#PKG_CPP=xcrun --sdk iphoneos cpp
PKG_CPP=/usr/bin/cpp
PKG_CXX=xcrun --sdk iphoneos g++ $(PKG_CC_FLAGS)

WHOAMI=$(shell whoami)

PKG_CLEAN=pkg-clean
$(PKG_CLEAN):
	-sudo chown -R $(WHOAMI) data

.PHONY: $(PKG_CLEAN)

include ../deb_hand.mak
