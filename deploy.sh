#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$SCRIPT_DIR"

if [ ! -f .env ]; then
  echo "missing .env" >&2
  exit 1
fi

. ./.env

if [ -z "${CURRENT_RELEASE_TAG:-}" ]; then
  echo "missing CURRENT_RELEASE_TAG in .env" >&2
  exit 1
fi

echo "pulling images for tag $CURRENT_RELEASE_TAG"
docker compose --env-file .env --env-file .tag pull

echo "starting services for tag $CURRENT_RELEASE_TAG"
docker compose --env-file .env --env-file .tag up -d

echo "current status"
docker compose --env-file .env --env-file .tag ps