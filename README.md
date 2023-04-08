# LaTeX Template

## Dependencies

- Docker

## How to use

**Important** All of the scripts **must** be invoked from the root directory of the project.

If you don't have LaTeX installed or are having problems building the project natively, you can use
the provided Docker image to compile the project to PDF format by running the `build-image.sh` script.

After the image is built you can compile the project
by running the `compile.sh` script. By default the script will create a `target` folder where the compiled PDF file will be located. You can run the script with the watch flag

    ./compile --watch

to enable hot reloading. Each time you modify the `tp1.tex` file located in the `src` folder the project will be recompiled and the PDF will be updated.
