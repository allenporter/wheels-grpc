# grpc for Home Assistant

Build wheels for grpc and Home Assistant.

## Manually building

A manual build can take 15 minutes to an hour

```bash
docker build --build-arg BUILD_FROM=homeassistant/armv7-base-python:3.9-alpine3.14 --build-arg BUILD_ARCH=armv7 --tag grpc:armv7 builder/
```
If the build was successful, the wheel files can be extracted from the resulting
Docker images like so:

```bash
mkdir wheels
docker create --name grpc grpc:armv7 bash -c sleep 90000
docker cp "grpc:/usr/src/wheels/." wheels
docker rm grpc
```

The `wheels` folder now contains all the Python wheels.

