#!/bin/bash
### This file contains the commands that are ran just before the installation

### Adding eirbuntu theme
cp /cdrom/assets/eirbuntu-theme /usr/share/plymouth/themes/eirbuntu -r

### Adding the eirbuntu backgound 
cp /cdrom/assets/eirbuntu-background.png /usr/share/backgound

### Adding desktop files
cp /cdrom/desktop_files/* ~/Desktop
