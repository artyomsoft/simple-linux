FROM ubuntu:22.10
RUN apt update && apt install --yes make build-essential bc bison flex libssl-dev libelf-dev wget
RUN apt install --yes cpio fdisk extlinux dosfstools qemu-system-x86
RUN apt install --yes vim

ARG APP=/app
ARG LINUX_DIR=$APP/linux
ARG FILES_DIR=$APP/files
ARG SCRIPTS_DIR=$APP/scripts

ENV BUILD_DIR=$APP/build
ENV LINUX_DIR=$LINUX_DIR
ENV FILES_DIR=$FILES_DIR
ENV LINUX_VER=5.15.79
ENV BUSYBOX_VER=1.35.0
ENV BASH_ENV="$SCRIPTS_DIR/bash-env/env" 
 
COPY ./scripts $APP/scripts
COPY ./files $APP/files
RUN mkdir -p $LINUX_DIR
RUN  ln -s $APP/scripts/start-linux.sh /usr/bin/start &&\
     ln -s $APP/scripts/build-linux.sh /usr/bin/build &&\
     ln -s $APP/scripts/build-image.sh /usr/bin/image

WORKDIR $APP/scripts

CMD build