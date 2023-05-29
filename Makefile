.PHONY: all aur pkg repo 

NAME = eumpf

all: aur pkg repo

aur: PKGBUILD
	./makeAur

pkg: PKGBUILD
	makepkg --syncdeps --noconfirm -f --sign --key="2A3D071AFD68A456C327CCA50B249431A401A55F"

repo:
	repo-add --verify --sign --key "testkey.sec" ${NAME}.db.tar.gz $(wildcard *.pkg.tar.zst)

clean:
	rm -rf $(wildcard ${NAME}.* pkg/* src/* local/* *.sig)

clean-all: clean
	rm -rf pkg src local aur $(wildcard *.pkg.tar.zst)
