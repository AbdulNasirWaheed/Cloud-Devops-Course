#!/bin/bash
# backup_projects.sh
# Usage: bash backup_projects.sh /path/to/source /path/to/backup_dir

SOURCE_DIR="${1:-/home/ubuntu/projects}"
BACKUP_DIR="${2:-/var/backups/projects}"
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
ARCHIVE_NAME="projects_backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$SOURCE_DIR" .
# Optional: remove backups older than 30 days
find "$BACKUP_DIR" -type f -name "projects_backup_*.tar.gz" -mtime +30 -delete
