#!/usr/bin/env bash

docker run --cpus=$(nproc) -v $(pwd):/esmf-travis-ci -dit --name $TEST_RUNNER $DOCKER_IMG:$TRAVIS_BRANCH
docker exec -t $TEST_RUNNER bash "/esmf-travis-ci/sh/esmf-make-build_unit_tests.sh"
bash sh/travis/linux/finalize-stage.sh
