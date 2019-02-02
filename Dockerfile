FROM rocker/geospatial:latest
MAINTAINER "Noam Ross" ross@ecohealthalliance.org

## Some of the bigger installs first
RUN echo "MAKEFLAGS=-j$(nproc)"  >> /usr/local/lib/R/etc/Makevars.site \
  && install2.r --error --skipinstalled  \
  ape \
  bibtex \
  dotCall64 \
  fasterize \
  fields \
  fst \
  hexbin \
  jqr \
  lme4 \
  lwgeom \
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
