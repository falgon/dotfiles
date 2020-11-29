#!/bin/bash

CWD=$(cd $(dirname $0); pwd)

cd $HOME

if ! type "pip3" > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get -y install \
        build-essential \
        libffi-dev \
        libssl-dev \
        zlib1g-dev \
        liblzma-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        git
    sudo apt-get clean
    git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    source ~/.zshrc
    pyenv -v
    pyenv install-latest
    if ! type "pip3" > /dev/null 2>&1; then
        echo "could not install pip3"
        exit 1
    fi
fi
pip3 install --user --upgrade pynvim

if ! type "stylish-haskell" > /dev/null 2>&1; then
    if ! type "stack" > /dev/null 2>&1; then
        sudo apt-get -y install \
            libtinfo-dev \
            git
        sudo apt-get clean
        curl -sSL https://get.haskellstack.org/ | sh
    fi
    stack install stylish-haskell
    if ! type "stylish-haskell" > /dev/null 2>&1; then
        echo "could not install stylish-haskell"
        exit 1
    fi
fi

cp $CWD/../.stylish-haskell.yaml $HOME
mkdir -p $HOME/.vim
cp -r $CWD/../.vim/ $HOME
cp $CWD/../.vimrc $HOME
