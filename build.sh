#!/bin/bash

for tag in apt rstan inla cmpr
do
image=ecohealthalliance/geospatial:$tag
  echo $image
  docker pull $image
  docker build -f Dockerfile.$tag --cache-from $image -t $image .
  docker push $image
done