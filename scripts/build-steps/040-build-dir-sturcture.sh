#! /bin/bash
echo "[BUILDING DIRECTORY STRUCTURE]"

varcheck FILES_DIR INITRD_DIR OUT_DIR

mkdir -p ${OUT_DIR}
mkdir -p ${INITRD_DIR}

cp ${FILES_DIR}/init ${INITRD_DIR}

chmod 777 ${INITRD_DIR}/init

cd ${INITRD_DIR}

  mkdir -p bin dev proc sys

  cd bin
    cp ${OUT_DIR}/busybox ./
    for prog in $(./busybox --list); do
      ln -s /bin/busybox ./$prog
    done