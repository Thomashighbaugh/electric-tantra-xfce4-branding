#!/bin/env bash
##########################################################
## TITLE: install.sh
##
## DESCRIPTION: Installs the XFCE4 branding for Electric Tantra Linux with the custom GTK and icon themes to go with it
##
##
## AUTHOR: Thomas Leon Highbaugh <admin@thomasleonhighbaugh.me>
##########################################################

cp -rvf XFCE/.config/* ~/.config
sudo cp -rvf el-logo.png /usr/share/icons
git clone https://github.com/Thomashighbaugh/Dhumavati-Theme && cd Dhumavati-Theme && ./install.sh && cd .. && rm -rf Dhumavati-Theme
git clone https://github.com/Thomashighbaugh/chhinamasta-icon-theme && cp -rvf chhiamasta-icon-theme /usr/share/icons && rm -rf chhinamasta-icon-theme
