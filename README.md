# LaTeX Template

## Dependencies

- Docker
- jq

## How to use

**Important** The *latx.sh* script **must** be invoked from the root directory of the project.

If you don't have LaTeX installed or are having problems building the project natively, you can use
the provided Docker image to compile the project to PDF format by running

```
./latx.sh build
```

After the image is built you can compile the project
by running 

```
./latx.sh compile
```

By default the command will create a `target` folder where the compiled PDF file will be located. You can run the previous command with the **watch** flag

```
./latx.sh compile --watch
```

to enable hot reloading. Each time you modify any file located in the `src` folder the project will be recompiled and the PDF will be updated.

## Configuration

You can change the name of the output file by modifying the `project_name` property in the ``config.json`` file.
