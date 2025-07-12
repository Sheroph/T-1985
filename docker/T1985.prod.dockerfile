FROM nvidia/cuda:12.9.1-runtime-ubuntu22.04

ARG UID=1000
ARG GID=1000

COPY package/llama-t1985.deb /tmp/

RUN apt-get update && \
    apt-get install -y  libcurl4 \
                        libcublas-12-1 \
                        python3 python3-pip python3-venv \
                        ninja-build \
                        /tmp/llama-t1985.deb && \
    apt-get clean && rm /tmp/llama-t1985.deb

RUN groupadd -g ${GID} prodgroup && \
    useradd -m -u ${UID} -g ${GID} -s /usr/sbin/nologin produser

USER produser

WORKDIR /app
RUN chown produser:prodgroup -R /app
COPY docker/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

# llama-server -m /opt/llama-t1985/models/mistral-7b.Q4_K_M.gguf --host 0.0.0.0 --n-gpu-layers 50

ENTRYPOINT [ "llama-server", "-m", "/opt/llama-t1985/models/mistral-7b.Q4_K_M.gguf", "--host", "0.0.0.0", "--n-gpu-layers", "50" ]
CMD ["/bin/bash"]