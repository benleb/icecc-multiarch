# syntax = docker/dockerfile:experimental

FROM debian:testing

RUN --mount=type=tmpfs,target=/var/lib/apt/lists \
    apt update && apt upgrade -y && \
    apt install -y build-essential icecc && \
    apt autoremove && apt -q clean

ENV CC /usr/lib/icecc/bin/cc
ENV CXX /usr/lib/icecc/bin/c++

ENV ICECC_NODE_ID="$(( $RANDOM + 1024 ))"
ENV ICECC_NODE="${HOSTNAME}_${ICECC_NODE_ID}"

ENTRYPOINT ["/usr/sbin/iceccd", "-N", "${ICECC_NODE}", "--port", "${ICECC_NODE_ID}"]
