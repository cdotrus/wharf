# Creates a docker image for a development layer within the wharf project's
# hardware development stack.

# Build upon the operating system layer 
FROM ubuntu:22.04 AS os

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A development layer for common processes"

# Add supportive tools, scripting languages, etc. for workflow processes

# @@@ Python (https://www.python.org)
RUN apt-get update
RUN apt-get install -y \
    python3 \
    python3-pip

# Create symlink to call python3 as python
RUN ln -svT /usr/bin/python3 /usr/bin/python

# Configure Python for any scripting during simulations
RUN python -m pip install --upgrade pip

# Log the tool's version
RUN echo "python --version" >> /etc/development-tools


# @@@ Orbit (https://github.com/chaseruskin/orbit)
FROM chaseruskin/orbit:latest-ubuntu-22.04
COPY --from=os / /

# Log the tool's version
RUN echo "orbit --version" >> /etc/development-tools

# Download tools that are written in Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# @@@ Just (https://github.com/casey/just)
RUN $HOME/.cargo/bin/cargo install just
RUN cp "$HOME/.cargo/bin/just" "/usr/local/bin/just"

# Uninstall Rust tools
RUN $HOME/.cargo/bin/rustup self uninstall -y

# Log the tool's version
RUN echo "just --version" >> /etc/development-tools

# Enter the shell
CMD ["/bin/bash"]
