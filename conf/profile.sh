############
# This is my master shell profile.
# It is sourced from the (otherwise-empty) files:
# ~/.zshrc, ~/.bashrc
###########k

export PATH=~/dev/erj/osx-dev-env/bin:$PATH

############
# NVM
############

# export NVM_DIR="$HOME/.nvm"
#
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


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
# rust
############

export PATH="$HOME/.cargo/bin:$PATH"

############
# git
###########

alias gs=git-status
alias gpd='git pull -p --quiet; gs'
alias gf='git fetch -p --all --quiet; gs'
alias gk='git difftool'
alias gkm='git mergetool'

alias get-commit='git rev-parse --verify HEAD'
alias gcf=git-conflicted


############
# vim
###########

# enable colors in vim at the terminal
export TERM=xterm-color vim

##########
# java
##########

export JAVA_HOME="$(/usr/libexec/java_home -v 11)"

############
# homebrew
############

eval "$(/opt/homebrew/bin/brew shellenv)"

############
# shell
############

# run a script to make sure no extra configuration has crept into our dotfiles
g check.dotfiles

############
# Textastic
############

alias tt='open -a /Applications/Textastic.app'


############
# end
###########
echo "[loaded osx-dev-env profile.sh]"

