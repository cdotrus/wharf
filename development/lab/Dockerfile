# Creates a docker image for a development layer within the wharf project's
# hardware development stack.

# Build upon the operating system layer 
FROM ubuntu:22.04

# Custom image metadata
LABEL maintainer="Chase Ruskin"
LABEL description="A development layer for common processes"

# Add supportive tools, scripting languages, etc. for workflow processes

# @@@ Python (https://www.python.org)
FROM brunneis/python:3.8.6-ubuntu-20.04

# Configure Python for any scripting during simulations
RUN python -m pip install --upgrade pip

COPY --from=0 / /


# @@@ Orbit (https://github.com/chaseruskin/orbit)
FROM chaseruskin/orbit:latest-ubuntu-22.04

COPY --from=1 / /


# Download tools that are written in Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# @@@ Just (https://github.com/casey/just)
RUN $HOME/.cargo/bin/cargo install just
RUN cp "$HOME/.cargo/bin/just" "/usr/local/bin/just"

# Uninstall Rust tools
RUN $HOME/.cargo/bin/rustup self uninstall -y


# Enter the shell
CMD ["/bin/bash"]
