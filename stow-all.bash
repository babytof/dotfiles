#!/bin/bash

if ! command -v stow 2>&1 >/dev/null
then
    echo "stow could not be found"
    exit 1
fi

cd "$(dirname "$0")"
ls -1 -d */ | xargs -I '{}' bash -c 'echo {} ; stow --dotfiles {}'

