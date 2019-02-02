FROM rocker/geospatial:latest
MAINTAINER "Noam Ross" ross@ecohealthalliance.org

## Additional apt packages
RUN apt-get update && apt-get install -y --force-yes --allow-unauthenticated --no-install-recommends --no-upgrade \
  apt-transport-https \
  build-essential \
  byobu \
  ccache \
  coinor-libcgl-dev \
  coinor-libsymphony-dev \
  coinor-symphony \
  coinor-symphony \
  curl \
  dirmngr \
  fish \
  git-core \
  gnupg2 \
  gnupg \
  golang-1.8 \
  golang-go \
  graphviz \
  grass \
  grass-dev \
  grass-doc \
  htop \
  jags \
  libclang-dev \
  libglpk-dev \
  libgoogle-perftools-dev \
  libleptonica-dev \
  libnlopt-dev \
  libopenmpi-dev \
  libpoppler-cpp-dev \
  libprotobuf-dev \
  libprotoc-dev \
  libtesseract-dev \
  lsb-release \
  man \
  mosh \
  ncdu \
  protobuf-compiler \
  pv \
  python-dev \
  python-pip \
  python-setuptools \
  ruby-full \
  silversearcher-ag \
  software-properties-common \
  tesseract-ocr-eng \
  tmux \
  zsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ 

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
