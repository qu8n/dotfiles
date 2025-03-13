#!/bin/zsh

echo "Stopping Neo4j and Docker..."

docker stop neo4j
osascript -e 'quit app "Docker"'
pkill -f Docker

while pgrep -x "Docker" > /dev/null; do
  sleep 1;
done

echo "Done!"
