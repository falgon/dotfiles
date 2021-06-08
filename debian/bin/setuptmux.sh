#!/bin/bash -eu

sudo apt -y install tmux

CWD=$(cd $(dirname $0); pwd)
TMUX_DIR=$CWD/../../tmux

cp $TMUX_DIR/.tmux.conf $HOME/
mkdir -p $HOME/.tmux/plugins
mv $TMUX_DIR/tpm $HOME/.tmux/plugins/
tmux source-file $HOME/.tmux.conf
