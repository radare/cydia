include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}
PKG_ROOT=1

#PKG_URL=https://github.com/radare/sdb/archive/$(VERSION).tar.gz
#PKG_DIR=$(PACKAGE)-$(VERSION)
#PKG_TAR=$(PKG_DIR).tar.gz

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	mkdir -p tmp root/usr/bin
	mkdir -p root/usr/share/man/man1
	wget -O tmp/jtool.tar http://www.newosxbook.com/tools/jtool.tar
	cd tmp ; tar xvf jtool.tar
	cp tmp/jtool root/usr/bin
	cp tmp/jtool.1 root/usr/share/man/man1

include ../pkg.mk
