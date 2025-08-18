#!/bin/bash
# Ran after install

### Unpack and install preinstalled packages
dpkg -i -R -G /cdrom/preinstalled-packages
dpkg -i -R -G /cdrom/packages-to-install

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

### Changing default plymouth theme to eirbuntu to change the boot image
ln -sf /usr/share/plymouth/themes/eirbuntu/eirbuntu.plymouth /etc/alternatives/default.plymouth
update-initramfs -u

### Setting up the systemd service to rename the os in grub
cp /cdrom/scripts/change-os-name.sh /opt
cp /cdrom/scripts/change-os-name.service /etc/systemd/system
systemctl daemon-reload
systemctl enable change-os-name.service
/opt/change-os-name.sh
