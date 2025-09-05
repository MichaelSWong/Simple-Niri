#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for game section"
print_info "\nStarting game setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm steam lutris gamemode mangohud goverlay" "Install Game Section (Must)" "yes"

run_command "yay -S --sudoloop --noconfirm protonup-qt" "Install Proton + Wine Helper" "yes"


echo "------------------------------------------------------------------------"
