#!/usr/bin/env bash
set -Eeuxo pipefail

cd ../docker/esmf
docker build -t bekozi/esmf --build-arg ESMF_BRANCH=master .
