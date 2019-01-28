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
RUN installGithub.r s-u/unixtools

RUN Rscript -e "install.packages('INLA', repos=c(getOption('repos'), INLA='https://inla.r-inla-download.org/R/stable'), dependencies=TRUE)"

RUN install2.r --error --skipinstalled \
  ape \
  assertr \
  aws.s3 \
  aws.signature \
  bayesplot \
  bigmemory \
  brms \
  caret \
  cowplot \
  ddalpha \
  doMC \
  doParallel \
  fasterize \
  fields \
  fst \
  goodpractice \
  gganimate \
  ggraph \
  ggiraph \
  glmmTMB \
  here \
  jqr \
  keras \
  knitcitations \
  lme4 \
  matrixStats \
  MCMCglmm \
  MonetDBLite \
  officer \
  OpenMx \
  optimx \
  pkgdown \
  plotly \
  pomp \
  prioritizr \
  rasterVis \
  RcppArmadillo \
  RcppGSL \
  RcppZiggurat \
  Rglpk \
  rgrass7 \
  rjags \
  rJava \
  robustbase \
  ROI \
  ROI.plugin.glpk \
  ROI.plugin.symphony \
  rstan \
  rstanarm \
  Rsymphony \
  runjags \
  rvg \
  shinystan \
  threejs \
  TMB \
  V8 \
  vegan \
  xgboost 