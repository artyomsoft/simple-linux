#! /bin/bash

cd /build/out
qemu-system-x86_64 -kernel bzImage -initrd initrd.img -nographic -append 'console=ttyS0'

