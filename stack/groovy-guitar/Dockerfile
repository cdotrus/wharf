# Dock: Create a docker image containing tools and programs required
#   to run VHDL simulations.

# Build upon toolchain layer
FROM chaseruskin/ghdl-mcode:latest-ubuntu-22.04

LABEL maintainer="Chase Ruskin"
LABEL description="Hardware development stack"

# Add supportive tools, scripting languages, etc.

# *** Python (https://www.python.org)
FROM brunneis/python:3.8.6-ubuntu-20.04

# Configure Python for any scripting during simulations
RUN python -m pip install --upgrade pip

COPY --from=0 / /


# *** Orbit (https://github.com/chaseruskin/orbit)
FROM chaseruskin/orbit:latest-ubuntu-22.04

COPY --from=1 / /


# *** Just (https://github.com/casey/just)

# Stage 0: Orbit layer (1st step)






# Stage 2: FPGA Toolchain layer (GHDL simulator)
FROM chaseruskin/ghdl-mcode:latest-ubuntu-22.04



# Enter the shell
CMD ["bash"]