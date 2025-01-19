# Creates a docker image for a toolchain layer within the wharf project's
# hardware development stack.

# Use existing image for ghdl
FROM ghdl/ghdl:ubuntu22-mcode

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A toolchain layer for ghdl"

# Log the tool's version
RUN echo "ghdl --version" >> /etc/tools

# Enter the shell
CMD ["/bin/bash"]