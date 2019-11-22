FROM alpine

LABEL maintainer="lwzm@qq.com"

WORKDIR /root/

RUN apk add --no-cache python3 \
    && mkdir -p etc log run \
    && pip3 install --no-cache-dir supervisor \
    && find /usr/lib/ -name '*.pyc' -delete

VOLUME /conf.d/

COPY supervisord.conf etc/

CMD [ "supervisord" ]
