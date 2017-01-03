include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

root: posixvala
	cd posixvala ; git pull ; $(MAKE) clean; $(MAKE) CC="xcrun --sdk iphoneos gcc -arch arm64" PREFIX=/usr
	rm -rf root
	mkdir -p root
	$(MAKE) -C posixvala install DESTDIR=$(shell pwd)/root PREFIX=/usr

posixvala:
	git clone https://github.com/radare/posixvala

include ../deb_hand.mak
