#@IgnoreInspection BashAddShebang

############
# This is my master bashrc file.
# It is sourced from the (otherwise-empty) files:
# ~/.bashrc
# ~/.bash_profile
# ~/.profile
###########k

export PATH=~/dev/osx-dev-env/bin:$PATH

############
# NVM 
############

export NVM_DIR="$HOME/.nvm" 

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

############
# golang
############

export GOPATH=~/dev/go
export PATH=~/dev/go/bin:$PATH

############
# java
###########

export ANT_OPTS="-Xmx1024m -Xms512m"
# TODO: configure-on-demand not yet working with native libs?
# alias gw="./gradlew --parallel --configure-on-demand"
alias gw="./gradlew --parallel"
alias gw-rerun="./gradlew --no-daemon --rerun-tasks"

############
# postgres 
###########

export PATH=/usr/local/bin:$PATH

export PGHOST=localhost

############
# racket
############

export PATH="/Applications/Racket v7.7/bin":$PATH

############
# rust 
############

export PATH="$HOME/.cargo/bin:$PATH"

############
# git
###########

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export PATH=~/dev/gonzo/target/debug/gonzo:$PATH
alias gs=`gonzo status`
alias gpd='git pull -p --quiet; gs'
alias gf='git fetch -p --all --quiet; gs'
alias gk='git difftool'
alias gkm='git mergetool'

alias gca=git-commit-all
alias gpu=git-push-branch
alias gcplb=git-create-pl-branch

alias gitc=git-checkout-branch

alias get-commit='git rev-parse --verify HEAD'
alias gcf=git-conflicted


############
# vim 
###########

# enable colors in vim at the terminal
export TERM=xterm-color vim

############
# RVM
############

source /Users/$(whoami)/.rvm/scripts/rvm


##########
# java
##########

export JAVA_HOME="$(/usr/libexec/java_home -v 11)"

############
# homebrew 
############

export PATH=/usr/local/sbin:$PATH

############
# shell 
############

PS1='\n\n-----------------------------------\n$(__git_ps1) \w$ '

# run a script to make sure no extra configuration has crept into our dotfiles
check-dotfiles


############
# Haskell 
############

# see:
# https://gitlab.haskell.org/haskell/ghcup/blob/master/README.md#manual-install

source ~/.ghcup/env

# see:
# https://docs.haskellstack.org/en/stable/README/
export PATH=$PATH:~/.local/bin

############
# end
###########
echo "[loaded osx-dev-env bashrc.bash]"

