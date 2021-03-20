#!/bin/bash

SITS_COMMIT_HASH_VERSION=f0a9de020c2c4d2891523cd14ca452aac69790ae

docker run -ti -d --name sits_classification_${SITS_COMMIT_HASH_VERSION} \
    -v ${PWD}/classification.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-version:${SITS_COMMIT_HASH_VERSION}
