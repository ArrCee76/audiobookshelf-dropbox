#!/bin/sh
set -e

echo "Setting up rclone for Dropbox..."

# Create rclone config directory
mkdir -p /root/.config/rclone

# Create rclone config from environment variable
cat > /root/.config/rclone/rclone.conf << EOF
[dropbox]
type = dropbox
token = {"access_token":"${DROPBOX_ACCESS_TOKEN}"}
EOF

echo "Mounting Dropbox..."

# Mount Dropbox in the background
rclone mount dropbox:${DROPBOX_AUDIOBOOKS_PATH} /dropbox \
  --allow-other \
  --vfs-cache-mode writes \
  --vfs-cache-max-age 24h \
  --dir-cache-time 24h \
  --poll-interval 15s \
  --log-level INFO &

# Wait for mount to be ready
echo "Waiting for Dropbox mount..."
sleep 5

# Verify mount is working
if mountpoint -q /dropbox; then
    echo "✓ Dropbox successfully mounted at /dropbox"
    ls -la /dropbox
else
    echo "✗ Failed to mount Dropbox"
    exit 1
fi

echo "Starting Audiobookshelf..."

# Start Audiobookshelf
exec node /app/index.js
