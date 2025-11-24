# Use a lightweight base image
FROM ubuntu:22.04

# Prevent interactive tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install useful tools
RUN apt update && apt install -y \
    bash \
    curl \
    vim \
    iputils-ping \
    && apt clean

# Create a working directory
WORKDIR /app

# Default command (keeps container alive)
CMD ["bash"]
