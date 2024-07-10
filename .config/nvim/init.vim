let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

set number

if filereadable(expand('~/.config/nvim/dein_setup.vim'))
    source ~/.config/nvim/dein_setup.vim
endif

set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set encoding=utf-8
syntax on
filetype plugin indent on
colorscheme pablo
