# Maintainer: Elias Rumpf <e.rumpf@gmx.de>

pkgbase='eumpf'
pkgname=(
   eumpf-kernel
   eumpf-firmware

   eumpf-machine-desktop
   eumpf-machine-surface
   eumpf-machine-framework

   eumpf-desktop-extras
   eumpf-laptop-extras

   eumpf-config
   eumpf-config-desktop
   eumpf-config-surface
   eumpf-config-framework

   eumpf-base
   eumpf-gnome
   eumpf-gui
   eumpf-cli

   eumpf-initramfs
   eumpf-pipewire
   eumpf-gstreamer
   eumpf-flatpak
   eumpf-pandoc

   eumpf-vm
)

pkgver=1
pkgrel=1

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
   
   depends=(eumpf-firmware)
   depends+=(
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
   )
   depends+=(
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
   )
   depends+=(
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
      dracut
   )
   conflicts=(
      mkinitcpio
      booster
   )

   depends=(eumpf-base)
   depends+=(dracut)
}

package_eumpf-base() {
   groups=(
      eumpf-desktop
      eumpf-surface
      eumpf-framework
   )

   depends=(
      eumpf-machine
      eumpf-initramfs
   )
   depends+=(
      base
      base-devel
      pacman-contrib
      dkms
      
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
      libblockdev
      e2fsprogs
      exfatprogs
      networkmanager

      pam-u2f

      zsh
      tmux
      neovim
      python-pynvim
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

   depends=(eumpf-gui)
   depends+=(
      gnome-shell
      gdm
      xdg-desktop-portal-gnome
      gnome-control-center
      gnome-system-monitor
      gnome-disk-utility
      gnome-calendar
      gnome-software
      eumpf-flatpak
      gnome-tweaks
      nautilus
      gdm-settings # aur
      adw-gtk-theme # aur
      gradience-git # aur
   )

   install=eumpf-gnome.install # install flatpaks (calendar, calculator etc) & my gradience theme
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
   )
   depends+=(
      qt5-wayland
      qt6-wayland
      gtk4
      gtk3
      wl-clipboard

      xdg-user-dirs-gtk

      firefox
      zathura-pdf-mupdf
      alacritty
      qucs-s # aur
   )

   install=eumpf-gui.install # install flatpaks (obs, discord etc)
}

package_eumpf-desktop-extras() {
   groups=(eumpf-desktop)

   depends=(eumpf-gui)
   depends+=(
      gimp
      freecad
      dolphin-emu
   )
}

package_eumpf-laptop-extras() {
   groups=(
      eumpf-surface
      eumpf-framework
   )

   depends=(eumpf-gui)
   optdepends=(
      gimp
      freecad
      dolphin-emu
   )
}

package_eumpf-config() {
   groups=(
      eumpf-surface
      eumpf-framework
      eumpf-desktop
   )
   depends=(
      eumpf-base
      eumpf-config-machine
   )

   install=eumpf-config.install
}

package_eumpf-config-desktop() {
   groups=(eumpf-desktop)
   depends=(eumpf-config)
   provides=(eumpf-config-machine)
   conflicts=(
      eumpf-config-surface
      eumpf-config-framework
   )

   install=eumpf-config-desktop.install
}

package_eumpf-config-surface() {
   groups=(eumpf-surface)
   depends=(eumpf-config)
   provides=(eumpf-config-machine)
   conflicts=(
      eumpf-config-desktop
      eumpf-config-framework
   )

   install=eumpf-config-surface.install
}

package_eumpf-config-framework() {
   groups=(eumpf-framework)
   depends=(eumpf-config)
   provides=(eumpf-config-machine)
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

   depends=(eumpf-base)
   depends+=(
      eumpf-pandoc
      texlive-latexextra
      tllocalmgr # aur
      micromamba-bin # aur
   )
}

package_eumpf-vm() {
   groups=(eumpf-desktop)

   depends=(eumpf-gui)
   depends+=(
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

   depends=(eumpf-base)
   depends+=(
      pandoc-bin # aur
   )

   install=eumpf-pandoc.install # install lua filters
}

package_eumpf-pipewire() {
   groups=(eumpf-replacements)
   replaces=(pipewire)

   depends=(eumpf-base)
   depends+=(
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

   depends=(eumpf-base)
   depends+=(
      gstreamer
      gstreamer-vaapi
   )
}

package_eumpf-flatpak() {
   groups=(eumpf-replacements)
   replaces=(flatpak)

   depends=(eumpf-base)
   depends+=(flatpak)

   install=eumpf-flatpak.install
}
