#!/usr/bin/env bash
set -Eeuxo pipefail

ESMF_TRAVISCI_DIR=~/l/project/esmf-travis-ci

ESMF_BRANCH="master"

#SHOULD_PUSH="ON"
SHOULD_PUSH="OFF"

SHOULD_BUILD="ON"
#SHOULD_BUILD="OFF"

# If "ON", provide the --no-cache flag to "docker build"
#NO_CACHE="OFF"
NO_CACHE="ON"

SUFFIXES=(
#          "esmf-ubuntu"
#          "esmf-mpich"
#          "esmf-hdf5"
#          "esmf-netcdf"
          "esmf"
#          "nuopc-protos"
#          "esmf-doc"
          )

# =============================================================================
# =============================================================================

cd "${ESMF_TRAVISCI_DIR}/docker"
for s in "${SUFFIXES[@]}"; do
  DOCKER_TAG="bekozi/${s}"
  echo "processing: ${DOCKER_TAG}"
  if [ "${SHOULD_BUILD}" == "ON" ]; then
    if [ "${s}" == "esmf" ]; then
      DOCKER_BUILDARGS="--build-arg ESMF_BRANCH=${ESMF_BRANCH}"
    else
      DOCKER_BUILDARGS=""
    fi
    if [ "${NO_CACHE}" == "ON" ]; then
      NO_CACHE_ARG="--no-cache"
    else
      NO_CACHE_ARG=""
    fi
    echo "building: ${DOCKER_TAG}"
    pushd "${s}"
    docker build ${DOCKER_BUILDARGS} ${NO_CACHE_ARG} -t "${DOCKER_TAG}" .
    popd
  fi
  if [ "${SHOULD_PUSH}" == "ON" ]; then
    echo "pushing: ${DOCKER_TAG}"
    docker push "${DOCKER_TAG}"
  fi
done
