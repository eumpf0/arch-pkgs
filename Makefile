.PHONY: all aur pkg repo 

NAME = eumpf

all: aur pkg repo

aur: PKGBUILD
	./makeAur

pkg: PKGBUILD
	makepkg --syncdeps --noconfirm -f --sign
repo:
	repo-add --verify --sign ${NAME}.db.tar.gz $(wildcard *.pkg.tar.zst)

clean:
	rm -rf $(wildcard ${NAME}.* pkg/* src/* local/* *.sig)

clean-all: clean
	rm -rf pkg src local aur $(wildcard *.pkg.tar.zst)
