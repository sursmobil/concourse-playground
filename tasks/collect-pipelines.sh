#!/usr/bin/env bash

set -e
set -x

cp ci-gen/pipelines/* pipelines

pushd pipelines >/dev/null

touch pipelines.yaml
echo "pipelines" > pipelines.yaml

for config in $(ls); do
  NAME=$(echo $config | awk -F. '{print $1}')
  CONFIG_FILE="pipelines/$config"

  set +x
  echo "- name: $NAME" >> pipelines.yaml
  echo "  team: $TEAM" >> pipelines.yaml
  echo "  config_file: $CONFIG_FILE" >> pipelines.yaml
  echo "  unpaused: true" >> pipelines.yaml
  set -x

done

cat pipelines.yaml

popd >/dev/null
