# Maintainer: Elias Rumpf <e.rumpf@gmx.de>

pkgbase='eumpf'
pkgname=(
    eumpf-machine-base
    eumpf-machine-desktop
    eumpf-machine-framework

    eumpf-extras
    eumpf-extras-desktop
    eumpf-extras-framework

    eumpf-config
    eumpf-config-desktop
    eumpf-config-framework

    eumpf-base
    eumpf-hyprland
    eumpf-gui
    eumpf-cli

    eumpf-initramfs
    eumpf-pipewire
    eumpf-flatpak
    eumpf-pandoc
    eumpf-latex
    eumpf-vm
)

pkgver=2
pkgrel=3

pkgdesc="my arch metapackages & config"
arch=('any')
url="https://github.com/eumpf0/arch-pkgs"
license=('MIT')

package_eumpf-machine-base() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    depends=(
        linux-eumpf
        linux-eumpf-headers
        linux-firmware
        intel-ucode
        mesa
    )
}

package_eumpf-machine-framework() {
    groups=(eumpf-framework)
    provides=(eumpf-machine)
    conflicts=(
        eumpf-machine-desktop
    )
    depends=(
        eumpf-machine-base
        #
        intel-media-driver
        libvdpau-va-gl
        vulkan-intel
    )
}

package_eumpf-machine-desktop() {
    groups=(eumpf-desktop)
    provides=(eumpf-machine)
    conflicts=(
        eumpf-machine-framework
    )
    depends=(
        eumpf-machine-base
        #
        libva-mesa-driver
        mesa-vdpau
        vulkan-radeon
    )
}

package_eumpf-initramfs() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    provides=(initramfs)
    conflicts=(
        mkinitcpio
        booster
    )
    depends=(
        eumpf-machine
        #
        dracut
    )
}

package_eumpf-base() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    depends=(
        eumpf-machine
        #
        base
        dkms
        kernel-modules-hook

        base-devel
        devtools
        clang
        meson
        tree
        less
        man-db
        man-pages

        libsecret
        libfido2
        tpm2-tools
        tpm2-abrmd
        e2fsprogs
        exfatprogs
        btrfs-progs
        networkmanager

        sbsigntools
        efibootmgr
        efitools

        pacman-contrib
        reflector

        zsh
        zsh-completions
        tmux
        neovim
        python-pynvim

        npm

        bluez
        alsa-utils

        yay # aur
    )
    install=eumpf-base.install
}

package_eumpf-hyprland() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    provides=(eumpf-desktop-environment)
    depends=(
        eumpf-gui
        #
        hyprland
        hyprpaper
        xdg-desktop-portal-hyprland
        waybar
        wofi
        dunst
        brightnessctl
        swaylock-effects-git # aur
        swayidle
        blueman
    )
}

package_eumpf-gui() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    depends=(
        eumpf-base
        eumpf-pipewire
        eumpf-desktop-environment
        #
        qt5-wayland
        qt6-wayland
        kvantum
        gtk3
        gtk4
        wl-clipboard

        ttf-fantasque-nerd
        ttf-firacode-nerd
        ttf-victor-mono-nerd
        otf-firamono-nerd

        kvantum-theme-nordic-git # aur
        adw-gtk-theme # aur

        v4l2loopback-dkms

        eumpf-flatpak
        xdg-user-dirs-gtk
    )
}

package_eumpf-extras() {
    groups=(
        eumpf-framework
        eumpf-desktop
    )
    depends=(
        eumpf-gui
        #
        alacritty
        firefox
        zathura-pdf-mupdf
        nautilus
        gvfs-mtp
        gnome-software
    )
}

package_eumpf-extras-desktop() {
    groups=(eumpf-desktop)
    conflicts=(eumpf-extras-framework)
    depends=(
        eumpf-base
        #
        ddcutil
    )
}

package_eumpf-extras-framework() {
    groups=(eumpf-framework)
    conflicts=(eumpf-extras-desktop)
    depends=(
        eumpf-extras
        #
        brightnessctl
    )
}

package_eumpf-config() {
    groups=(
        eumpf-framework
        eumpf-desktop
    )
    depends=(eumpf-base)
    install=eumpf-config.install
}

package_eumpf-config-desktop() {
    groups=(eumpf-desktop)
    depends=(eumpf-config)
    conflicts=(
        eumpf-config-framework
    )
    install=eumpf-config-desktop.install
}

package_eumpf-config-framework() {
    groups=(eumpf-framework)
    depends=(eumpf-config)
    conflicts=(
        eumpf-config-desktop
    )
    install=eumpf-config-framework.install
}

package_eumpf-cli() {
    groups=(
        eumpf-desktop
        eumpf-framework
    )
    depends=(
        eumpf-base
        #
        eumpf-pandoc
        eumpf-latex
        micromamba-bin # aur
        pdftk
        bluez-utils
        aerc
        khal
        nvtop
        btop
        android-tools
    )
}

package_eumpf-vm() {
    groups=(eumpf-desktop)
    depends=(
        eumpf-gui
        #
        libvirt
        qemu-system-x86
        qemu-img
        qemu-audio-pipewire
        qemu-hw-usb-host
        swtpm
        looking-glass # aur
        looking-glass-module-dkms # aur
        obs-plugin-looking-glass # aur
    )
}

package_eumpf-pandoc() {
    groups=(eumpf-replacements)
    replaces=(pandoc)
    depends=(
        eumpf-base
        #
        eumpf-latex
        pandoc-eumpf
    )
    install=eumpf-pandoc.install # install lua filters
}

package_eumpf-latex() {
    groups=(eumpf-replacements)
    replaces=(texlive-bin)
    depends=(
        eumpf-base
        #
        texlive-luatex
        texlive-binextra
        texlive-latexrecommended
        texlive-mathscience
    )
}

package_eumpf-pipewire() {
    groups=(eumpf-replacements)
    replaces=(pipewire)
    depends=(
        eumpf-base
        #
        pipewire
        wireplumber
        pipewire-alsa
        pipewire-pulse
    )
}

package_eumpf-flatpak() {
    groups=(eumpf-replacements)
    replaces=(flatpak)
    depends=(
        eumpf-base
        #
        flatpak
    )
    install=eumpf-flatpak.install
}
