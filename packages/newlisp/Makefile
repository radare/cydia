include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

PKG=newlisp-$(VERSION).tgz
URL=http://www.newlisp.org/downloads/$(PKG)

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: $(PKG)
	cd newlisp-$(VERSION) ; $(MAKE) -f makefile_ios CC="xcrun --sdk iphoneos gcc -arch arm64 -arch armv7" prefix=/usr -j4
	rm -rf root
	cd newlisp-$(VERSION) ; $(MAKE) install prefix=$(shell pwd)/root/usr
	cp makefile_ios newlisp-$(VERSION)

$(PKG):
	wget $(URL)
	tar xzf $(PKG)

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf git-$(GIT_VERSION) v$(GIT_VERSION).tar.gz

include ../deb_hand.mak
