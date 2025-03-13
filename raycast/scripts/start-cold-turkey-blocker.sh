#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Cold Turkey Blocker
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🦃

# Documentation:
# @raycast.author qu8n
# @raycast.authorURL https://raycast.com/qu8n
# @raycast.argument1 { "type": "text", "placeholder": "minutes to block"}

"/Applications/Cold Turkey Blocker.app/Contents/MacOS/Cold Turkey Blocker" -start "Distractions" -lock $1

echo "Cold Turkey Blocker started for $1 minutes"