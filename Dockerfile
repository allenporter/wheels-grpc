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
        pkgconfig \
        git \
        zip

RUN pip3 install Cython

RUN cd /usr/src \
    && git clone --depth=1 -b v${GRPC_VERSION} https://github.com/grpc/grpc
RUN cd /usr/src/grpc \
    && git submodule update --init --depth 1

ENV GRPC_BUILD_WITH_BORING_SSL_ASM=false
ENV GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
ENV GRPC_PYTHON_BUILD_WITH_CYTHON=true
ENV GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY=true
#GRPC_PYTHON_LDFLAGS="-lpthread -Wl,-wrap,memcpy -static-libgcc -leventinfo"

# XXX move above
RUN apk add openssl-dev

RUN cd /usr/src/grpc \
    && python3 ./setup.py bdist_wheel
#RUN pip3 wheel --no-binary=":all" grpcversion==${GRPC_VERSION}

