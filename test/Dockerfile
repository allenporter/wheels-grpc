ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG WHEEL

WORKDIR /work

RUN pip3 install Cython

COPY wheels/ /work/wheels/
RUN pip3 install /work/${WHEEL}

RUN pip3 install google-cloud-pubsub
COPY test/example.py .

CMD python3 example.py
