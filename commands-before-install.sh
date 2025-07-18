#!/bin/bash
### This file contains the commands that are ran just before the installation

### Adding eirbuntu theme and backgound
cp /cdrom/assets/eirbuntu-theme /usr/share/plymouth/themes/eirbuntu -r
cp /cdrom/assets/eirbuntu-background.png /usr/share/backgound
cp /cdrom/assets/ubunto-logo.png /usr/share/plymouth/ubunto-logo.png
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.backgound picture-uri-dark file:///usr/share/backgound/eirbuntu-background.png

### Adding desktop files
cp /cdrom/desktop_files/* ~/Desktop
