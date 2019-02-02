#!/bin/bash

for tag in geospatial apt rstan inla cmpr
do
  image=ecohealthalliance/geospatialplus:$tag
  echo $image
  docker pull $image
  docker build -f Dockerfile.$tag --cache-from $image -t $image .
  docker push $image
done