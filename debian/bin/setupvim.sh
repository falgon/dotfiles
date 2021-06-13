#!/bin/bash

set -eu

readonly PYTHON_VERSION=3.9.5
readonly CWD=$(cd $(dirname $0); pwd)

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
    readonly _PID=$$;
    readonly _PPID=$(ps -o ppid -p $_PID | tail -n 1);
    if ps -p $_PPID | grep -qs bash ; then
        set +e
        pushd $HOME/.pyenv && src/configure && make -C src; popd
        set -e
    fi
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    pyenv -v
    git clone https://github.com/momo-lab/pyenv-install-latest.git \
        "$(pyenv root)"/plugins/pyenv-install-latest
    pyenv install $PYTHON_VERSION
    if ! type "pip3" > /dev/null 2>&1; then
        echo "could not install pip3"
        exit 1
    fi
    pyenv global $PYTHON_VERSION
fi
pip3 install --user --upgrade pynvim

if ! type "stylish-haskell" > /dev/null 2>&1; then
    $CWD/../../setup_stack.sh
    stack install stylish-haskell
    if ! type "stylish-haskell" > /dev/null 2>&1; then
        echo "could not install stylish-haskell"
        exit 1
    fi
fi

mkdir -p $HOME/.vim
cp -r $CWD/../.vim $HOME
cp $CWD/../.vimrc $HOME

sudo apt-get -y autoremove
