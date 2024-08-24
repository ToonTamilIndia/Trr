# Start with a base image that has curl and bash
FROM ubuntu:20.04

# Set environment variable to avoid user interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download and install jiotv_go with user permissions to avoid permission issues
RUN curl -fsSL https://jiotv_go.rabil.me/install.sh -o /tmp/install.sh && \
    chmod +x /tmp/install.sh && \
    bash /tmp/install.sh

# Expose the port that jiotv_go will run on
EXPOSE 8080

# Command to run jiotv_go
CMD ["jiotv_go", "run"]
