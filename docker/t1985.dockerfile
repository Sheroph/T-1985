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
    apt-get clean && rm /tmp/llama-t1985.deb && \
    groupadd -g ${GID} cyborgs && \
    useradd -m -u ${UID} -g ${GID} -s /usr/sbin/nologin T-1985

USER T-1985

WORKDIR /app
RUN chown T-1985:cyborgs -R /app
COPY docker/requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT [ "llama-server", "--host", "0.0.0.0", "--n-gpu-layers", "50", "-m", "/opt/llama-t1985/models/mistral-7b.Q4_K_M.gguf"]

# Default model use by llama.cpp
# CMD ["/opt/llama-t1985/models/default-model.gguf"]
