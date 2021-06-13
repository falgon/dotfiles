#!/bin/bash

set -eu

if ! type "stack" > /dev/null 2>&1; then
    sudo apt-get -y install libtinfo-dev
    sudo apt-get clean
    sudo apt-get -y autoremove
    curl -sSL https://get.haskellstack.org/ | sh
    eval "$(stack --bash-completion-script stack)"
    echo 'eval "$(stack --bash-completion-script stack)"' >> ~/.bashrc
    export PATH=~/.local/bin:$PATH
    echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
fi
stack upgrade
