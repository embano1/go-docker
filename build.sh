#!/bin/bash
set -euo pipefail

IMG_VERSION=1.9.1-alpine3.6
REPO=embano1/godoc
docker build -t ${REPO}:${IMG_VERSION} --build-arg GO_IMG_VERSION=${IMG_VERSION} .