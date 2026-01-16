FROM nvidia/cuda:12.9.1-runtime-ubuntu22.04

ARG UID=1000
ARG GID=1000

COPY package/llama-t1985.deb /tmp/

RUN apt-get update && \
    apt-get install -y  libcurl4 \
    libcublas-12-1 \
    libopenblas-base \
    python3 python3-pip python3-venv \
    ninja-build \
    /tmp/llama-t1985.deb && \
    apt-get clean && rm /tmp/llama-t1985.deb && \
    groupadd -g ${GID} cyborgs && \
    useradd -m -u ${UID} -g ${GID} -s /usr/sbin/nologin T-1985

USER T-1985

WORKDIR /app
RUN chown T-1985:cyborgs -R /app
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH
