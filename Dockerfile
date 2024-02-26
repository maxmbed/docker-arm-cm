# Docker Arm gcc-none-eabi
# Use to build arm cortex-m target
FROM alpine:3.19

RUN apk add  --no-cache \
        gcompat \
        make \
        cmake \
        bash \
        wget \ 
        python3 \
# Source fetching tools \
        git \
#       mercurial \
# Compilation tools \
        bear

# Download and install toolchain
ARG toolchain_url=https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
ARG toolchain_name=gcc-arm-toolchain
ARG toolchain_path=/opt/${toolchain_name}/bin
RUN mkdir -p $toolchain_path 
RUN wget $toolchain_url -qO - | tar xvfj - --strip-components=1 -C $toolchain_path
ENV PATH=${PATH}:$toolchain_path/bin

COPY ./entry_point.sh /
ENTRYPOINT [ "sh", "./entry_point.sh" ]
