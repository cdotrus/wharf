# Creates a docker image for a toolchain layer within the wharf project's
# hardware development stack.

# Use existing image for ghdl
FROM ghdl/ghdl:5.0.0-dev-mcode-ubuntu-22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A toolchain layer for ghdl"

# Add ghdl binary to path
ENV PATH="$PATH:/opt/ghdl/bin"

# Log the tool's version
RUN echo "ghdl --version" >> /etc/toolchain-tools

# Enter the shell
CMD ["/bin/bash"]