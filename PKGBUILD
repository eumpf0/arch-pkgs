# Maintainer: Elias Rumpf <e.rumpf@gmx.de>

pkgbase=eumpf
pkgname=()
pkgver=1
pkgrel=1
pkgdesc="my system config"
arch=(any)
url="https://github.com/eumpf0/arch-pkgs"
license=(MIT)
groups=()

rootdir=$PWD

package_eumpf-surface-base() {
   groups=(eumpf-surface)
   provides=(eumpf-device-base)
   conflicts=(eumpf-desktop-base)
   
   install=eumpf-surface-base.install

   depends=(
      linux-surface linux-surface-headers iptsd
      linux-firmware-marvell intel_ucode
   )
}

package_eumpf-desktop-base() {
   groups=(eumpf-desktop)
   provides=(eumpf-device-base)
   conflicts=(eumpf-surface-base)
   
   depends=(
      linux linux-headers
      nvidia intel_ucode
   )
}

package_eumpf-common() {
   groups=(eumpf-surface eumpf-desktop)
   depends=(eumpf-device-base)
   provides=(eumpf-device)

   depends+=(
      base base-devel
      linux-firmware
      man-db man-pages texinfo
      sudo git which tree
      zsh zsh-completions
      dracut
      neovim python-neovim tmux
   )
}

package_eumpf-pc() {
   groups=(eumpf-surface eumpf-desktop)
   depends=(eumpf-device)
   conflicts=(eumpf-server)

   depends+=(
      btrfs-progs e2fsprogs dosfstools exfatprogs
      interception-tools
      networkmanager
      bluez bluez-utils
      wireplumber pipewire-pulse pipewire-alsa
      flatpak
   )
}

package_eumpf-surface-graphics-support() {
   groups=(eumpf-gui eumpf-surface)
   depends=(eumpf-common)
   provides=(eumpf-graphics-support)
   conflicts=(eumpf-desktop-graphics-support)

   depends+=(
      mesa vulkan-intel
      intel-media-driver
      intel-gpu-tools
   )
}

package_eumpf-desktop-graphics-support() {
   groups=(eumpf-gui eumpf-desktop)
   depends=(eumpf-common)
   provides=(eumpf-graphics-support)
   conflicts=(eumpf-surface-graphics-support)

   depends+=(
      nvidia
      nvidia-utils
   )
}

package_eumpf-gnome() {
   groups=(eumpf-gui eumpf-surface eumpf-desktop)
   depends=(eumpf-graphics-support)
   provides=(eumpf-graphical-environment)
   
   install=eumpf-gnome.install

   depends+=(
      wayland wl-clipboard
      gnome-shell gdm
      xdg-desktop-portal-gnome
      gnome-software
      gnome-control-center
      gnome-system-monitor
      gnome-disk-utility
      gnome-tweaks
      nautilus
      # aur
      gdm-settings
      adw-gtk-theme
   )
}

package_eumpf-gui-apps() {
   groups=(eumpf-apps eumpf-gui eumpf-surface eumpf-desktop)
   depends=(eumpf-graphical-environment)
   
   install=eumpf-gui-apps.install

   depends+=(
      firefox
      zathura-pdf-mupdf
      alacritty
   )
}

package_eumpf-cli-apps() {
   groups=(eumpf-apps eumpf-surface eumpf-desktop)
   depends=(eumpf-common)

   depends+=(
      texlive-latexextra
      # aur
      pandoc-bin
   )
}

package_eumpf-surface-config() {
   groups=(eumpf-surface)
   depends=(eumpf-common)
   provides=(eumpf-config)
   conflicts=(eumpf-desktop-config)
}

package_eumpf-desktop-config() {
   groups=(eumpf-desktop)
   depends=(eumpf-common)
   provides=(eumpf-config)
   conflicts=(eumpf-surface-config)
}
