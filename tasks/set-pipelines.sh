#!/usr/bin/env bash

set -e
set -x

echo "Yupi!"
apt-get update
apt-get install -y wget
wget http://192.168.100.4:8080/api/v1/cli?arch=amd64&platform=linux -O fly
chmod +x ./fly
./fly --help
