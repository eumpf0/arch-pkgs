.PHONY: all pkg repo clean

NAME = eumpf

all: pkg repo

pkg: PKGBUILD
	makepkg -c

repo:
	repo-add ${NAME}.db.tar.gz $(wildcard *.pkg.tar.zst)

clean:
	rm -rf *.pkg.tar.zst *.tar.gz ${NAME}.files ${NAME}.db
