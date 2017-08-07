include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

PKG_DIR=openssh-ios-$(VERSION)
PKG_TAR=$(VERSION).tar.gz
PKG_ZIP=https://github.com/dweinstein/openssh-ios/releases/download/v7.5/openssh-arm64-v7.5.zip

all: root
	$(MAKE) root-strip
	$(MAKE) root-sign
	$(MAKE) root-mkdeb

pkg-build:
	mkdir -p ${PKG_DIR} \
	mkdir -p root/usr/bin root/usr/sbin
	mv ${PKG_DIR}/sshd root/usr/sbin
	mv ${PKG_DIR}/sftp-server root/usr/sbin
	mv ${PKG_DIR}/* root/usr/bin
	chmod +x root/usr/*/*
	sudo chown -R root root

include ../pkg.mk
