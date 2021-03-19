# Install devtools, rmarkdown, knitr, testthat and Rcpp if not already available
install.packages(c("rmarkdown", "Rcpp", "knitr", "testthat", "remotes", "qpdf", "randomForest"))

# check the environment type
environment_type <- Sys.getenv("SITS_ENVIRONMENT_TYPE")
environment_type <- if (environment_type == "full") TRUE else NA

remotes::install_deps(dependencies = environment_type)

# install sits
Sys.setenv("R_INSTALL_PACKAGES_ELAPSED_TIMEOUT"="360")

sits_hash <- Sys.getenv("SITS_COMMIT_HASH_VERSION")
insitu_hash <- Sys.getenv("SITS_INSITU_COMMIT_HASH_VERSION")

remotes::install_github(paste0("e-sensing/sits@", sits_hash))
remotes::install_github(paste0("e-sensing/inSitu@", insitu_hash))
