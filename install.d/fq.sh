#!/usr/bin/env bash

set -eux

REPO="wader/fq"
TARGET_DIR="/usr/local/bin"
TARGET="${TARGET_DIR}/fq"
RELEASE_FILTER="linux_amd64"

DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" \
  | jq --raw-output '.assets[] | select(.name | match("'${RELEASE_FILTER}'")) | .browser_download_url' \
  | head -1)

curl -s -L "${DOWNLOAD_URL}" \
  | sudo tar -xz -C "${TARGET_DIR}"

sudo chmod +x "${TARGET}"
