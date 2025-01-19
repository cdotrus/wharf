# A hardware development stack around ghdl.

# Start with the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack around ghdl"

# Add the toolchain layer
FROM chaseruskin/ghdl-mcode:latest-ubuntu-22.04

COPY --from=0 / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04

COPY --from=1 / /

# Enter the shell
CMD ["/bin/bash"]