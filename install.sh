#!/bin/bash

cr="$(tput setaf 1)"
cg="$(tput setaf 2)"
cy="$(tput setaf 3)"
cm="$(tput setaf 5)"
sb="$(tput bold)"
sn="$(tput sgr0)"

print() {
    case "$1" in
        t | title)
            shift
            printf "%s\n" "${sb}${cg}[###]$*${sn}"
        ;;
        s | step)
            shift
            printf "%s\n" "${sb}${cm}[===]$*${sn}"
        ;;
        e | error)
            shift
            printf "%s\n" "${sb}${cr}[!!!]$*${sn}"
            exit 1
        ;;
        w | warning)
            shift
            printf "%s\n" "${sb}${cy}[:::]$*${sn}"
        ;;
        *)
            printf '%s\n' "$*"
        ;;
    esac
}

print t "Electric Tantra Branding for XFCE4"

print s "Making Directory"
mkdir -p "$HOME"/.config/xfce4 
print s "Copying contents of this repo to the directory"
cp -rvf "$PWD"/* "$HOME"/.config/xfce4

print w "Installation Completed"
