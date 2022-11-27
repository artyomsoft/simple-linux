#! /bin/bash
echo "[BUILDING LINUX]"

varcheck SOURCES_DIR LINUX_DIR LINUX_VER LINUX_FILENAME

cd ${SOURCES_DIR}/linux-${LINUX_VER}
make defconfig
make -j8 || exit
cp arch/x86_64/boot/bzImage ${LINUX_DIR}/${LINUX_FILENAME}
