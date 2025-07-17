#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Finder item with NeoVim
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 💤

# Documentation:
# @raycast.author qu8n
# @raycast.authorURL https://raycast.com/qu8n

FILEPATH=$(osascript -e 'tell application "Finder" to get POSIX path of (selection as alias)')

osascript <<EOF
tell application "Ghostty"
    activate
    try
        set currentWindow to current window
        tell currentWindow
            create tab with default profile
            tell current session of current tab
                write text "nvim \"${FILEPATH}\""
            end tell
        end tell
    on error
        create window with default profile
        tell current session of current window
            write text "nvim \"${FILEPATH}\""
        end tell
    end try
end tell
EOF
