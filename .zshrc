typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
path=(~/bin(N-/) /usr/local/bin(N-/) )
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin

autoload -U compinit; compinit -u
autoload -Uz add-zsh-hook
setopt auto_list
setopt list_types
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt print_eight_bit
setopt no_beep

zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*:default" menu select=1
bindkey -v

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
set fileencodings=cp932,sjis,euc-jp,utf-8
export EDITOR=vim
export KCODE=u

if [[ "linux-gnu" =~ darwin ]];then
         jscpath="\System\Library\Frameworks\JavaScriptCore.framework\Versions\A\Resources"
   if [ -f /jsc ];then
       export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:
   fi
fi

### PROMPT ###
autoload -Uz colors
colors 
PROMPT=$'%m:%F{039}%~%f %F{white}%B%n%b%f%# '
RPROMPT='(%D)[%F{blue}%*%f]'

alias ghc="stack ghc --"
alias ghci="stack ghci"
alias runghc="stack runghc --"
alias runhaskell="stack runghc --"
alias pbcopy="xclip -selection c"
alias pbpaste="xclip -selection c -o"
unsetopt promptcr
source ~/.zshrc.antigen

### alias ###
alias cl=clear
alias cls=clear
alias l=ls
alias ls='ls -F -v'
alias tree="tree -NC -a -h"
alias clipbd='xsel --clipboard --input'
alias pbpate='xsel --clipboard --output'
alias jane_style='wine /usr/local/bin/jane400/Jane2ch.exe'
alias e2j='trans {en=ja}'
alias j2e='trans {ja=en}'

# OPAM configuration
alias ocaml='rlwrap ocaml'
. /home/roki/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# added by travis gem
[ -f /home/roki/.travis/travis.sh ] && source /home/roki/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

restart-gnome-shell() {
    killall -SIGQUIT gnome-shell
}
