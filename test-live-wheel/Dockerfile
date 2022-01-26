ARG BUILD_FROM
FROM $BUILD_FROM

ARG GRPC_VERSION=1.43.0
ARG ALPINE_VERSION=3.14

WORKDIR /work

COPY test-live-wheel/constraints.txt .
RUN pip3 install \
        -v \
        --log=pip.log \
        --no-cache-dir \
        --no-index \
        --only-binary=":all:" \
        --find-links https://wheels.home-assistant.io/alpine-$ALPINE_VERSION/armv7/ \
        "grpcio==$GRPC_VERSION" \
        || cat ./pip.log

RUN pip3 install google-cloud-pubsub -c constraints.txt 
COPY test-live-wheel/example.py .

#RUN apk add libstdc++

CMD python3 example.py
