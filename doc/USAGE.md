# 1. How to use T-1985

T-1985 provides several tools :
- Chat with AI, also called T-1985
- Instance of ComfyUI, a powerful tool to create or edit images
- [Work in progress] : Development Assistant with VSCode

The main goal of this project is to provide cool AI stuff on Windows without installing other softwares than :
 - Docker Desktop (or Docker Engine only for Barbarians)
 - WSL2
 - GPU drivers (you should already have them through Windows Udpate)

And more important, to avoid giving my code, project ideas to huge AI maintainers.

When you use this project, nothing get outside of your computer, you can work offline 👍.

How I'm using today ?

Through OpenWebUI :
 - I use [Meta-Llama-3.1-8B-Instruct-GGUF](https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/resolve/main/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf?download=true) model to assist me to plan my personnal projects
 - Use another model [qwen2.5-coder-1.5b-instruct-q4_k_m.gguf](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF/resolve/main/qwen2.5-coder-1.5b-instruct-q4_k_m.gguf?download=true) to assist me during development


And finally, VoidGen to create icons and images, and it is very addictive, you can trust me !

# 2. T-1985 Chat

## Prepare T-1985 Chat

T-1985 Chat is based upon two systems:
 - [Open WebUI](https://docs.openwebui.com/) : Web application which greatly simplifies LLM usages from differents backends (OpenAI, Ollama, Llama.cpp)
 - [Llama.cpp](https://github.com/ggml-org/llama.cpp/blob/master/README.md) : Runtinme system for LLM inferences with minimal setup

To avoid getting to deep in technical details and because I can't do it 😜, here is a rule of thumbs to know how to T-1985 Chat :
1. This system only support **GGUF** models, you can find a lot of them at [HuggingFace](https://huggingface.co/models)
1. Download and copy them at `models` directory.
1. Update the `.env` file with your model filename :

    Before
    ```bash
    # Set the model name you want T-1985 to use
    T1985_model_name="Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf"
    ```

    After
    ```bash
    # Set the model name you want T-1985 to use
    T1985_model_name="The model you decided to download"
    ```

## Quick configuration

If you are a bit confused, don't worry, I provide to you the steps to have my setup :

1. Create `models` directory in root directory of this project
1. You may need to create an account on HuggingFace to download a model
1. Download [Meta-Llama-3.1-8B-Instruct-GGUF](https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/resolve/main/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf?download=true) and store it in `models` directory.
1. You don't need to update `.env` file because it is already set for this model.
1. You can follow steps of the next section


## Start T-1985

Double-click on `helpers\start_t1985.bat`
By doing this you will have access to an instance of OpenWebUI.
Here you can talk with an AI.

## How to use it

Open your web browser at http://localhost:8001.

You may need to create an account, keep login and password safely, you'll need them later.

For the first time a have to create an API Key from OpenWebUI, to do this follow these step : [Create API Key](https://docs.openwebui.com/getting-started/advanced-topics/monitoring/#authentication-setup-for-api-key-)
To make system working, you should do these steps :
- Step 1 whithout item 6 (optional)
- Step 2 Option A
- Step 3

Now we are going to tell to OpenWebUI where it can find T-1985 model, to do this, follow these steps:

1. Go into http://localhost:8001/admin/settings/connections with you brower
1. Make sure `OpenAI compatible API` item is enabled
1. Click on the ![plus button](../assets/plus.svg) in the same row of `Manager OpenAI API connections`.
1. Set `http://t-1985:8080/v1` in `URL` field
1. Select `Bearer` in `Auth` field
1. Copy-paste you API key into the `API Key` text field
1. To test: you can click on the test button ![test connexion button](../assets/test_connection.svg)

You should see a green message saying connection is working

Once connected you may see nothing available in "Select model", this is expected, model can take time to be loaded, so keep waiting.
Once your model appairs in the "Select model" dropdown list, you can select it and start chatting with your IA.

# VoidGen

VoidGen is just a cool name for an instance of `comfyUI` system, you can find their awesome doc here [comfyUI](https://docs.comfy.org/).

`comfyUI` provides to you a way to change your computer into a real images/videos studio. It is fully customizable and no code is needed.

## Configure VoidGen

VoidGen needs three directories to be set :
 - `.\output`, directory where VoidGen will store generated image (through [Save Image Node](https://docs.comfy.org/tutorials/basic/text-to-image#f-save-image-node))
 - `.\voidgen_data\input`, directory where VoidGen will look for image you want to use in workflows
 - `.\voidgen_data\user`, directory where VoidGen will store workflows, logs, database, settings and others things 😉

## Start VoidGen

Double-click on `helpers\start_voidgen.bat`
By doing this you will have access to an instance of comfyUI at http://localhost:8002/.

comfyUI is a powerful tool for create pipeline for image/video editing, but it needs time to get used to use it.

To be honest, I'm still a beginer in this usage and I embed it in my projet to... create icons for this manual 😄.

## Stop them all

Double-click on `helpers\stop_all.bat`
All running services related to T-1985 ecosystem will be stopped.
