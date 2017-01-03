include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

all:
#	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
#	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

include ../deb_hand.mak
