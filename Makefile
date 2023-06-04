.PHONY: all aur pkg repo 

NAME = eumpf
KEY = 9BFCE70D33E2D346B665B4A61176C0858E22117D

all: aur pkg repo

aur: PKGBUILD
	./makeAur ${KEY}

pkg: PKGBUILD
	makepkg --syncdeps --noconfirm -f --sign --key ${KEY}
repo:
	repo-add --verify --sign ${NAME}.db.tar.gz $(wildcard *.pkg.tar.zst) --key ${KEY}

clean:
	rm -rf $(wildcard ${NAME}.* pkg/* src/* local/* *.sig)

clean-all: clean
	rm -rf pkg src local aur $(wildcard *.pkg.tar.zst)
