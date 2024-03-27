PKGDEST := ../arch-repo
export PKGDEST

all: PKGBUILD
	makepkg --syncdeps --sign

.PHONY: force
force: PKGBUILD
	makepkg --syncdeps --force --sign
