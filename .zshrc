## zsh stuff

## deno
fpath=($HOME/.zsh $fpath)

autoload -Uz compinit promptinit
compinit -u
promptinit

## shell prompt

export PROMPT='%F{blue}%n%f@%F{cyan}%m%f %F{red}%B%~%b%f %# '

## aliases

alias grep=rg
alias ll="ls -l"
alias gc="git clone"
alias vsc="open -a 'Visual Studio Code'"
alias e="emacs -nw"
alias c="open -a 'CotEditor'"
alias v="vim"
alias python="python"

alias work="cd ~/Work/01-University-Work"

## homebrew specific: sbin

export PATH="/usr/local/sbin:$PATH"

## golang: environment

export GOPATH="$HOME/.golang/"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=auto

# haskell: environment - ghc path

export PATH=$PATH:$HOME/.ghcup/bin

## python env

# export PATH="$PATH:$HOME/Library/Python/3.8/bin"

# Graal

function graal() {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.2.0/Contents/Home"
  export PATH="$PATH:/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.2.0/Contents/Home/bin"
}

## functions

## Markdown to Org-mode
## https://emacs.stackexchange.com/questions/5465/how-to-migrate-markdown-files-to-emacs-org-mode-format

function md2org() {
  for f in `ls *.md`; do
    pandoc -f markdown -t org -o ${f}.org ${f};
  done
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/asm/.sdkman"
[[ -s "/Users/asm/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/asm/.sdkman/bin/sdkman-init.sh"
[ -f "/Users/asm/.ghcup/env" ] && source "/Users/asm/.ghcup/env" # ghcup-env

if [ -e /Users/asm/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/asm/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
