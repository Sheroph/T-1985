# How to install T-1985

## Setup on Windows

This project has been tested on Windows Home 11, a Nvidia RTX 5070.

### Requirements

1. Install WSL2
1. Install Docker Desktop
1. Install last drivers of your GPU

You can double-click on `build_scripts\windows\check_dependencies.bat` to check if all requirements are satisfied.

### Build T-1985

T-1985 is an ecosystem, this ecosystem needs to be build in order to fit to your computer.
To build it, double-click on `build_scripts\windows\build_t1985.bat`.

This step can be quite long, ~20 minutes.
Once built is over, you can now follow usage documentation [USAGE.md](USAGE.md).