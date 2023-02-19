#!/usr/bin/env bash
set -e

PLACE=$(shuf -n 1 names.txt)

echo "Posting: ${PLACE}"

https -A bearer -a "${BEARER_TOKEN}" --form POST "${INSTANCE_HOST}/api/v1/statuses" status="${PLACE}"