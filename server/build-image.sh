#!/bin/sh

app_dir=${1:-/app}

IMAGE_NAME=cyberdojo/differ_server
docker build --build-arg app_dir=${app_dir} --tag ${IMAGE_NAME} .
if [ $? != 0 ]; then
  echo "FAILED TO BUILD ${IMAGE_NAME}"
  exit 1
fi
