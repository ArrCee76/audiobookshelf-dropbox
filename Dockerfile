FROM ghcr.io/advplyr/audiobookshelf:latest

# Install rclone and fuse for mounting
RUN apt-get update && \
    apt-get install -y rclone fuse && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create mount point for Dropbox
RUN mkdir -p /dropbox

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Audiobookshelf port
EXPOSE 3000

# Use custom startup script
CMD ["/start.sh"]
