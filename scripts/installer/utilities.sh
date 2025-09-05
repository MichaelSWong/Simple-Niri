#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar - Status Bar" "yes"
run_command "cp -r /home/$SUDO_USER/simple-niri/configs/waybar /home/$SUDO_USER/.config/" "Copy Waybar config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm fuzzel" "Install Fuzzel - Application Launcher" "yes" "no"

run_command "yay -S --sudoloop --noconfirm neovim-nightly-bin" "Install neovim" "yes" "no"
run_command "cp -r /home/$SUDO_USER/simple-niri/configs/nvim /home/$SUDO_USER/.config/" "Copy nvim config" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "pacman -S --noconfirm swww" "Install SWWW for wallpaper management" "yes" "no"
run_command "mkdir -p /home/$SUDO_USER/.config/assets/backgrounds && cp -r /home/$SUDO_USER/simple-niri/assets/backgrounds /home/$SUDO_USER/.config/assets/ && chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config/assets/" "Copy sample wallpapers to assets directory (Recommended)" "yes" "no"

run_command "pacman -S --noconfirm swaylock swayidle" "Install Swaylock + SwayIdle - Screen Locker (Must)" "yes" "no"

run_command "pacman -S --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick"
run_command "cp -r /home/$SUDO_USER/simple-niri/configs/yazi /home/$SUDO_USER/.config/" "Copy yazi config" "yes" "no"

run_command "pacman -S --noconfirm unzip" "Install Unzip (Must)" "yes" "no"

run_command "pacman -S --noconfirm starship" "Install Starship" "yes" "no"
run_command "cp -r /home/$SUDO_USER/simple-niri/configs/starship.toml /home/$SUDO_USER/.config/" "Copy starship config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm fnm" "Install fnm" "yes" "no"

run_command "cp -r /home/$SUDO_USER/simple-niri/.bashrc /home/$SUDO_USER/.bashrc && chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.bashrc" "Replace .bashrc file" "yes" "no"

echo "------------------------------------------------------------------------"
