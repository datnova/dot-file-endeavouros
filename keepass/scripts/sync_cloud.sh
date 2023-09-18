#!/bin/bash

# Folder contain all databases of Keepassxc that you want to sync with on cloud.
SYNC_SOURCE_DIR=~/Keepass/databases/ 

# Target folder in cloud for storage databases.
SYNC_TARGET_DIR=Onedrive:Keepass/ 

rclone sync $SYNC_SOURCE_DIR $SYNC_TARGET_DIR && echo "[$(date +'%Y-%m-%d %H:%M:%S')] Done sync."
