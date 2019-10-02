#!/usr/bin/env bash
set -eO pipefail

cd ../docker

cd esmf-ubuntu
docker build -t bekozi/esmf-ubuntu .

cd ../esmf-hdf5
docker build -t bekozi/esmf-hdf5 .

cd ../esmf-netcdf
docker build -t bekozi/esmf-netcdf .

docker push bekozi/esmf-netcdf
