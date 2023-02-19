#!/usr/bin/env bash
set -e

PLACE=$(shuf -n 1 /app/names.txt)

echo "Posting: ${PLACE}"

https --ignore-stdin --form POST "${MASTODON_BASE_URL}/api/v1/statuses" status="${PLACE}" "Authorization:Bearer ${MASTODON_TOKEN}"