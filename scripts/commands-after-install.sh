#!/bin/bash
# Ran after install

### Unpack and install preinstalled packages
dpkg -i /cdrom/preinstalled-packages/*.deb

### Adding eirbuntu theme and background files
cp /cdrom/assets/eirbuntu-theme /usr/share/plymouth/themes/eirbuntu -r
cp /cdrom/assets/eirbuntu-background.png /usr/share/backgrounds
cp /cdrom/assets/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png

### Changing gnome default background and theme
cp /cdrom/gnome-files/user /etc/dconf/profile
cp /cdrom/gnome-files/local.d /etc/dconf/db -r
cp /cdrom/gnome-files/eirbuntu-wallpapers.xml /usr/share/gnome-background-propreties
dconf update

### Adding default desktop files
mkdir /etc/skel/Desktop
cp /cdrom/desktop-files/* /etc/skel/Desktop -r

