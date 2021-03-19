#!/bin/bash

SITS_COMMIT_HASH_VERSION="8f0f8075d55dfa3d94c03c4c7160114b9aee722b"
SITS_INSITU_COMMIT_HASH_VERSION="772e0dda670d7bb5afcf68473b124287387be87a"

docker build \
    --build-arg  SITS_INSITU_COMMIT_HASH_VERSION=${SITS_INSITU_COMMIT_HASH_VERSION} \
    --build-arg  SITS_COMMIT_HASH_VERSION=${SITS_COMMIT_HASH_VERSION} \
    -t "m3nin0/rep-lulc-version:${SITS_COMMIT_HASH_VERSION}" \
    .
