# Use an official lightweight C++ development image
FROM ubuntu:22.04

# Install basic dev tools and readline library
RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    make \
    libreadline-dev \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Build the project
RUN mkdir build && cd build && cmake .. && make

# Set the default command to run the shell
CMD ["./build/shell"]

