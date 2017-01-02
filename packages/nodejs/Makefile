include ./CONFIG
DEPENDS=
PACKAGE_DIR?=${PWD}

NODEVER=7.3.0
NODETGZ=node-v$(NODEVER).tar.gz
NODEURL=https://nodejs.org/dist/v$(NODEVER)/$(NODETGZ)

all: root
	sudo rm -rf control data
	${MAKE} clean
	mkdir -p data
	cp -rf root/* data
	${MAKE} control
	${MAKE} deb

NODECPU=arm64


root: node-v$(VERSION)
	export CC="xcrun --sdk iphoneos gcc -arch $(NODECPU)" ; \
	export CXX="xcrun --sdk iphoneos g++ -arch $(NODECPU) -std=c++11" ; \
		cd node-v$(VERSION) ; \
		cp -f deps/cares/config/darwin/ares_config.h deps/cares/src/ares_config.h ; \
		./configure --dest-cpu=arm64 --dest-os=iphoneos --prefix=/usr --openssl-no-asm --without-v8-platform --without-inspector --without-intl ; \
		$(MAKE) -j 4
	rm -rf root
	mkdir -p root
	cd node-v$(VERSION) ; $(MAKE) install DESTDIR=$(shell pwd)/root PREFIX=/usr

node-v$(VERSION): $(NODETGZ)
	tar xzvf $(NODETGZ)
	cd node-v$(VERSION) ; patch -p0 < ../nodejs-iphoneos.patch

$(NODETGZ):
	wget -c $(NODEURL)

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf nodejs-v$(VERSION) nodejs-v$(VERSION).tar.gz

include ../deb_hand.mak
