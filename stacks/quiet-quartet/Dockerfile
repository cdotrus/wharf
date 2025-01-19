# A hardware development stack around quartus-prime-lite.

# Start with the operating system layer 
FROM ubuntu:22.04 AS os

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack using quartus-prime-lite"

# Add the toolchain layer
FROM chaseruskin/quartus-prime-lite:23.1.1-ubuntu-22.04 AS toolchain

# Re-export any toolchain environment variables that were dropped
RUN export PATH="$PATH:$(cat /etc/toolchain-paths)"

COPY --from=os / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04 AS development

COPY --from=toolchain / /

# Merge tool information from across layers
RUN echo "$(cat /etc/toolchain-tools)" >> /etc/tools
RUN echo "$(cat /etc/development-tools)" >> /etc/tools

RUN echo "$PATH"

# Enter the shell
CMD ["/bin/bash"]