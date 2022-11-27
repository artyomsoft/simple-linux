#! /bin/bash
echo "[BUILDIND INITRD]"

varcheck INITRD_DIR LINUX_DIR INITRD_FILENAME

cd ${INITRD_DIR}

find . | cpio -o -H newc > ${LINUX_DIR}/${INITRD_FILENAME}
