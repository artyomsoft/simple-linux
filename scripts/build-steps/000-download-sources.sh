#! /bin/bash
echo "[DOWNLOADING SOURCES]"

varcheck LINUX_VER LINUX_MAJOR_VER BUSYBOX_VER DOWNLOADS_DIR

wget -P ${DOWNLOADS_DIR}  https://cdn.kernel.org/pub/linux/kernel/v${LINUX_MAJOR_VER}.x/linux-${LINUX_VER}.tar.xz
wget -P ${DOWNLOADS_DIR} https://busybox.net/downloads/busybox-${BUSYBOX_VER}.tar.bz2
