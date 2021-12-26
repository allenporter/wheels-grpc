ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG GRPC_VERSION=1.43.0

WORKDIR /work

RUN apk add --no-cache \
        autoconf \
        automake \
        build-base \
        cmake \
        linux-headers \
        musl \
        openssl-dev \
        pkgconfig \
        git \
        zip

RUN pip3 install Cython

ENV GRPC_BUILD_WITH_BORING_SSL_ASM=false
ENV GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
ENV GRPC_PYTHON_BUILD_WITH_CYTHON=true
ENV GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY=true

RUN pip3 wheel grpcio==${GRPC_VERSION} \
    --disable-pip-version-check \
    --no-binary=":all:" \
    --no-clean \
    --log=/work/pip.wheel.log \
    --wheel-dir=/work/wheels
