#! /bin/bash
echo "[BUILDIND INITRD]"
mkdir -p /build/tmp/initrd
mkdir -p /build/out
cd /build/tmp/initrd

find . | cpio -o -H newc > /build/out/initrd.img
