#!/bin/bash

SOURCE="/var/www"
DEST="/backup"
DATE=$(date +%F)

tar -czf "$DEST/backup-$DATE.tar.gz" "$SOURCE"

echo "✅ Backup completed"
