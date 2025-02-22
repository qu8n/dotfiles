#!/usr/bin/env zsh

# Go to the current directory
cd "$(dirname "$0")"

# Delete the old tar.gz file
rm -f raycast_backup.tar.gz 2>/dev/null || true

# Get the latest .rayconfig file based on the last modified time
# (In case multiple exports are present, we only want to keep the latest one)
latest_file=$(ls -t *.rayconfig 2>/dev/null | head -n 1)

# Clean up all .rayconfig files except the latest
if [[ -n "$latest_file" ]]; then
    echo "Deleting all .rayconfig files except the latest: $latest_file..."
    for file in *.rayconfig; do
        [[ "$file" != "$latest_file" ]] && rm -f -- "$file"
    done
else
    echo "No .rayconfig files found."
fi

# Create encrypted tar archive of the latest .rayconfig
if [[ -n "$latest_file" ]]; then
    # Use openssl to encrypt the tar archive with a password from pass
    tar czf - "$latest_file" | openssl enc -aes-256-cbc -salt -pbkdf2 -pass pass:"$(pass Raycast/BackupZip)" -out raycast_backup.tar.gz
else
    echo "No .rayconfig file to backup."
fi

# Delete the latest .rayconfig file
rm -f "$latest_file"
