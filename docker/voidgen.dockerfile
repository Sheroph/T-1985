FROM pytorch/pytorch:2.9.1-cuda12.8-cudnn9-runtime

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,graphics
ARG USER_ID=1000
ARG GROUP_ID=1000

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential wget \
    libgl1 libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -g ${GROUP_ID} cyberdyne && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} -s /usr/sbin/nologin voidgen && \
    chown root:cyberdyne -R /app && \
    chmod g+w -R /app

USER voidgen

RUN git clone https://github.com/comfyanonymous/ComfyUI.git ComfyUI && \
    chmod u+wx -R ./ComfyUI && cd ComfyUI && \
    python -m venv comfyUI_env && . ./comfyUI_env/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install accelerate diffusers onnxruntime-gpu insightface && \
    mkdir -p ./custom_nodes && cd ./custom_nodes && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git comfyui-manager && \
    cd comfyui-manager && pip install -r requirements.txt


EXPOSE 8002

CMD ["/app/ComfyUI/comfyUI_env/bin/python", "/app/ComfyUI/main.py", "--listen", "0.0.0.0", "--port", "8002"]