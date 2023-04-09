#!/bin/bash

# Ask for password at the start of the script
sudo -v

# Display start message
zenity --info --title="Pop!_OS Cosmic Background Color Changer" --text="This script will allow you to change the background color of the Default Dock extension and the Applications menu in the Pop!_OS Cosmic desktop environment. Click OK to continue."

# Prompt for background color
color=$(zenity --color-selection --show-palette --title="Select Background Color" --color='#1A1E24')

# Set background-opacity for Default Dock
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.8

# Set background-color for Default Dock
gsettings set org.gnome.shell.extensions.dash-to-dock background-color $color

# Change background-color for Applications menu in Pop!_OS Cosmic
sudo sed -i "2s|.*|background-color: $color;|" /usr/share/gnome-shell/extensions/pop-cosmic@system76.com/dark.css

# Display end message
zenity --info --title="Pop!_OS Cosmic Background Color Changer" --text="The background color has been changed successfully. Please log out and log back in to reload the COSMIC desktop environment. Thank you for using this script!"

