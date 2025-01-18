FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    gcc-multilib \
    libxext6 \
    libx11-6 \
    libxft2 \
    libxt6 \
    libglib2.0-0 \
    wget \
    xz-utils \
    curl \
    python-is-python3 \
    cargo \
    git \
    just \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# set up modelsim
WORKDIR /opt/modelsim

COPY ./modelsim.run /opt/modelsim/

RUN chmod +x modelsim.run && ./modelsim.run --mode unattended --accept_eula 1

ENV PATH="/root/intelFPGA/20.1/modelsim_ase/bin:$PATH"

RUN dpkg --add-architecture i386 && apt-get update

RUN sudo apt-get install -y \
    libc6:i386 \
    libstdc++6:i386 \
    libx11-6:i386 \
    libxext6:i386 \
    libxft2:i386 \
    libxinerama1:i386 \
    libgtk2.0-0:i386 \
    libxmu6:i386 \
    lib32z1

# setup orbit
WORKDIR /opt/orbit

RUN curl -LO https://github.com/chaseruskin/orbit/releases/download/0.22.1/orbit-0.22.1-x86_64-linux.zip && unzip orbit-0.22.1-x86_64-linux.zip && mv ./orbit-0.22.1-x86_64-linux/bin/orbit /usr/local/bin/orbit

# setup verb
WORKDIR /opt/verb

COPY verb-0.1.0-py3-none-any.whl /opt/verb/

RUN apt-get update && apt-get install -y \
    python3-pip
    
RUN rm -f /usr/lib/python3.*/EXTERNALLY-MANAGED && curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/chaseruskin/verb/trunk/install.sh | bash -s --

RUN apt-get install -y python3-bitstring && cargo install --git https://github.com/chaseruskin/verb.git

ENV PATH="/root/.cargo/bin:$PATH"

# setup riscv
WORKDIR /opt/riscv

RUN apt-get update && sudo apt-get install -y \ 
    cmake \ 
    autoconf \ 
    automake \ 
    autotools-dev \ 
    curl \ 
    libmpc-dev \ 
    libmpfr-dev \ 
    libgmp-dev \ 
    gawk \ 
    build-essential \ 
    bison \ 
    flex \ 
    texinfo \ 
    gperf \ 
    patchutils \ 
    bc \ 
    zlib1g-dev \ 
    libexpat-dev \ 
    libtool \ 
    pkg-config \ 
    mingw-w64 \ 
    mingw-w64-tools \ 
    texlive \ 
    zip \ 
    gettext \ 
    libglib2.0-dev \ 
    libpixman-1-dev \ 
    swig \ 
    ninja-build \ 
    python3

COPY riscv /opt/riscv

ENV PATH="/opt/riscv/bin:$PATH"

# setup python3.8

WORKDIR /opt/python

RUN sudo apt update && sudo apt install -y \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    curl \
    nano

RUN curl -O https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz && tar -xvf Python-3.8.10.tgz
WORKDIR /opt/python/Python-3.8.10
RUN ./configure --enable-optimizations && make -j 4 && sudo make altinstall

# setup elf2hex (part of riscv)

WORKDIR /opt/riscv

RUN wget https://github.com/sifive/elf2hex/releases/download/v1.0.1/elf2hex-1.0.1.tar.gz
RUN tar -xvzpf elf2hex-1.0.1.tar.gz
WORKDIR /opt/riscv/elf2hex-1.0.1
RUN ./configure --target=riscv64-unknown-elf PYTHON=python3.8 && make && make install && rm /opt/riscv/bin/elf2hex

ENV PATH="/opt/riscv/elf2hex-1.0.1:$PATH"

# move to workspace
WORKDIR /workspace

CMD ["/bin/bash"]