FROM alpine

LABEL maintainer="lwzm@qq.com"

RUN apk add --no-cache supervisor \
    && mkdir -p log \
    && cd /usr/lib/python3* \
    && python3 -OO -m compileall -q -b -f . \
    && find . -name __pycache__ | xargs rm -rf \
    && find . -name '*.py' -delete

VOLUME /supervisor/
EXPOSE 9001

CMD [ "supervisord" ]

COPY supervisord.conf /etc/
