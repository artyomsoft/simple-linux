#! /bin/bash
set -e
echo "[STARTING LINUX]"
varcheck LINUX_DIR LINUX_FILENAME INITRD_FILENAME

cd ${LINUX_DIR}
qemu-system-x86_64 -kernel ${LINUX_FILENAME} -initrd ${INITRD_FILENAME} -nographic -append 'console=ttyS0'

