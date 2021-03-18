# syntax = docker/dockerfile:experimental

FROM debian:testing

RUN --mount=type=tmpfs,target=/var/lib/apt/lists \
    apt update && apt upgrade -y && \
    apt install -y build-essential icecc && \
    apt autoremove && apt -q clean

ENV CC /usr/lib/icecc/bin/cc
ENV CXX /usr/lib/icecc/bin/c++
ENV RUNSH /run.sh

# create run script with random id
RUN echo '#!/usr/bin/env bash\n\n' > "${RUNSH}" && \
    echo 'ICECC_NODE_ID="$((RANDOM + 1024))"\nICECC_NODE="${HOSTNAME}_${ICECC_NODE_ID}"\n\n' >> "${RUNSH}" && \
    echo 'exec $(command -v iceccd) -N "${ICECC_NODE}" --port "${ICECC_NODE_ID}" "$@"\n' >> "${RUNSH}" && \
    chmod +x "${RUNSH}"

ENTRYPOINT ["/run.sh"]

# verbose logging
CMD ["-vv"]
