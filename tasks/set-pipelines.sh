#!/usr/bin/env bash

set -e
set -x

echo "Yupi!"
ip a
ping ${CONCOURSE_URL} -c 1
