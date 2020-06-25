#!/usr/bin/env bash

docker pull "${DOCKER_IMG}:${TRAVIS_BRANCH}" > docker-pull.out
docker run --cpus=$(nproc) -v $(pwd):/esmf-travis-ci -dit --name "${TEST_RUNNER}" "${DOCKER_IMG}:${TRAVIS_BRANCH}"
docker exec -t "${TEST_RUNNER}" bash -c "source /esmf-travis-ci/sh/esmf-make-funcs.sh && run_esmf_make_target ${1}"

NAME="${DOCKER_IMG}:${TRAVIS_BRANCH}-${1}"
docker commit "${TEST_RUNNER}" "${NAME}"
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push "${NAME}" > docker-push.out
docker stop "${TEST_RUNNER}"
