#!/usr/bin/env bash

set -eux

REPO="obsidianmd/obsidian-releases"
TARGET_DIR="."
TARGET="${TARGET_DIR}/obsidian.deb"
RELEASE_FILTER="amd64.deb"

DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" \
  | jq --raw-output '.assets[] | select(.name | match("'${RELEASE_FILTER}'")) | .browser_download_url' \
  | head -1)

curl -s -L "${DOWNLOAD_URL}" -o "${TARGET}"

sudo dpkg -i "${TARGET}"
rm "${TARGET}"
