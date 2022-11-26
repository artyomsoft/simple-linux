#! /bin/bash
echo "[DOWNLOADING SOURCES]"
mkdir -p /build/downloads
cd /build/downloads
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.79.tar.xz
wget https://busybox.net/downloads/busybox-1.35.0.tar.bz2
