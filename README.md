# T-1985
T-1985 — An old AI, a little rusty and rough, but it still gets the job done.

## Step to install T-1985

Setup is splitted into two phases:
1. Compile debian package of llama.cpp with GPU access
1. Build docker image which embeds built binaries previously

## How to activate me
1. From root directory, launch :
```bash
./build_t1985.sh
```


## Some models tested
Text generation     : mistral-7b.Q4_K_M.gguf
Text summarization  : Medra4b.Q4_K_S.gguf
