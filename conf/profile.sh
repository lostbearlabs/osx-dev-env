############
# This is my master shell profile.
# It is sourced from the (otherwise-empty) files:
# ~/.zshrc, ~/.bashrc
###########k

export PATH=~/dev/osx-dev-env/bin:$PATH

############
# NVM
############

# export NVM_DIR="$HOME/.nvm"
#
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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

# run a script to make sure no extra configuration has crept into our dotfiles
check-dotfiles

############
# end
###########
echo "[loaded osx-dev-env profile.sh]"

