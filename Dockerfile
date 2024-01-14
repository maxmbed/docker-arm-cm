# Docker Arm gcc-none-eabi
# Use for build arm cortex-m series

FROM debian:12
RUN apt-get update -y

RUN apt-get install -y \
        which \
        sed \ 
        make \
        cmake \
        bash \
        patch \
        gzip \
        bzip2 \
        perl \
        tar \
        cpio \
        unzip \
        rsync \
        file \
        bc \
        findutils \
        wget \ 
        python3 \
# Interface dependecies \
        libncurses5 libncurses-dev \
# Source fetching tools \
        git \
#       mercurial \
        openssh-client \
# Compilation tools \
        bear

# Download and install toolchain
ARG toolchain_url=https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
ARG toolchain_name=gcc-arm-toolchain
ARG toolchain_path=/opt/${toolchain_name}/bin
RUN mkdir -p $toolchain_path 
RUN wget $toolchain_url -qO - | tar xvfj - --strip-components=1 -C $toolchain_path
ENV PATH=${PATH}:$toolchain_path/bin

