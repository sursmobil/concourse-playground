#!/usr/bin/env bash

set -e
set -x

fly -t target login -c "${CONCOURSE_URL}" $CONCOURSE_LOGIN
fly -t target pipelines

ls ci-src/pipelines
