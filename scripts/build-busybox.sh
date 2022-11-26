#! /bin/bash
echo "[BUILDIND BUSYBOX]"
cd /build/sources/busybox*
mkdir -p /build/out
make defconfig
make clean && make LDFLAGS=-static
cp busybox /build/out/

