# T-1985 Architecture

This project heavily use Docker.
It allows using AI models without altering user computer.
The three main requirements on Windows are :
- Docker desktop
- WSL2
- Nvidia drivers (should already set through Windows Update)

Architecture can be splitted into two step :
- Build
- Runtime

# 1. Build

The build process is also splitted into two step.
1. From `skynet` container : Compile llama.cpp and generate a package (llama-t1985.deb)
1. From t-1985 container : Install previously generated package  (llama-t1985.deb)

Skynet container pulls llama.cpp from github and stores it into host (your Windows) in `llama.cpp` directory.

Once pulls is done, it compiles llama.cpp, this stage can last 20 minutes or more.

After compilation, Skynet will generate a debian package ready to be installed and store it into host in `package` directory.

When T-1985 are building, they pull previously generated package and install it into there own system.


![Description of T-1985 build system](../assets/build_T-1985.svg)

# 2. Runtime

Runtime requires two systems :
 - T-1985
 - Link-85

T-1985 is the name for llama.cpp instance which interact with one AI model.
Link-85 is the name for OpenWebUi instance which provides high level interface with T-1985 instances, such as chat terminal, model customization, knowledge registering and so on.

Current system can provide a way to run multiple model to make Link-85 able to switch from one model to another, but I didn't implement an easy way to do this yet.


![T-1985 Runtime schema](../assets/runtime_T-1985.svg)