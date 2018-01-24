include ./CONFIG

DEPENDS=
PACKAGE_DIR?=${PWD}

#PKG_TAR=$(VERSION).tar.gz
#PKG_ZIP=/dev/null
PKG_ROOT=1

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
