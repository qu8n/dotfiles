#!/usr/bin/env zsh

# Go to the current directory
cd "$(dirname "$0")"

if [[ ! -f raycast_backup.gz ]]; then
    echo "Error: raycast_backup.gz not found!"
    exit 1
fi

echo "Decrypting and extracting backup..."
openssl enc -d -aes-256-cbc -salt -pbkdf2 -pass pass:"$(pass Raycast/BackupZip)" -in raycast_backup.gz | gunzip -c > raycast_backup.rayconfig

if [[ $? -eq 0 ]]; then
    echo "Backup restored successfully!"
    echo "You can now import the .rayconfig file in Raycast Settings > Advanced > Import."
else
    echo "Error: Failed to decrypt or extract the backup."
    echo "Please make sure you have the correct password in your password store."
    exit 1
fi
