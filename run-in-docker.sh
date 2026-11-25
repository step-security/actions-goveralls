#!/bin/sh

CURRENT=$(cd "$(dirname "$0")" && pwd)
docker volume create actions-goveralls-cache > /dev/null 2>&1
docker run --rm \
    -e GO111MODULE=on \
    -e "GOOS=${GOOS:-linux}" -e "GOARCH=${GOARCH:-amd64}" -e "CGO_ENABLED=${CGO_ENABLED:-0}" \
    -v actions-goveralls-cache:/go/pkg/mod \
    -v actions-goveralls-cache:/root/.cache \
<<<<<<< c5b3b92cd50e36ed31dd2f206e1444b0ab9b79c3
    -v "$CURRENT":/go/src/github.com/step-security/actions-goveralls \
    -w /go/src/github.com/step-security/actions-goveralls golang:1.27.0 "$@"
=======
    -v "$CURRENT":/go/src/github.com/shogo82148/actions-goveralls \
    -w /go/src/github.com/shogo82148/actions-goveralls golang:1.27.3 "$@"
>>>>>>> 7484da8f50412353e7ab9abd544791c480a2f7cb
