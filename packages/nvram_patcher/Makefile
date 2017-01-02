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

root: nvram_patcher
	cd nvram_patcher ; $(MAKE) iphoneos
	rm -rf root
	mkdir -p root/usr/bin
	cp nvram_patcher/nvram_patcher root/usr/bin/

nvram_patcher:
	git clone https://github.com/realnp/nvram_patcher
	cd nvram_patcher ; git reset --hard 69d4895ee0a0c07beba345607b057b7bb95ba452

EXTRA_CLEAN=custom_clean
.PHONY: $(EXTRA_CLEAN)
$(EXTRA_CLEAN):
	rm -rf nvram_patcher

include ../deb_hand.mak
