# Simple Linux
**Simple Linux** is a collection of the bash scripts and the Dockerfile for building the simpliest distribution of Linux. 
Also you can run this distribution in qemu emulator and create the image to write it to a flash disk with a tool 
like [**Win32 Disk Imager**](https://sourceforge.net/projects/win32diskimager/).

All you need to run the scripts is [**Docker Desktop**](https://www.docker.com/products/docker-desktop/) installed on your computer.

To build docker image:

    docker build --build-arg APP -t simple-linux .

To build and run linux:

    docker run -v ${pwd}:/app/linux --rm -it simple-linux build

To run Simple Linux if you have allready built it:

    docker run -v ${pwd}:/app/linux --rm -it simple-linux start

To build image for writing to flash disk:

    docker run -v ${pwd}:/app/linux --privileged --rm -it simple-linux image

You must built linux before it.
