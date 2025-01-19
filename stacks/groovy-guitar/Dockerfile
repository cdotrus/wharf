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

# Merge tool information from across layers
RUN echo "$(cat /etc/toolchain-tools)" >> /etc/tools
RUN echo "$(cat /etc/development-tools)" >> /etc/tools

# Enter the shell
CMD ["/bin/bash"]