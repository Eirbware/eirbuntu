#!/bin/bash
### This file contains the commands that are ran just before the installation

### Unpack and install preinstalled packages
dpkg -i /cdrom/preinstalled-packages/*.deb

### Adding eirbuntu theme and background
cp /cdrom/assets/eirbuntu-theme /usr/share/plymouth/themes/eirbuntu -r
cp /cdrom/assets/eirbuntu-background.png /usr/share/backgrounds
cp /cdrom/assets/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png

XDG_RUNTIME_DIR=/run/user/$(id -u ubuntu)

sudo -u ubuntu DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" gsettings set org.gnome.desktop.interface color-scheme prefer-dark
sudo -u ubuntu DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/eirbuntu-background.png
sudo -u ubuntu DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/eirbuntu-background.png
sudo -u ubuntu DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" gsettings set org.gnome.desktop.interface gtk-theme eirbuntu

### Adding desktop files
cp /cdrom/desktop-files/* /home/ubuntu/Desktop -r
