include ./CONFIG
PACKAGE_DIR?=${PWD}

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: dumpdecrypted
	rm -rf root
	mkdir -p root
	cd dumpdecrypted; $(MAKE) ; $(MAKE) install DESTDIR=$(shell pwd)/root

dumpdecrypted:
	git clone https://github.com/radare/dumpdecrypted

include ../deb_hand.mak
