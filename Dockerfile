FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install nginx + envsubst (from gettext-base)
RUN apt update && apt install -y nginx gettext-base && \
    rm -rf /var/lib/apt/lists/*

# Copy template HTML (note the .template)
COPY index.html /var/www/html/index.html.template

EXPOSE 80

# Replace env vars at startup, then run nginx, this puts variables in html file that can be read from deploy.yaml at POD startup, POD startup has correct variables
CMD ["/bin/sh", "-c", "envsubst < /var/www/html/index.html.template > /var/www/html/index.html && nginx -g 'daemon off;'"]
