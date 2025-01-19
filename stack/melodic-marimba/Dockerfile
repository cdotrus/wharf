# A hardware development stack around modelsim-intel.

# Start with the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A hardware development stack around modelsim-intel"

# Add the toolchain layer
FROM chaseruskin/modelsim-intel:20.1.1-ubuntu-22.04

COPY --from=0 / /

# Add the development layer
FROM chaseruskin/lab:latest-ubuntu-22.04

COPY --from=1 / /

# Re-export any toolchain environment variables that were dropped
ENV PATH="$PATH:/opt/altera/20.1/modelsim_ase/bin"

# Enter the shell
CMD ["/bin/bash"]