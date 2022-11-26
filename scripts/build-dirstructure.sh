#! /bin/bash
echo "[BUILDING DIRECTORY STRUCTURE]"
mkdir -p /build/tmp/initrd

cp /src/init /build/tmp/initrd

chmod 777 /build/tmp/initrd/init

cd /build/tmp/initrd

  mkdir -p bin dev proc sys

  cd bin
    cp /build/out/busybox ./
    for prog in $(./busybox --list); do
      ln -s /bin/busybox ./$prog
    done