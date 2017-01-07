root-mkdeb:
	-sudo chown -R $(shell whoami) data
	rm -rf control data
	cd root && tar czvf ../root.tar.gz *
	mkdir -p data
	cd data && tar xzvf ../root.tar.gz
	-sudo chown -R root data/*
	${MAKE} control
	${MAKE} deb

root-strip:
	@echo Stripping binaries
	@for a in $(shell find root -perm 0755 -type f) ; do \
		xcrun --sdk iphoneos strip $$a ; \
	done || true

root-sign:
	@echo Stripping binaries
	@for a in $(shell find root -perm 0755 -type f) ; do \
		xcrun --sdk iphoneos codesign -s- $$a ; \
	done || true

root: $(PKG_TAR)
	$(MAKE) pkg-build

ifneq ($(PKG_URL),)
$(PKG_TAR):
	wget -O "$(PKG_TAR)" -c "$(PKG_URL)"
	tar xzvf $(PKG_TAR)
else
	@echo git maybe?
endif

PKG_CC_FLAGS=-arch armv7 -arch arm64 -miphoneos-version-min=7.1
PKG_CC=xcrun --sdk iphoneos gcc $(PKG_CC_FLAGS)
PKG_CXX=xcrun --sdk iphoneos g++ $(PKG_CC_FLAGS)

PKG_CLEAN=pkg-clean
$(PKG_CLEAN):
	sudo chown -R pancake data

.PHONY: $(PKG_CLEAN)

include ../deb_hand.mak
