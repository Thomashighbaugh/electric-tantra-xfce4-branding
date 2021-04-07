#bin/bash
## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')" GREEN="$(printf '\033[32m')" ORANGE="$(printf '\033[33m')" BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')" CYAN="$(printf '\033[36m')" WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')" GREENBG="$(printf '\033[42m')" ORANGEBG="$(printf '\033[43m')" BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')" CYANBG="$(printf '\033[46m')" WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

## Banner
clear
cat <<-_EOF_
	${CYAN}┌─────────────────────────────────────────────────────────────────────────────┐
	│  ${MAGENTA}       __            __        __       __               __                ${CYAN}│
	│  ${MAGENTA}.-----|  .-----.----|  |_.----|__.----.|  |_.---.-.-----|  |_.----.---.-.  ${CYAN}│
	│  ${MAGENTA}|  -__|  |  -__|  __|   _|   _|  |  __||   _|  _  |     |   _|   _|  _  |  ${CYAN}│
	│  ${MAGENTA}|_____|__|_____|____|____|__| |__|____||____|___._|__|__|____|__| |___._|  ${CYAN}│
	└─────────────────────────────────────────────────────────────────────────────┘
_EOF_

echo ${GREEN} "******* Installing Electric Tantra Theming for XFCE4 *******"

echo ${CYAN} "******* cloning dotfiles for electric-tantra - XFCE4 Theming *******" && sleep 1
    wget https://raw.githubusercontent.com/Thomashighbaugh/electric-tantra-xfce4-theming/master/dconf/mousepad.dconf
    dbus-launch dconf load / < mousepad.dconf
    rm mousepad.dconf
    git clone https://github.com/Thomashighbaugh/electric-tantra-xfce4-theming.git
    cd electric-tantra-xfce4-theming

echo ${CYAN} "******* Getting theme packages installed now: *******" && sleep 1
    sudo pacman -S --noconfirm --needed - < xfce4-packages-list

echo ${RED} "******* setting up theme for Light-DM: *******" && sleep 1
    wget -q --timeout=10 https://github.com/Thomashighbaugh/electric-tantra-archiso/raw/master/airootfs/etc/lightdm/lightdm-gtk-greeter.conf
        sudo cp  lightdm-gtk-greeter.conf /etc/lightdm/
        rm lightdm-gtk-greeter.conf
        sudo systemctl -f enable lightdm

    rm -rf ~/.config/Thunar ~/.config/qt5ct ~/.config/xfce4 ~/.cache
    cp -R XFCE/. ~/
    cp XFCE/.config/user-dirs.conf ~/.config/
    cd ..
    rm -rf electric-tantra-xfce4-theming 
echo ${CYAN} "******** Installing the Dhumavati GTK Theme *******"
    git clone https://github.com/Thomashighbaugh/Dhumavati-Theme 
    cd Dhumavati-Theme && bash install.sh && cd ..
    rm Dhumavati-Theme
echo ${GREEN} "******* All Done --- restarting System NOW! *******"
echo ${RED} "******* Please login again and enjoy electric-tantra Theming! *******"

    yad --title="Restarting System" \
        --text="All done --- please login again and enjoy XFCE4 with Electric Tantra Theming!" \
        --width=400 --height=100 \
        --button="Restart System":0

    sudo systemctl reboot

}

Main "$@"
