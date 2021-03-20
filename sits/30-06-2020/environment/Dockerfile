FROM m3nin0/rep-lulc-version-base:latest

# install user extra packages
COPY extras.R .

ARG SITS_COMMIT_HASH_VERSION
ARG SITS_INSITU_COMMIT_HASH_VERSION

ARG SITS_ENVIRONMENT_TYPE

RUN git clone https://github.com/e-sensing/sits \
    && cd sits \
    && git reset --hard ${SITS_COMMIT_HASH_VERSION} \
    && sed -i -e 's/wtss/Rwtss/g' DESCRIPTION && sed -i -e 's/sits_Rwtss.R/sits_wtss.R/' DESCRIPTION

RUN Rscript extras.R

USER ${ROOT_USER}
