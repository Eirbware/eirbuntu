#!/bin/bash
VERSION=minimal.fr
set -x
#set -e

# Uses ubuntu autoinstall

### Update and install necesary packages
apt-get update
apt-get install -y xorriso 

### Creating tmp dir to work in
TMP_DIR=/iso-modif
mkdir -p $TMP_DIR

# Extracting iso
ISO=iso/$(ls iso | head -n 1)
xorriso -osirrox on -indev $ISO -extract / $TMP_DIR &> /dev/null

### Copying autoinstall and commands-before-installation and assets
cp autoinstall.yaml $TMP_DIR
cp commands-before-installation.sh $TMP_DIR
cp assets $TMP_DIR -r
cp desktop-files $TMP_DIR -r

### Changing the name in grub
sed -i -e 's/Ubuntu/Eirbuntu/g' $TMP_DIR/boot/grub/loopback.cfg
sed -i -e 's/Ubuntu/Eirbuntu/g' $TMP_DIR/boot/grub/grub.cfg

### Removing splash screen (ubuntu logo during boot)
sed -i -e 's/splash//' $TMP_DIR/boot/grub/grub.cfg
sed -i -e 's/splash//' $TMP_DIR/boot/grub/loopback.cfg

### Copying MBR partition (necessary to boot from usb)
MBR_FILE=/mbr_copy.bin
dd if=$ISO bs=1 count=432 of=$MBR_FILE

### Repackaging iso
NEW_ISO_PATH=/app/new-iso/$(ls /app/iso | head -n 1 | sed 's/ubuntu/eirbuntu/')
xorriso -as mkisofs -r -V "Eirbuntu" \
  -o $NEW_ISO_PATH\
  -J -l -c boot.catalog\
  -isohybrid-mbr $MBR_FILE \
  -b boot/grub/i386-pc/eltorito.img\
  -no-emul-boot -boot-load-size 4 -boot-info-table \
  -eltorito-alt-boot -e EFI/boot/grubx64.efi \
  -no-emul-boot -isohybrid-gpt-basdat \
  $TMP_DIR

