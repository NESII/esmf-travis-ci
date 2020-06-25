#!/usr/bin/env bash

docker build -q -t $DOCKER_IMG --file docker/esmf-ci/Dockerfile --build-arg ESMF_BRANCH=$TRAVIS_BRANCH .
docker run --cpus=$(nproc) -v $(pwd):/esmf-travis-ci -dit --name $TEST_RUNNER $DOCKER_IMG
docker exec -t $TEST_RUNNER bash -c "make info 2>&1 | tee esmf-make-info.out"
docker exec -t $TEST_RUNNER bash "/esmf-travis-ci/sh/esmf-make.sh"
bash sh/travis/linux/finalize-stage.sh
