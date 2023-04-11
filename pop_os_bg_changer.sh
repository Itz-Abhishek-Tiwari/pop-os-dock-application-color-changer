#!/bin/bash

# Prompt for sudo password
password=$(zenity --password --title="Enter Sudo Password" --text="This script requires root privileges. Please enter your password:")

# Check if password is empty
if [[ -z "$password" ]]; then
    zenity --error --text="Password cannot be empty. Exiting..."
    exit 1
fi

# Check if sudo password is correct
echo "$password" | sudo -S ls >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
    zenity --error --text="Incorrect password. Exiting..."
    exit 1
fi

# Display start message
zenity --info --title="Pop!_OS Cosmic Background Color Changer" --text="This script will allow you to change the background color of the Default Dock extension and the Applications menu in the Pop!_OS Cosmic desktop environment. Click OK to continue."

# Prompt for background color
color=$(zenity --color-selection --show-palette --title="Select Background Color" --color='#1A1E24')

# Prompt for background opacity
opacity=$(zenity --entry --title="Set Background Opacity" --text="Enter a value between 0 and 1 for background opacity (e.g. 0.8):")

# Validate input for background opacity
if ! [[ $opacity =~ ^[0-9]*(\.[0-9]+)?$ ]] || (( $(echo "$opacity > 1" | bc -l) )) || (( $(echo "$opacity < 0" | bc -l) )); then
    zenity --error --text="Invalid input for background opacity. Please enter a value between 0 and 1."
    exit 1
fi

# Set background-opacity for Default Dock
echo "$password" | sudo -S gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity $opacity

# Set background-color for Default Dock
echo "$password" | sudo -S gsettings set org.gnome.shell.extensions.dash-to-dock background-color $color

# Display a Zenity dialog box to ask the user if they want to enable blur
zenity --question --text "Do you want to enable blur in the Applications menu?"

# Store the exit status of the Zenity dialog in a variable
response=$?

# Check the exit status to determine user's choice
if [ $response -eq 0 ]; then
  # User clicked "Yes", change background color with blur
  echo "$password" | sudo -S sed -i "2s|.*|background-color: rgba(26,30,36,$opacity);|" /usr/share/gnome-shell/extensions/pop-cosmic@system76.com/dark.css
  zenity --info --text "Blur enabled."
else
  # User clicked "No" or closed the dialog, change background color without blur
  echo "$password" | sudo -S sed -i "2s|.*|background-color: rgba(26,30,36);|" /usr/share/gnome-shell/extensions/pop-cosmic@system76.com/dark.css
  zenity --info --text "Blur disabled."
fi

# Display end message
zenity --info --title="Pop!_OS Cosmic Background Color Changer" --text="The background color has been changed successfully. Please log out and log back in to reload the COSMIC desktop environment. Thank you for using this script!"

