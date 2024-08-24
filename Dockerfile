# Start with a base image that has curl and bash
FROM ubuntu:20.04

# Set environment variable to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Download and install jiotv_go
RUN curl -fsSL https://jiotv_go.rabil.me/install.sh | bash

# Command to run jiotv_go
CMD ["jiotv_go", "run"]
