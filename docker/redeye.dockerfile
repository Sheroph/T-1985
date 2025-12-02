FROM pytorch/pytorch:2.9.1-cuda12.8-cudnn9-runtime

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility,graphics

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /app/ComfyUI

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install accelerate transformers diffusers safetensors

RUN mkdir -p /app/ComfyUI/models/checkpoints

EXPOSE 8188

CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
