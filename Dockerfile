FROM ghcr.io/advplyr/audiobookshelf:latest

# Install rclone and fuse for mounting (Alpine Linux uses apk, not apt-get)
RUN apk add --no-cache rclone fuse

# Create mount point for Dropbox
RUN mkdir -p /dropbox

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose Audiobookshelf port
EXPOSE 3000

# Use custom startup script
CMD ["/start.sh"]
