#!/bin/bash

SITS_COMMIT_HASH_VERSION=6629e8088e7cd941522d471a571929b97cbc906e

docker run -ti -d --name sits_classification_${SITS_COMMIT_HASH_VERSION} \
    -v ${PWD}/classification.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-version:${SITS_COMMIT_HASH_VERSION}
