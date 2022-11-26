#! /bin/bash
echo "[BUILDING LINUX]"
cd /build/sources/linux*
mkdir -p /build/out
make defconfig
make -j8 || exit
cp arch/x86_64/boot/bzImage /build/out/
