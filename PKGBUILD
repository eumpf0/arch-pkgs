# Maintainer: Elias Rumpf <e.rumpf@gmx.de>

pkgbase='eumpf'
pkgname=(
   eumpf-kernel
   eumpf-firmware

   eumpf-machine-desktop
   eumpf-machine-surface
   eumpf-machine-framework

   eumpf-extras
   eumpf-extras-desktop

   eumpf-config
   eumpf-config-desktop
   eumpf-config-surface
   eumpf-config-framework

   eumpf-base
   eumpf-gnome
   eumpf-hyprland
   eumpf-gui
   eumpf-cli

   eumpf-initramfs
   eumpf-pipewire
   eumpf-gstreamer
   eumpf-flatpak
   eumpf-pandoc
   eumpf-latex

   eumpf-vm
)

pkgver=1
pkgrel=4

pkgdesc="my arch metapackages & config"
arch=('any')
url="https://github.com/eumpf0/arch-pkgs"
license=('MIT')

package_eumpf-kernel() {
   groups=(
      eumpf-desktop
      eumpf-framework
   )
   depends=(
      linux
      linux-headers
   )
}

package_eumpf-firmware() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )
   depends=(
      linux-firmware
      intel-ucode
      mesa
   )
}

package_eumpf-machine-surface() {
   groups=(eumpf-surface)
   provides=(
      eumpf-machine
      eumpf-kernel
      eumpf-graphics
   )
   conflicts=(
      eumpf-machine-desktop
      eumpf-machine-framework
   )
   depends=(
      eumpf-firmware
      #
      linux-surface
      linux-surface-headers

      linux-firmware-marvell
      iptsd

      intel-media-driver
      vulkan-intel
   )
}

package_eumpf-machine-framework() {
   groups=(eumpf-framework)
   provides=(
      eumpf-machine
      eumpf-graphics
   )
   conflicts=(
      eumpf-machine-desktop
      eumpf-machine-surface
   )
   depends=(
      eumpf-kernel
      eumpf-firmware
      #
      intel-media-driver
      vulkan-intel
   )
}

package_eumpf-machine-desktop() {
   groups=(eumpf-desktop)
   provides=(
      eumpf-machine
      eumpf-graphics
   )
   conflicts=(
      eumpf-machine-surface
      eumpf-machine-framework
   )
   depends=(
      eumpf-kernel
      eumpf-firmware
      #
      libva-mesa-driver
      mesa-vdpau
      vulkan-radeon
   )
}

package_eumpf-initramfs() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )
   provides=(
      initramfs
   )
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
      eumpf-surface
      eumpf-framework
   )
   depends=(
      eumpf-machine
      #
      base
      base-devel
      pacman-contrib
      dkms
      kernel-modules-hook
      
      gcc
      clang
      git
      meson
      tree
      less
      man-db
      man-pages
      texinfo

      libsecret
      libfido2
      tpm2-tools
      e2fsprogs
      exfatprogs
      btrfs-progs
      networkmanager

      sbsigntools
      efibootmgr
      efitools

      reflector

      zsh
      tmux
      neovim
      python-pynvim

      yay # aur
   )
   install=eumpf-base.install
}

package_eumpf-gnome() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )
   provides=(eumpf-desktop-environment)
   depends=(
      eumpf-gui
      #
      gnome-shell
      gdm
      xdg-desktop-portal-gnome
      gnome-control-center
      gnome-system-monitor
      gnome-disk-utility
      gnome-calendar
      gnome-tweaks
      gdm-settings # aur
      gradience-git # aur
   )
   install=eumpf-gnome.install # install flatpaks (calendar, calculator etc) & my gradience theme
}

package_eumpf-hyprland() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )
   provides=(eumpf-desktop-environment)
   depends=(
      eumpf-gui
      #
      hyprland
      hyprpaper
      xdg-desktop-portal-hyprland
      waybar-hyprland-git # aur
      rofi-lbonn-wayland-git # aur
      awesome-terminal-fonts
      dunst
      brightnessctl
      swaylock
      swayidle
   )
}

package_eumpf-gui() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )
   depends=(
      eumpf-base
      eumpf-graphics
      eumpf-pipewire
      eumpf-desktop-environment
      #
      qt5-wayland
      qt6-wayland
      gtk4
      gtk3
      wl-clipboard

      adw-gtk-theme # aur
      nautilus
      gnome-software

      eumpf-flatpak

      xdg-user-dirs-gtk
      xdg-terminal-exec-git # aur

      firefox
      zathura-pdf-mupdf
      alacritty
   )
   install=eumpf-gui.install # install flatpaks (obs, discord etc)
}

package_eumpf-extras() {
   groups=(
      eumpf-surface
      eumpf-framework
      eumpf-desktop
   )
   depends=(eumpf-gui)
   optdepends=(
      gimp
      freecad
      dolphin-emu
      qucs-s # aur
   )
}

package_eumpf-extras-desktop() {
   groups=(eumpf-desktop)
   depends=(
      eumpf-gui
      #
      freecad
      gimp
      dolphin-emu
      ddcutil
   )
}

package_eumpf-config() {
   groups=(
      eumpf-surface
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
      eumpf-config-surface
      eumpf-config-framework
   )
   install=eumpf-config-desktop.install
}

package_eumpf-config-surface() {
   groups=(eumpf-surface)
   depends=(eumpf-config)
   conflicts=(
      eumpf-config-desktop
      eumpf-config-framework
   )
   install=eumpf-config-surface.install
}

package_eumpf-config-framework() {
   groups=(eumpf-framework)
   depends=(eumpf-config)
   conflicts=(
      eumpf-config-desktop
      eumpf-config-surface
   )
   install=eumpf-config-framework.install
}

package_eumpf-cli() {
   groups=(
      eumpf-desktop
      eumpf-surface
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
      calcurse
      aerc
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
      qemu-ui-spice-core
      qemu-audio-spice
      qemu-ui-gtk
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
      pandoc-bin # aur
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
      pipewire-jack
   )
}

package_eumpf-gstreamer() {
   groups=(eumpf-replacements)
   replaces=(gstreamer)
   depends=(
      eumpf-base
      #
      gstreamer
      gstreamer-vaapi
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
