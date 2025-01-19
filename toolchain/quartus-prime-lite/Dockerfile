# Creates a docker image for a toolchain layer within the wharf project's
# hardware development stack.

# Build upon the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A toolchain layer for quartus-prime-lite (23.1.1)"

# Set the timezone
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install image dependencies
RUN apt-get update && apt-get -y install \
    tzdata \
    libglib2.0-0 \
    expect \
    libtcmalloc-minimal4 \
    locales \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
   
# Download and install Intel Quartus Prime Lite
RUN mkdir -p /root/quartus \
    && cd /root/quartus \
    && wget -q  https://downloads.intel.com/akdlm/software/acdsinst/23.1std.1/993/ib_tar/Quartus-lite-23.1std.1.993-linux.tar -O ./Quartus-lite-23.1std.1.993-linux.tar \
    && tar -xvf ./Quartus-lite-23.1std.1.993-linux.tar \
    && chmod +x ./components/QuartusLiteSetup-23.1std.1.993-linux.run \
    && ./components/QuartusLiteSetup-23.1std.1.993-linux.run --installdir /opt/intel/23.1 --accept_eula 1 --mode unattended --disable-components questa_fe,questa_fse,quartus_update,quartus_help,riscfree \
    && rm -rf /opt/intel/23.1/nios2eds \
    && rm -rf /opt/intel/23.1/niosv \
    && rm -rf /root/quartus

# Add Quartus binaries to path 
ENV PATH="$PATH:/opt/intel/23.1/quartus/bin"

# Hacks for fixing malloc errors when using Quartus
# Reference: https://community.intel.com/t5/Intel-Quartus-Prime-Software/Quartus-failed-to-run-inside-Docker-Linux/td-p/241058
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libtcmalloc_minimal.so.4"
RUN mv "/opt/intel/23.1/quartus/linux64/libstdc++.so.6" "/opt/intel/23.1/quartus/linux64/libstdc++.so.6.ignore"
ENV LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/"

# Enter the shell
CMD ["bash"]