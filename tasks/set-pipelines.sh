#!/usr/bin/env bash

set -e
set -x

fly -t target login -c "${CONCOURSE_URL}" $CONCOURSE_LOGIN

## echo at the end is to suppress grep error on no output
PIPELINES=$(fly -t target pipelines | tail -n +1 | awk '{print $1}' | grep -v "${SELF_UPDATE_NAME}" | xargs echo)
function load_configs() {
  local dir=$1
  for config in $(ls $dir); do
    NAME=$(echo $config | awk -F. '{print $1}')
    echo $NAME
    fly -t target set-pipeline -p $NAME -c $dir/$config -n
    fly -t target unpause-pipeline -p $NAME
  done
}

load_config ci-src
load_config ci-gen
