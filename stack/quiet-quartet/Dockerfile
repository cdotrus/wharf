# A hardware development stack around quartus-prime-lite.

# Start with the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack around quartus-prime-lite"

# Add the toolchain layer
FROM chaseruskin/quartus-prime-lite:23.1.1-ubuntu-22.04

COPY --from=0 / /

# Re-export any toolchain environment variables
ENV PATH="$PATH:/opt/intel/23.1/quartus/bin"

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04

COPY --from=1 / /

# Enter the shell
CMD ["/bin/bash"]