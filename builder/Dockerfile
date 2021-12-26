ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG GRPC_VERSION=1.43.0

WORKDIR /usr/src

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

RUN cd /usr/src \
    && pip3 download grpcio==${GRPC_VERSION} \
    && tar xzf grpcio-${GRPC_VERSION}.tar.gz
    && rm grpcio-${GRPC_VERSION}.tar.gz

ENV GRPC_BUILD_WITH_BORING_SSL_ASM=false
ENV GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
ENV GRPC_PYTHON_BUILD_WITH_CYTHON=true
ENV GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY=true

RUN mkdir /usr/src/wheels \
    cd /usr/src/grpcio-${GRPC_VERSION} \
    && python3 ./setup.py bdist_wheel --bdist-dir /usr/src/wheels/
