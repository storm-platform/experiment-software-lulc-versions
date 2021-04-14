#!/bin/bash

SITS_COMMIT_HASH_VERSION=13f6867b9e6b5f5e226ad5d97b93267fa8267d75

#
# build
#
cd environment
./build.sh

cd ..

#
# run
#
docker run -ti -d --name sits_classification_${SITS_COMMIT_HASH_VERSION} \
    -v ${PWD}/classification.R:/opt/classification/classification_script.R \
    -v ${PWD}/classification-results:/opt/classification/results \
    m3nin0/rep-lulc-version:${SITS_COMMIT_HASH_VERSION} \
    Rscript classification_script.R
