# Cura-engine images

Recipes for building binary executable versions of cura-engine: https://github.com/Ultimaker/CuraEngine

## Why is this here?

[Ultimaker Cura](https://github.com/Ultimaker/Cura) comes pre-baked with the Cura slicing engine. This covers almost all
use cases. However, when you want to automate the slicing process in some kind of scripting environment, you need the
core engine itself. Fortunately, the engine project is hosted in a separate Git repo and provides tags for all versions
that made it into Cura itself. These tags follow the release tags from Cura. However: these tags do not provide binary
executable downloads in themselves. For this, you need to compile cura-engine.

This repo provides Docker recipes for building exactly that: CuraEngine binary executables, following the build 
process described in https://github.com/Ultimaker/CuraEngine/wiki/Building-CuraEngine-From-Source.

## Building

Run 
```shell
CURA_ENGINE_VERSION=5.4.0 docker-compose build
```

## Running

Slicing requires the binary executable and two files: 
- A printer defintion json. These can be found at https://github.com/Ultimaker/Cura/tree/main/resources/definitions. 
  Pick one of the settings json files apt for your printer and adapt the settings to your printing preferences. A 
  conveniently named ["definitions"](definitions) folder is already present and configured in the
  [docker-compose.yaml](docker-compose.yaml) 
- A 3d STL model to slice. An aptly named ["models"](models) folder is provided.

Output of the slicing process is stored in the ["output"](output) folder
