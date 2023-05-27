# Maintainer: Elias Rumpf <e.rumpf@gmx.de>

pkgbase=eumpf
pkgname=(
   "eumpf-common"
   "eumpf-pc"
   
   "eumpf-surface-base"
   "eumpf-surface-graphics-support"
   "eumpf-surface-config"
   
   "eumpf-desktop-base"
   "eumpf-desktop-graphics-support"
   "eumpf-desktop-config"
   
   "eumpf-gnome"
   "eumpf-gui-apps"
   "eumpf-cli-apps"
)

pkgver=1
pkgrel=1

pkgdesc="personal system config metapackages"

arch=(any)

url="https://github.com/eumpf0/arch-pkgs"

license=(MIT)
groups=("eumpf")

package_eumpf-kernel() {
   depends=(
      linux linux-headers
   )
}

package_eumpf-firmware() {
   depends=(
      linux-firmware
      intel-ucode
      mesa
   )
}

package_eumpf-machine-surface() {
   provides=(
      eumpf-machine
      eumpf-kernel
      eumpf-graphics
   )
   conflicts=(eumpf-machine-desktop)
   
   depends=(eumpf-firmware)
   
   depends+=(
      linux-surface
      linux-surface-headers

      linux-firmware-marvell
      iptsd

      intel-media-driver
      vulkan-intel
   )

   install=eumpf-surface.install
}

package_eumpf-machine-desktop() {
   provides=(
      eumpf-machine
      eumpf-graphics
   )
   conflicts=(eumpf-machine-surface)

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

package_eumpf-base() {
   depends=(eumpf-machine)
   depends+=(
      base
      base-devel
      pacman-contrib
      dkms
      dracut
      
      gcc
      clang
      git
      meson
      tree
      less
      man-db
      man-pages

      libsecret
      libfido2
      libblockdev
      e2fsprogs
      exfatprogs
      networkmanager

      zsh
      tmux
      neovim
      python-pynvim

      eumpf-dotfiles
   )
}

package_eumpf-dotfiles() {
   depends=(git)
   install=eumpf-dotfiles.install
}

package_eumpf-pipewire() {
   replaces=(pipewire)
   depends=(eumpf-base)
   depends+=(
      pipewire
      wireplumber
      pipewire-alsa
      pipewire-pulse
   )
}

package_eumpf-gstreamer() {
   replaces=(gstreamer)
   depends=(eumpf-base)
   depends+=(
      gstreamer
      gstreamer-vaapi
   )
}

package_eumpf-gnome() {
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
      flatpak
      gnome-tweaks
      nautilus
      gdm-settings # aur
      adw-gtk-theme # aur
      gradience-git # aur, and install my theme
   )

   install=eumpf-gnome.install # install flatpaks (calendar, calculator etc)
}

package_eumpf-gui() {
   groups=(
      eumpf-desktop
      eumpf-surface
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
      qimp
      freecad
      dolphin-emu
   )
}

package_eumpf-laptop-extras() {
   groups=(eumpf-surface)
   depends=(eumpf-gui)
   optdepends=(
      gimp
      freecad
      dolphin-emu
   )
}


package_eumpf-cli() {
   groups=(
      eumpf-desktop
      eumpf-surface
   )
   depends=(eumpf-base)
   depends+=(
      eumpf-pandoc
      texlive-latexextra
      tllocalmgr  # aur
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
   depends=(eumpf-base)
   replaces=(pandoc)
   depends+=(
      pandoc-bin # aur
   )

   install=eumpf-pandoc.install # install lua filters
}
