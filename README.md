# Audiobookshelf with Dropbox on Railway

Deploy Audiobookshelf on Railway with Dropbox storage integration.

## What You Need

- Dropbox account with audiobooks
- Dropbox API access token
- Railway account

## Files in This Repo

- `Dockerfile` - Custom container with rclone for Dropbox mounting
- `start.sh` - Startup script that mounts Dropbox and starts Audiobookshelf
- `nixpacks.toml` - Railway configuration for FUSE support
- `.gitignore` - Git ignore rules

## Deploy to Railway

1. Connect this GitHub repo to Railway
2. Add environment variables (see below)
3. Add a volume for `/config`
4. Deploy!

## Environment Variables

Add these in Railway:

```
DROPBOX_ACCESS_TOKEN=sl.xxxxxxxxxxxxxxxxxxxxx
DROPBOX_AUDIOBOOKS_PATH=/Audiobooks
PORT=3000
```

## Volume Setup

Create a volume in Railway:
- Mount path: `/config`
- Size: 1GB (for user data, progress, database)

## After Deployment

1. Visit your Railway URL
2. Create admin account
3. Settings → Libraries → Add Library
   - Folder: `/dropbox`
4. Scan library

## Cost

- Railway: ~$2-3/month (just the app)
- Dropbox: Your existing subscription
- **Total new cost: $2-3/month**
