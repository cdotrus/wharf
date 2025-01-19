# A hardware development stack around ghdl.

# Start with the operating system layer 
FROM ubuntu:22.04 as os

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack around ghdl"

# Add the toolchain layer
FROM chaseruskin/ghdl-mcode:latest-ubuntu-22.04

COPY --from=os / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04 AS toolchain

COPY --from=toolchain / /

# Re-export any toolchain environment variables that were dropped
# N/A

# Merge tool information from across layers
RUN echo "$(cat /etc/toolchain-tools)" >> /etc/tools
RUN echo "$(cat /etc/development-tools)" >> /etc/tools

# Enter the shell
CMD ["/bin/bash"]