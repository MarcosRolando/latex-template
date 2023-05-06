#!/bin/bash

function load_config {
  local config_file="config.json"
  if ! [ -f "$config_file" ]; then
      echo "Config file not found. Please create a config.json file in the root of the project."
      exit 1
  fi
  export LATEX_PROJECT_NAME=$(jq -r '.project_name' "$config_file")
}

function build {
  ./scripts/build-image.sh ${@}
}

function compile {
  ./scripts/compile.sh ${@}
}

function help {
    echo "Usage: ./latx.sh COMMAND [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  build: build docker image for compiling latex project"
    echo "  compile: compile latex project"
    echo "  help: show this help"
    echo ""
    echo "Options:"
    echo "  compile -> --watch: watch for changes in the project and compile automatically"
}

if [ $# -eq 0 ]; then
  help
  exit 1
fi

case $1 in
  "build")
    load_config
    build ${@:2}
    ;;
  "compile")
    load_config
    compile ${@:2}
    ;;
  "help")
    help
    ;;
  *)
    echo "Invalid argument. Use 'help' to see the usage."
    exit 1
    ;;
esac
