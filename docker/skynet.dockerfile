FROM nvidia/cuda:12.9.1-devel-ubuntu22.04

ARG USER_ID=1000
ARG GROUP_ID=1000

# Install CUDA and llama.cpp dependencies for building it
RUN apt-get update && \
    apt-get install -y libopenblas-dev git build-essential curl cmake \
                       libcurl4-openssl-dev pkg-config patchelf && \
    apt-get clean && \
    groupadd -g ${GROUP_ID} cyberdyne && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /usr/sbin/nologin skynet

ENV PATH=/opt/llama_builder/scripts/:${PATH}

USER skynet

WORKDIR /opt/llama_builder/
COPY --chown=skynet:cyberdyne scripts /opt/llama_builder/scripts
COPY --chown=skynet:cyberdyne debian /opt/llama_builder/DEBIAN

