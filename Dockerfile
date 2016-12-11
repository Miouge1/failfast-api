FROM alpine:3.3

ARG version=0.1.0
ARG workdir=/opt/failfast-ci
RUN apk --update add bash python py-pip openssl ca-certificates git
RUN apk --update add --virtual build-dependencies python-dev build-base wget openssl-dev libffi-dev
RUN pip install pip -U

RUN rm -rf $workdir
RUN mkdir -p $workdir
ADD . $workdir
WORKDIR $workdir
RUN pip install gunicorn -U && pip install -e .

CMD ["./run-server"]
