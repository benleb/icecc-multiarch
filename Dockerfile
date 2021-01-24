# syntax = docker/dockerfile:experimental

FROM debian:testing

RUN --mount=type=tmpfs,target=/var/lib/apt/lists \
    apt update && apt upgrade -y && \
    apt install -y build-essential icecc && \
    apt autoremove && apt -q clean

ENV CC /usr/lib/icecc/bin/cc
ENV CXX /usr/lib/icecc/bin/c++

ENTRYPOINT ["/usr/sbin/iceccd"]
