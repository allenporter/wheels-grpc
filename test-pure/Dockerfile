ARG BUILD_FROM
FROM $BUILD_FROM

ARG WHEEL

WORKDIR /work

COPY wheels/ /work/wheels/
RUN pip3 install /work/${WHEEL}

RUN pip3 install google-cloud-pubsub
COPY test/example.py .

#RUN apk add libstdc++

CMD python3 example.py
