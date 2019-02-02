#!/bin/bash

for tag in apt cmpr
do
image=ecohealthalliance/geospatial:$tag
  echo $image
  docker pull $image
  docker build -f Dockerfile.$tag --cache-from $image -t $image .
  docker push $image
done