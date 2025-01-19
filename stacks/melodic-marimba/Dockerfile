# A hardware development stack around modelsim-intel.

# Start with the operating system layer 
FROM ubuntu:22.04 AS os

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack using modelsim-intel"

# Add the toolchain layer
FROM chaseruskin/modelsim-intel:20.1.1-ubuntu-22.04 AS toolchain

# Re-export any toolchain environment variables that were dropped
ENV PATH="$PATH:$(cat /etc/toolchain-paths)"

COPY --from=os / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04 AS development

COPY --from=toolchain / /

# Merge tool information from across layers
RUN echo "$(cat /etc/toolchain-tools)" >> /etc/tools
RUN echo "$(cat /etc/development-tools)" >> /etc/tools

# Enter the shell
CMD ["/bin/bash"]