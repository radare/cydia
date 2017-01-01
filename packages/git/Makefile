include ./CONFIG
PACKAGE_DIR?=${PWD}

GIT_VERSION=$(VERSION)
all: root
	sudo rm -rf control data
	cd root ; tar czvf ../root.tar.gz *
	mkdir -p root.tmp data
	tar xzvf root.tar.gz -C root.tmp
	mv root.tmp/* data
	rm -rf root.tmp
	${MAKE} control
	${MAKE} deb

root: v$(GIT_VERSION).tar.gz
	cd git-$(GIT_VERSION) ; \
	$(MAKE) CFLAGS="-DNO_ICONV=1 -UGIT_USE_READLINE" MYLDFLAGS= MYLIBS=-ldl \
	CC="xcrun --sdk iphoneos gcc -arch armv7" prefix=/usr \
	NO_ICONV=1 NO_GETTEXT=1 NO_CURL=1 -j4
	rm -rf root
	cd git-$(GIT_VERSION) ; $(MAKE) install prefix=/usr DESTDIR=$(shell pwd)/root PAGER_ENV= LV= NO_ICONV=1 NO_GETTEXT=1 NO_CURL=1

v$(GIT_VERSION).tar.gz:
	wget https://github.com/git/git/archive/v$(GIT_VERSION).tar.gz
	tar xzf v$(GIT_VERSION).tar.gz
	cd git-$(GIT_VERSION) ; patch -p0 < ../git-noiconv.patch

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf git-$(GIT_VERSION) v$(GIT_VERSION).tar.gz

include ../deb_hand.mak
