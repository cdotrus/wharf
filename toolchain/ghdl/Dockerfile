# Creates a docker image for a toolchain layer within the wharf project's
# hardware development stack.

# Use existing image for ghdl
FROM ghdl/ghdl:ubuntu22-mcode

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A toolchain layer for ghdl"

# Add ghdl binary to path
# N/A - already found on path

# Log the tool's version
RUN echo "ghdl --version" >> /etc/toolchain-tools

# Enter the shell
CMD ["/bin/bash"]