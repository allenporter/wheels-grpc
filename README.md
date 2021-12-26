# grpc for Home Assistant

Build wheels for grpc and Home Assistant.

## Manually building

A manual build can take 15 minutes to an hour

```bash
$ ARCH=armv7
$ docker build --build-arg BUILD_FROM=homeassistant/${ARCH}-base-python:3.9-alpine3.14 --build-arg BUILD_ARCH=${ARCH} --tag grpc-builder:${ARCH} builder/
```
If the build was successful, the wheel files can be extracted from the resulting
Docker images like so:

```bash
$ mkdir wheels
$ docker create --name grpc-builder grpc-builder:${ARCH} bash -c sleep 90000
$ docker cp "grpc-builder:/work/wheels/." wheels
$ docker rm grpc-builder
```
The `wheels` folder now contains the Python wheel.

## Manual testing

This creates a new container and imports a package that depends on grpc to verify the cython
imports work correctly.

```bash
# The name of the wheel file created above
$ WHEEL=wheels/grpcio-1.43.0-cp39-cp39-linux_x86_64.whl
$ docker build --build-arg BUILD_FROM=homeassistant/${ARCH}-base-python:3.9-alpine3.14 --build-arg BUILD_ARCH=${ARCH} --build-arg WHEEL=${WHEEL} --tag grpc-test:${ARCH} -f test/Dockerfile .
$ docker run grpc-test:${ARCH}
...
Package import success
```

