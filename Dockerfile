FROM ubuntu:22.04

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install nginx
RUN apt update && apt install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Copy your site into the default nginx web root
# Assumes index.html is next to this Dockerfile in your repo
COPY index.html /var/www/html/index.html

# Optionally remove the default nginx index (if it exists)
# RUN rm -f /var/www/html/index.nginx-debian.html

# Expose HTTP port
EXPOSE 80

# Run nginx in the foreground (keeps container alive)
CMD ["nginx", "-g", "daemon off;"]
