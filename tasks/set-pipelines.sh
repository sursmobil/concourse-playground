#!/usr/bin/env bash

set -e
set -x

apt-get update
apt-get install -y wget
wget "${CONCOURSE_URL}/api/v1/cli?arch=amd64&platform=linux" -O fly
chmod +x ./fly

./fly -t target login -c "${CONCOURSE_URL}" $CONCOURSE_LOGIN
./fly -t target pipelines
