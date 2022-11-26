#! /bin/bash
. "/scripts/download-sources.sh" && \
. "/scripts/unpack-sources.sh" && \
. "/scripts/build-busybox.sh" && \
. "/scripts/build-linux.sh" && \
. "/scripts/build-dirstructure.sh" && \
. "/scripts/build-initrd.sh" && \
. "/scripts/build-image.sh" && \
. "/scripts/start-linux.sh"


