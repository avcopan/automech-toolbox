# automech-toolbox

This repository contains source code and build scripts for static executables
used by AutoMech.
It also contains a recipe for a conda package that places these executables in a
user's bin.
You will need `rattler-build` installed (instructions
[here](https://prefix-dev.github.io/rattler-build/latest/)) to build and upload
the conda package.
The following instructions will guide you through the process.

## Build
1. Update the version number in `<recipe directory>/recipe.yaml` with today's date (`YYYY.MM.DD`)
2. Run the following command. Look for `/path/to/file.conda` in the output and copy the path for the steps below.
```
rattler-build build -r <recipe directory>
```

## Upload
1. If you haven't already, navigate to https://anaconda.org/ to create an API token for yourself. Save it in a secure location where you can access it.
2. Run the following commands to upload the package.
```
export ANACONDA_API_KEY=<API token>
rattler-build upload anaconda -o Auto-Mech /path/to/file.conda
```

## Test

To test that build worked, you can create an environment from your local copy of the conda package as follows.
```
conda create -n test /path/to/file.conda
```
Alternatively, you can test that the upload worked by getting the conda package
from Anaconda.org as follows.
```
conda create -n test -c auto-mech <package name>
```
You can test that it worked as follows.
```
conda activate test  # Or . /path/to/conda/bin/activate test
which <executable name>  # The executables should appear in your environment bin
# Then, run the executables to test that they work
```

On subsequent tests, use the following commands to remove the environment and
clear the cache before creating the test environment.
Clearing the cache is important.
If the version number hasn't changed and you don't clear the cache, conda will
use its own archived copy of your package instead of the newly created one.
```
conda env remove -n test
conda clean --all  # Remove the cached version of test-mess
```
