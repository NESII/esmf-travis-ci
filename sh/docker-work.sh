#!/usr/bin/env bash
set -Eeuxo pipefail

ESMF_TRAVISCI_DIR=~/project/esmf-travis-ci

#ESMF_BRANCH="master"
ESMF_BRANCH="bekozi-info-v1"
#ESMF_BRANCH="ESMF_8_0_1_beta_snapshot_13"

#SHOULD_PUSH="ON"
SHOULD_PUSH="OFF"

SHOULD_BUILD="ON"
#SHOULD_BUILD="OFF"

NO_CACHE=""
#NO_CACHE="--no-cache"

SUFFIXES=(
#          "esmf-ubuntu"
#          "esmf-hdf5"
#          "esmf-netcdf"
#          "esmf"
#          "esmf-doc-anvil"
          "esmf-doc"
#          "nuopc-protos"
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
    elif [ "${s}" == "esmf-doc" ]; then
      DOCKER_BUILDARGS="--build-arg ESMF_BRANCH=${ESMF_BRANCH}"
    else
      DOCKER_BUILDARGS=""
    fi
    echo "building: ${DOCKER_TAG}"
    pushd "${s}"
    docker build ${DOCKER_BUILDARGS} ${NO_CACHE} -t "${DOCKER_TAG}" .
    popd
  fi
  if [ "${SHOULD_PUSH}" == "ON" ]; then
    echo "pushing: ${DOCKER_TAG}"
    docker push "${DOCKER_TAG}"
  fi
done
