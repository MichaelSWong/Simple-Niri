#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar - Status Bar" "yes"
run_command "cp -r $BASE_DIR/configs/waybar /home/$SUDO_USER/.config/" "Copy Waybar config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm fuzzel" "Install Fuzzel - Application Launcher" "yes" "no"

run_command "yay -S --sudoloop --noconfirm neovim-nightly-bin" "Install neovim" "yes" "no"
run_command "cp -r $BASE_DIR/configs/nvim /home/$SUDO_USER/.config/" "Copy nvim config" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "pacman -S --noconfirm swww" "Install SWWW for wallpaper management" "yes" "no"
run_command "mkdir -p /home/$SUDO_USER/.config/assets/backgrounds && cp -r $BASE_DIR/assets/backgrounds /home/$SUDO_USER/.config/assets/ && chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config/assets/" "Copy sample wallpapers to assets directory (Recommended)" "yes" "no"

run_command "pacman -S --noconfirm swaylock swayidle" "Install Swaylock + SwayIdle - Screen Locker (Must)" "yes" "no"

run_command "pacman -S --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick"
run_command "cp -r $BASE_DIR/configs/yazi /home/$SUDO_USER/.config/" "Copy yazi config" "yes" "no"

run_command "pacman -S --noconfirm unzip" "Install Unzip (Must)" "yes" "no"

run_command "pacman -S --noconfirm starship" "Install Starship" "yes" "no"
run_command "cp -r $BASE_DIR/configs/starship.toml /home/$SUDO_USER/.config/" "Copy starship config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm fnm" "Install fnm" "yes" "no"

run_command "cp -r $BASE_DIR/.bashrc /home/$SUDO_USER/.bashrc && chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.bashrc" "Replace .bashrc file" "yes" "no"

echo "------------------------------------------------------------------------"
