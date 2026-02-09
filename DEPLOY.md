# Railway Deployment Instructions

## Step 1: Upload to GitHub

1. Create new repo: `audiobookshelf-dropbox`
2. Upload these files:
   - Dockerfile
   - start.sh
   - nixpacks.toml
   - .gitignore
   - README.md

## Step 2: Connect to Railway

1. Go to https://railway.app
2. Click "New Project"
3. Click "Deploy from GitHub repo"
4. Select your `audiobookshelf-dropbox` repo
5. Wait for initial build

## Step 3: Add Environment Variables

In Railway project → Variables tab:

```
DROPBOX_ACCESS_TOKEN=YOUR_TOKEN_HERE
DROPBOX_AUDIOBOOKS_PATH=/Audiobooks
PORT=3000
```

Replace `YOUR_TOKEN_HERE` with your actual Dropbox token (starts with `sl.`)

## Step 4: Add Volume

In Railway project → Settings → Volumes:

1. Click "New Volume"
2. Mount path: `/config`
3. Click "Add"

## Step 5: Generate Domain

In Railway project → Settings → Networking:

1. Click "Generate Domain"
2. Copy the URL (like `audiobookshelf-production-xyz.up.railway.app`)

## Step 6: Redeploy

1. Go to Deployments tab
2. Click three dots on latest deployment
3. Click "Redeploy"

## Step 7: First Time Setup

1. Visit your Railway URL
2. Create admin account (first user = admin)
3. Go to Settings → Libraries → Add Library
   - Name: "My Audiobooks"
   - Folder: `/dropbox`
4. Click "Scan"

## Troubleshooting

**Container keeps restarting:**
- Check Railway logs
- Verify DROPBOX_ACCESS_TOKEN is correct
- Verify DROPBOX_AUDIOBOOKS_PATH exists

**No books showing:**
- Make sure files are uploaded to Dropbox
- Check folder path is `/Audiobooks`
- Run manual scan in library settings

**Can't connect from mobile:**
- Use full Railway URL (https://...)
- Check credentials are correct
