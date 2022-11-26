FROM ubuntu:22.10
RUN apt update && apt install --yes make build-essential bc bison flex libssl-dev libelf-dev wget
RUN apt install --yes cpio fdisk extlinux dosfstools qemu-system-x86 
COPY ./scripts /scripts
COPY ./src /src
RUN mkdir -p /build/out &&\
    mkdir -p /build/tmp
CMD bash /scripts/run-all.sh
