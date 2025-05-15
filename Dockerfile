FROM alpine

RUN apk add --no-cache netcat-openbsd bash

WORKDIR /scripts

CMD ["/bin/bash"]

