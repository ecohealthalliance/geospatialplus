FROM rocker/geospatial:latest
MAINTAINER "Noam Ross" ross@ecohealthalliance.org

## Some of the bigger installs first
RUN echo "MAKEFLAGS=-j$(nproc)"  >> /usr/local/lib/R/etc/Makevars.site \
  && installGithub.r eddelbuettel/littler \
  && ln -sf /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
  && ln -sf /usr/local/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
  && ln -sf /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r \
  && install2.r --error --skipinstalled -n `nproc` \
  ape \
  bibtex \
  dotCall64 \
  fasterize \
  fields \
  fst \
  hexbin \
  jqr \
  lme4 \
  matrixStats \
  minqa \
  MonetDBLite \
  mvtnorm \
  nleqslv \
  nloptr \
  officer \
  prioritizr \
  RcppArmadillo \
  RcppEigen \
  RcppGSL \
  RcppZiggurat \
  reticulate \
  Rglpk \
  rjags \
  rJava \
  RJSONIO \
  rstan \
  rstanarm \
  Rsymphony \
  runjags \
  rvg \
  slam \
  spam \
  StanHeaders \
  vegan \
  xgboost \
  zip \
  && rm /usr/local/lib/R/etc/Makevars.site
