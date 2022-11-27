#! /bin/bash
set -e
echo "[BUILDING IMAGE]"

varcheck LINUX_DIR FILES_DIR LINUX_VER BUSYBOX_VER LINUX_FILENAME INITRD_FILENAME

IMAGE_FILE=${LINUX_DIR}/linux-${LINUX_VER}-busybox-${BUSYBOX_VER}-disk.img
MOUNT=/mnt/os

dd if=/dev/zero of=${IMAGE_FILE} bs=1024K count=50
echo "type=83,bootable" | sfdisk ${IMAGE_FILE}
losetup -D                                     
LOOP_DEVICE=$(losetup -f)
varcheck LOOP_DEVICE
losetup -o $(expr 512 \* 2048) ${LOOP_DEVICE} ${IMAGE_FILE}
mkfs.vfat ${LOOP_DEVICE} 
mkdir -p ${MOUNT}
mount -t auto ${LOOP_DEVICE} ${MOUNT}
cp ${LINUX_DIR}/${LINUX_FILENAME} ${LINUX_DIR}/${INITRD_FILENAME} ${MOUNT}
mkdir ${MOUNT}/boot
extlinux --install ${MOUNT}/boot
cp ${FILES_DIR}/syslinux.cfg ${MOUNT}/boot
echo "  KERNEL /${LINUX_FILENAME}" >> ${MOUNT}/boot/syslinux.cfg}
echo "  APPEND initrd=/${INIRD_FILENAME} nomodeset" >> ${MOUNT}/boot/syslinux.cfg 
umount ${MOUNT}
losetup -D
dd if=/usr/lib/syslinux/mbr/mbr.bin of=$IMAGE_FILE bs=440 count=1 conv=notrunc
  
 
