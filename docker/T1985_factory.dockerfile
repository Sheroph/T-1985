FROM nvidia/cuda:12.9.1-devel-ubuntu22.04

# Install CUDA and llama.cpp dependencies for building it
RUN apt-get update && \
    apt-get install -y libopenblas-dev git build-essential cmake curl libcurl4-openssl-dev

ENV PATH=/opt/llama_builder/scripts/:${PATH}

WORKDIR /opt/llama_builder/
COPY scripts /opt/llama_builder/scripts
COPY debian /opt/llama_builder/DEBIAN

CMD ["/bin/bash"]
