#!/bin/bash
### This file contains the commands that are ran just before the installation

### Adding eirbuntu theme and background
cp /cdrom/assets/eirbuntu-theme /usr/share/plymouth/themes/eirbuntu -r
cp /cdrom/assets/eirbuntu-background.png /usr/share/backgrounds
cp /cdrom/assets/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/eirbuntu-background.png
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/eirbuntu-background.png

### Adding desktop files
cp /cdrom/desktop_files/* ~/Desktop
