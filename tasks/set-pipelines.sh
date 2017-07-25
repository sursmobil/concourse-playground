#!/usr/bin/env bash

set -e
set -x

echo "Yupi!"
apt-get update
apt-get install -y wget
wget "${CONCOURSE_URL}/api/v1/cli?arch=amd64&platform=linux" -O fly
chmod +x ./fly
./fly --help
