#!/usr/bin/env bash

set -e
set -x

echo "Yupi!"
apt-get update
apt-get install -y iputils-ping
ping ${CONCOURSE_URL} -c 1
