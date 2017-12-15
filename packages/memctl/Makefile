include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}
PKG_DIR=$(PACKAGE_DIR)

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

include ../pkg.mk
