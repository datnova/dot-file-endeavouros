#!/bin/bash

CLOUDS=("Box" "Dropbox" "Gdrive" "Yandisk")
BACKUP_SOURCE_DIR=~/.config/Keepassxc/backups/
BACKUP_TARGET_DIR=Keepass/Backups/ 

for cloud in "${CLOUDS[@]}"; do
	rclone sync $BACKUP_SOURCE_DIR $cloud:$BACKUP_TARGET_DIR && echo "[$(date +'%Y-%m-%d %H:%M:%S')] Done backup to $cloud."
done
