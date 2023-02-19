#!/usr/bin/env bash
set -e

PLACE=$(shuf -n 1 names.txt)

echo "Posting: ${PLACE}"

https -A bearer -a "${MASTODON_TOKEN}" --form POST "${MASTODON_BASE_URL}/api/v1/statuses" status="${PLACE}"