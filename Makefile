.PHONY: all aur pkg repo 

NAME = eumpf
PKGDEST = repo

all: aur pkg repo

aur: PKGBUILD
	./makeAur

pkg: PKGBUILD
	makepkg --syncdeps --noconfirm -f --sign
repo:
	repo-add --verify --sign repo/${NAME}.db.tar.gz $(wildcard repo/*.pkg.tar.zst)

clean:
	rm -rf $(wildcard ${NAME}.* pkg/* src/* local/* *.sig *.zst)

clean-all: clean
	rm -rf pkg src local aur $(wildcard *.pkg.tar.zst)
