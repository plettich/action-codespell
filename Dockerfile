FROM alpine:latest

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ v0.9.15

RUN apk --no-cache add git python3 && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install codespell

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
