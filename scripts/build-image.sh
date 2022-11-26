#! /bin/bash
echo "[BUILDING IMAGE]"
IMAGE_FILE=/build/out/linux-disk.img
dd if=/dev/zero of=${IMAGE_FILE} bs=1024K count=50
echo "type=83,bootable" | sfdisk ${IMAGE_FILE}
losetup -D
LOOP_DEVICE=$(losetup -f)
losetup -o $(expr 512 \* 2048) ${LOOP_DEVICE} ${IMAGE_FILE}
mkfs.vfat ${LOOP_DEVICE} 
mkdir -p /mnt/os
mount -t auto ${LOOP_DEVICE} /mnt/os
cp /build/out/bzImage /build/out/initrd.img /mnt/os
mkdir /mnt/os/boot
extlinux --install /mnt/os/boot
cp /src/syslinux.cfg /mnt/os/boot
umount /mnt/os
losetup -D
dd if=/usr/lib/syslinux/mbr/mbr.bin of=${IMAGE_FILE} bs=440 count=1 conv=notrunc
  
 
