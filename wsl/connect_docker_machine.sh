#!/bin/bash
# Let WSL's docker-cli connect to Windows' docker-machine

if [[ $(docker-machine.exe status) = "Running" ]]; then
  eval $(docker-machine.exe env --shell bash | sed 's/C:/\/c/; s/\\/\//g')

  # A Strange bug...
  # The command above will export an extra environment variable named 'export'
  # with empty value.
  #
  # ```bash
  # $ env | grep export
  # export=
  # ```
  #
  # Hot fix this issue by manually unset this environment variable
  unset export
fi
