# Install devtools, rmarkdown, knitr, testthat and Rcpp if not already available
install.packages(c("rmarkdown", "Rcpp", "knitr", "testthat", "remotes", "qpdf", "ranger"))

# install sits
Sys.setenv("R_INSTALL_PACKAGES_ELAPSED_TIMEOUT"="360")

remotes::install_local("sits")

# inSitu
insitu_hash <- Sys.getenv("SITS_INSITU_COMMIT_HASH_VERSION")
remotes::install_github(paste0("e-sensing/inSitu@", insitu_hash))
