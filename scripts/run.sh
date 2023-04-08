#!/bin/bash

function sigterm_handler {
    echo "hola"
    exit 0
}

trap sigterm_handler SIGTERM

hotreloading_flag=$@

exec latexmk -pdf -output-directory=target -view=none -jobname=${LATEX_PROJECT_NAME} src/main.tex $hotreloading_flag
