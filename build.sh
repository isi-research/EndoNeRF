#!/usr/bin/env bash

get_current_dir() {
  SOURCE="${BASH_SOURCE[0]}"

  # resolve $SOURCE until the file is no longer a symlink
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to
    # the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

get_current_dir

parentdir="$(dirname ${DIR})"

# create conda env
conda create -n endonerf python=3.8 pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia