#!/bin/bash
hash npm >/dev/null 2>&1 || { echo >&2 "I require npm but it's not installed.  Aborting."; exit 1; }

command_exists () {
  hash $1 2>/dev/null;
}

install_module () {
  MODULE=$1
  if [ -z "$2" ]; then
    CMD=$MODULE
  else
    CMD=$2
  fi

  if command_exists $CMD; then
    echo $MODULE - already installed
  else
    echo $MODULE - not found. Installing...
    sudo npm install -g $MODULE
  fi

}

echo Installing module...
npm install

echo Installing utilities...
install_module LiveScript lsc

OTHER_MODULES=( jasmine-node wr )
for m in "${OTHER_MODULES[@]}"
do
  install_module $m
done

echo 'Done'
