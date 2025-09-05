#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Final setup script started"
print_bold_blue "\nCongratulations! Your Simple Niri setup is complete!"

print_bold_blue "\nRepository Information:"
echo "   - GitHub Repository: https://github.com/michaelswong/simple-niri"
echo "   - If you found this repo helpful, please consider giving it a star on GitHub!"

echo "-------------------------------------"
echo "       Set up Proton and Wine         "
echo "-------------------------------------"
echo "1. Launch protonup-qt from your terminal or application menu."
echo "2. Select 'Proton' from the dropdown."
echo "3. Choose the latest version of Proton GE and click 'Install'."
echo "4. Do the same for "Wine-GE" if you plan on using Lutris for non-Steam games."
echo "-------------------------------------"

echo "-------------------------------------"
echo "       Configure Your System for Gaming "
echo "-------------------------------------"
echo "1. `systemctl --user enable gamemoded`"
echo "2. `systemctl --user start gamemoded`"
echo "3. For Steam, add gamemoderun %command%'"
echo "4. `sudo pacman -S zram-generator`"
echo "5. `sudo systemctl enable --now zram-generator`"
echo "6. `echo 'vm.max_map_count = 2147483642' | sudo tee /etc/sysctl.d/99-gaming.conf`" 
echo "7. `sudo sysctl --system`" 
echo "8. Enable Proton GE: Go to Steam -> Settings -> Compatibility and enable 'Steam Play for all other titles.'"
echo "9. Select "Proton GE" as the compatibility tool."
echo "10. Reboot" 
echo "-------------------------------------"


print_success "\nEnjoy your new Niri environment!"

echo "------------------------------------------------------------------------"
