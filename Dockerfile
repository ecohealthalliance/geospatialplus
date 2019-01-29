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
  
## Additional R packages
RUN installGithub.r s-u/unixtools eddelbuettel/littler \
  && ln -sf /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
  && ln -sf /usr/local/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
  && ln -sf /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r 

## INLA and Dependencies
RUN Rscript -e "install.packages('INLA', repos=c(getOption('repos'), INLA='https://inla.r-inla-download.org/R/stable'), dependencies=TRUE, Ncpus = parallel::detectCores())"

## Some of the bigger installs first
RUN install2.r --error --skipinstalled -n `nproc` \
  bayesplot \
  glmmTMB \
  jqr \
  lme4 \
  MCMCglmm \
  RcppArmadillo \
  RcppGSL \
  RcppZiggurat \
  rJava \
  rstan \
  rstanarm \
  shinystan \
  xgboost \
  matrixStats \
  fst \
  MonetDBLite 

## Now some more
RUN install2.r --error --skipinstalled -n `nproc` \
  ape \
  assertr \
  aws.s3 \
  aws.signature \
  bigmemory \
  brms \
  caret \
  cowplot \
  ddalpha \
  doMC \
  doParallel \
  fasterize \
  fields \
  goodpractice \
  ggraph \
  ggiraph \
  here \
  keras \
  knitcitations \
  officer \
  OpenMx \
  optimx \
  pkgdown \
  plotly \
  pomp \
  prioritizr \
  rasterVis \
  Rglpk \
  rgrass7 \
  rjags \
  robustbase \
  ROI \
  ROI.plugin.glpk \
  ROI.plugin.symphony \
  Rsymphony \
  runjags \
  rvg \
  threejs \
  TMB \
  V8 \
  vegan
