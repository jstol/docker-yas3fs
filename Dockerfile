FROM alpine:latest

ENV LOCAL_PATH /s3

RUN apk add --update fuse py-pip
RUN pip install --upgrade pip && \
    pip install yas3fs
RUN sed -i'' 's/^# *user_allow_other/user_allow_other/' /etc/fuse.conf

VOLUME ${LOCAL_PATH}
CMD yas3fs ${S3_URI} ${LOCAL_PATH}
