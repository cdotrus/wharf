# Creates a docker image for a toolchain layer within the wharf project's
# hardware development stack.
#
# References: 
#   https://staff.cs.upt.ro/~opritoiu/ca/labs/modelsim.pdf
#   https://github.com/goldenSniperOS/modelsim-docker/blob/master/Dockerfile

# Build upon the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A toolchain layer for modelsim-intel (starter edition 20.1.1)"

# Set the timezone
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install ModelSim-Intel dependencies (32-bit stuff)
# Reference: https://stackoverflow.com/questions/62718951/how-to-fix-libxft-so-2-cannot-open-shared-object-file-when-simulating-hardware
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get -y install \
    libc6:i386 \
    libstdc++6:i386 \
    libx11-6:i386 \
    libxext6:i386 \
    libxft2:i386 \
    libxinerama1:i386 \
    libgtk2.0-0:i386 \
    libxmu6:i386 \
    lib32z1 \
    libxext6 \
    libx11-6 \
    libxft2 \
    libxt6

# Install image dependencies (including those for DPI)
RUN apt-get update && apt-get -y install \
    tzdata \
    libglib2.0-0 \
    expect \
    locales \
    wget \
    gcc-multilib \
    g++-multilib \
    && rm -rf /var/lib/apt/lists/*

# Set LOCALE to UTF8
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# Download ModelSim-Intel
RUN mkdir -p /root/modelsim \
    && cd /root/modelsim \    
    && wget -q http://download.altera.com/akdlm/software/acdsinst/20.1std.1/720/ib_installers/ModelSimSetup-20.1.1.720-linux.run -O ./ModelSimSetup-20.1.1.720-linux.run

# Install ModelSim-Intel
RUN cd /root/modelsim \
    && chmod +x ./ModelSimSetup-20.1.1.720-linux.run \
    && ./ModelSimSetup-20.1.1.720-linux.run --installdir /opt/altera/20.1 --accept_eula 1 --mode unattended \
    && rm -rf /root/modelsim

# Remove old GCC bundled with ModelSim
RUN rm -rf /opt/altera/20.1/modelsim_ase/gcc-*.*.*-linux

# Fix link
RUN ln -s /opt/altera/20.1/modelsim_ase/linux /opt/altera/20.1/modelsim_ase/linux_rh60

# Add ModelSim binaries to path 
RUN echo "/opt/altera/20.1/modelsim_ase/bin" >> /etc/toolchain-paths
ENV PATH="$PATH:$(cat /etc/toolchain-paths)"

# Log the tool's version
RUN echo "vsim -version" >> /etc/toolchain-tools

# Enter the shell
CMD ["/bin/bash"]