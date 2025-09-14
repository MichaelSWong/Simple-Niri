#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for niri section"
print_info "\nStarting niri setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm niri" "Install Niri (Must)" "yes"
run_command "cp -r $BASE_DIR/configs/niri $BASE_DIR/.config/ && chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config" "Copy niri config (Must)" "yes" "no"

run_command "pacman -S --noconfirm xdg-desktop-portal-gtk" "Install XDG desktop portal for Niri" "yes"

run_command "pacman -S --noconfirm xwayland-satellite" "Install Xwayland Satellite for Niri" "yes"

run_command "pacman -S --noconfirm keepassxc" "Install Keepassxc for Passwords" "yes"

run_command "pacman -S --noconfirm polkit-kde-agent" "Install KDE Polkit agent for authentication dialogs" "yes"

run_command "pacman -S --noconfirm mako" "Install mako notification daemon" "yes"
run_command "cp -r $BASE_DIR/configs/mako /home/$SUDO_USER/.config/" "Copy mako config" "yes" "no"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Install QT support on wayland" "yes"

echo "------------------------------------------------------------------------"
