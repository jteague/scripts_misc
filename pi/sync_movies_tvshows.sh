#!/bin/bash

# Variables
REMOTE_USER=""
REMOTE_HOST=""
REMOTE_PATH="~/files/Plex"
LOCAL_PATH="/mnt/bertha/media"
SSH_FILE="/home/jteague/.ssh/id_rsa"
EXCLUDE_FILE="/home/jteague/scripts/rsync_exclude.txt"
LOG_FILE="/home/jteague/scripts/sync_movies_tvshows.log"

# Log start time
echo "====================================================" >> "$LOG_FILE"
echo "$(date) - Sync started" >> "$LOG_FILE"
echo "====================================================" >> "$LOG_FILE"

# Sync TV Shows
rsync -avz -e "ssh -i ${SSH_FILE}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/tv_renamed/" "${LOCAL_PATH}/tvshows/" --exclude-from="${EXCLUDE_FILE}" --no-owner --no-group

# Sync Movies
rsync -avz -e "ssh -i ${SSH_FILE}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/movie_renamed/" "${LOCAL_PATH}/movies/" --exclude-from="${EXCLUDE_FILE}" --no-owner --no-group

# Log end time
echo "====================================================" >> "$LOG_FILE"
echo "$(date) - Sync finished" >> "$LOG_FILE"
echo "====================================================" >> "$LOG_FILE"
