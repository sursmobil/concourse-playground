#!/usr/bin/env bash

set -e
set -x

echo "Yupi!"
ping ${CONCOURSE_URL} -c 1
