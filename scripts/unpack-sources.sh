#! /bin/bash
echo "[UNPACKING SOURCES]"
mkdir -p /build/sources
tar -xvf /build/downloads/linux* -C /build/sources
tar -xjvf /build/downloads/busybox* -C /build/sources
