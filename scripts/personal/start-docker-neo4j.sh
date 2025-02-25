#!/bin/zsh

printf "Starting Docker...";
open -a Docker.app;
while [[ -z "$(! docker stats --no-stream 2> /dev/null)" ]]; do
  printf ".";
  sleep 1
done
echo "Done!";

echo "Starting Neo4j...";
cd "/Users/$USER/dev/mskcc/smile-dashboard";
docker compose up -d;

WAIT_TIME_MINUTES=3
SLEEP_INTERVAL_SECONDS=2
MAX_ATTEMPTS=$((WAIT_TIME_MINUTES * 60 / SLEEP_INTERVAL_SECONDS))
attempt=0
while true; do
  status=`docker inspect -f {{.State.Health.Status}} neo4j 2>/dev/null`

  if [ "$status" = "healthy" ]; then
    echo "Neo4j is up and healthy!"
    break
  elif [ "$status" = "unhealthy" ]; then
    echo "\nError: Neo4j container is unhealthy. Check container logs with: docker logs neo4j"
    exit 1
  elif [ -z "$status" ]; then
    echo "\nError: Neo4j container not found or not running"
    exit 1
  fi

  attempt=$((attempt + 1))
  if [ $attempt -ge $MAX_ATTEMPTS ]; then
    echo "\nTimeout: Neo4j failed to become healthy after 5 minutes"
    echo "Check container logs with: docker logs neo4j"
    exit 1
  fi

  printf "."
  sleep $SLEEP_INTERVAL_SECONDS
done
