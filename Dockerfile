FROM alpine:latest

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ v0.15.0

RUN apk --no-cache add git python3 py3-pip && \
    find /usr/lib/ -type f -name 'EXTERNALLY-MANAGED' -exec rm -f {} \; && \
    rm -rf /var/lib/apt/lists/*

RUN pip install codespell

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
