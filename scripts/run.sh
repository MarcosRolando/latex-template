#!/bin/bash

function sigterm_handler {
    exit 0
}

trap sigterm_handler SIGTERM

hotreloading_flag=$@

exec latexmk -pdf -cd -output-directory=../target -view=none -jobname=${LATEX_PROJECT_NAME} src/main.tex $hotreloading_flag
