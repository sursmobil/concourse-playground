#!/usr/bin/env bash

set -e
set -x

fly -t target login -c "${CONCOURSE_URL}" $CONCOURSE_LOGIN

## echo at the end is to suppress grep error on no output
PIPELINES=$(fly -t target pipelines | tail -n +1 | awk '{print $1}' | grep -v "${SELF_UPDATE_NAME}" | xargs echo)

pushd ci-src/pipelines >/dev/null
for config in $(ls); do
  NAME=$(echo $config | awk -F. '{print $1}')
  echo $NAME
  fly -t target set-pipeline -p $NAME -c $config -n
done
popd >/dev/null
