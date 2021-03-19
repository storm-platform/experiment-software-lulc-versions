FROM m3nin0/rep-lulc-version-base:latest

# install user extra packages
COPY extras.R .

ARG SITS_COMMIT_HASH_VERSION
ARG SITS_INSITU_COMMIT_HASH_VERSION

ARG SITS_ENVIRONMENT_TYPE

RUN wget https://raw.githubusercontent.com/e-sensing/sits/${SITS_COMMIT_HASH_VERSION}/DESCRIPTION \
    && Rscript extras.R \
    && rm extras.R DESCRIPTION

USER ${ROOT_USER}
