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

# Re-export any toolchain environment variables that were dropped
# N/A

# Re-log the toolchain version information
RUN echo "ghdl --version" >> /etc/tools

# Enter the shell
CMD ["/bin/bash"]