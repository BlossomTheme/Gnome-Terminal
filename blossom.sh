#bin/bash

function logo () {
    echo
    echo ".oPYo. 8                                     "   
    echo "8   .8 8                                     "   
    echo "o8YooP' 8 .oPYo. .oPYo. .oPYo. .oPYo. ooYoYo."    
    echo "8   :b 8 8    8 Yb..   Yb..   8    8 8  8  8 "   
    echo "8    8 8 8    8   ;Yb.    Yb. 8    8 8  8  8 "   
    echo "8oooP' 8 *YooP* ;YooP* *YooP* *YooP* 8  8  8 "   
    echo ":......:..:.....::.....::.....::.....:..:..:."   
    echo ":::::::Gnome Terminal Theme Installer::::::::"   
    echo ":::::::::::::::::::::::::::::::::::::::::::::"   
    echo
}


function default_mode(){
    PALETTTE="['#f46e00','#f70047','#00ff7d','#fcdd42','#26b3d2','#9200ff','#ea748f','#d3d7cf','#f5ac00','#ff5555','#55ff55','#ffff55','#729fcf','#ff0eff','#34e2e2','#eeeeec']"

    echo "Blossom Installer Script :)"

    read -p "Enter Profile ID: " PROFILE
    echo
    echo "Entered profile ID = ${PROFILE}"
    PROFILE_NAME=$(dconf read /org/gnome/terminal/legacy/profiles:/${PROFILE}/visible-name)
    echo "Profile name: ${PROFILE_NAME}"
    echo
    echo "Installing..."
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/background-color "'#10111b'" && echo "Background color set" 
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/foreground-color "'#00ecc8'" && echo "Foreground color set"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/palette ${PALETTTE} && echo "Palette colors set"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/use-theme-background "false" && echo "Enabling Theme 1/2"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/use-theme-colors "false" && echo "Enabling Theme 2/2"
    echo "Blossom Theme Installed Successfully..."
}


function custom_mode(){
    echo "Blossom Installer Script :)"

    read -p "Enter Profile ID: " PROFILE
    echo
    read -p "Enter background color: " BG
    read -p "Enter foreground color: " FG
    read -p "Enter palette string: " PALETTE

    echo "Entered profile ID = ${PROFILE}"
    PROFILE_NAME=$(dconf read /org/gnome/terminal/legacy/profiles:/${PROFILE}/visible-name)
    echo "Profile name: ${PROFILE_NAME}"
    echo
    echo "Installing..."
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/background-color "'${BG}'" && echo "Background color set" 
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/foreground-color "'${FG}'" && echo "Foreground color set"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/palette ${PALETTTE} && echo "Palette colors set"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/use-theme-background "false" && echo "Enabling Theme 1/2"
    dconf write /org/gnome/terminal/legacy/profiles:/${PROFILE}/use-theme-colors "false" && echo "Enabling Theme 2/2"
    echo "Blossom Theme Installed Successfully..."
}


logo
if [ "$1" = "-d" ];
then
    echo "Using default parameters."
    default_mode

elif [ "$1" = "-c" ];
then
    echo "Custom setup parameters."
    custom_mode

else
    echo "Invalid parameters, please retry."
fi
