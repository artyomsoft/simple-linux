#! /bin/bash
echo "[BUILDIND BUSYBOX]"

varcheck SOURCES_DIR OUT_DIR BUSYBOX_VER

mkdir -p $OUT_DIR
cd $SOURCES_DIR/busybox-${BUSYBOX_VER}
make defconfig
make clean && make LDFLAGS=-static
cp busybox $OUT_DIR/

