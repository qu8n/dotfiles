#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run in new iTerm tab
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚀

# Documentation:
# @raycast.author qu8n
# @raycast.authorURL https://raycast.com/qu8n
# @raycast.argument1 { "type": "text", "placeholder": "command to run" }

cmd="$1"
osascript <<EOF
tell application "iTerm"
    activate
    try
        set currentWindow to current window
        tell currentWindow
            create tab with default profile
            tell current session of current tab
                write text "${cmd}"
            end tell
        end tell
    on error
        create window with default profile
        tell current session of current window
            write text "${cmd}"
        end tell
    end try
end tell
EOF
