#!/usr/bin/env zsh

# Go to the current directory
cd "$(dirname "$0")"

# Get the latest .rayconfig file based on the last modified time
# (In case multiple exports are present, we only want to keep the latest one)
latest_file=$(ls -t *.rayconfig 2>/dev/null | head -n 1)

if [[ -n "$latest_file" ]]; then
    echo "Deleting the old .gz file..."
    rm -f raycast_backup.gz 2>/dev/null || true

    echo "Deleting any old .rayconfig files..."
    for file in *.rayconfig; do
        [[ "$file" != "$latest_file" ]] && rm -f -- "$file"
    done

    echo "Creating the .gz file..."
       gzip -c "$latest_file" | openssl enc -aes-256-cbc -salt -pbkdf2 -pass pass:"$(pass Raycast/BackupZip)" -out raycast_backup.gz

    echo "Deleting the .rayconfig file..."
    rm -f "$latest_file"
else
    echo "No .rayconfig files found. Export one from Raycast Settings > Advanced > Export."
fi
