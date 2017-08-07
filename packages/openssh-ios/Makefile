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

PFX=/usr/local

pkg-build:
	mkdir -p ${PKG_DIR} root/$(PFX)/bin root/$(PFX)/sbin root/$(PFX)/libexec
	mv ${PKG_DIR}/sshd root/$(PFX)/sbin
	mv ${PKG_DIR}/sftp-server root/$(PFX)/libexec
	mv ${PKG_DIR}/* root/$(PFX)/bin
	chmod +x root/$(PFX)/*/*
	sudo chown -R root root

include ../pkg.mk
