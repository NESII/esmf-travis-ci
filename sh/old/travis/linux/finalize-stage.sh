#!/usr/bin/env bash

docker commit "${TEST_RUNNER}" "${DOCKER_IMG}":"${TRAVIS_BRANCH}"
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
docker push "${DOCKER_IMG}":"${TRAVIS_BRANCH}" > docker-push.out
docker stop "${TEST_RUNNER}"
