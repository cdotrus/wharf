# A hardware development stack around ghdl.

# Start with the operating system layer 
FROM ubuntu:22.04 AS os

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack using ghdl"

# Add the toolchain layer
FROM chaseruskin/ghdl-mcode:5.0.0-dev-ubuntu-22.04 AS toolchain

COPY --from=os / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04 AS development

COPY --from=toolchain / /

# Merge tool information from across layers
RUN echo "$(cat /etc/toolchain-tools)" >> /etc/tools
RUN echo "$(cat /etc/development-tools)" >> /etc/tools

# Re-export any toolchain environment variables that were dropped
ENV PATH="$PATH:/opt/ghdl/bin"

# Enter the shell
CMD ["/bin/bash"]