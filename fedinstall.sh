#! /bin/bash

#optimizing dnf
sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf.conf.bak
sudo cp dotfiles/repos/dnf.conf /etc/dnf/dnf.conf

#updating the sys
sudo dnf up --refresh -y

#Command Line Setup using rpm
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

#AppStream metadata
sudo dnf groupupdate core -y

#Install additional codec
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

#Install the sound-and-video complement packages
sudo dnf groupupdate sound-and-video -y

#Hardware Accelerated Codec
sudo dnf install intel-media-driver -y

#enable Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#some misc
sudo dnf install -y btop neofetch timeshift zsh openssl VirtualBox gnome-tweaks

#install application
flatpak install flathub -y com.brave.Browser org.telegram.desktop com.discordapp.Discord com.mattjakeman.ExtensionManager com.obsproject.Studio org.gimp.GIMP org.qbittorrent.qBittorrent org.telegram.desktop org.videolan.VLC us.zoom.Zoom net.hovancik.Stretchly com.anydesk.Anydesk

#for my crap qualcomm Wireless Adapter
sudo systemctl disable NetworkManager-wait-online.service

#install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code -y

#change shell
# chsh -s $(which zsh)
