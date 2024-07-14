############
# This is my master shell profile.
# It is sourced from the (otherwise-empty) files:
# ~/.zshrc, ~/.bashrc
###########k

export PATH=~/dev/erj/osx-dev-env/bin:$PATH

############
# NVM
############

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


############
# java
###########

export ANT_OPTS="-Xmx1024m -Xms512m"
# TODO: configure-on-demand not yet working with native libs?
# alias gw="./gradlew --parallel --configure-on-demand"
alias gw="./gradlew --parallel"
alias gw-rerun="./gradlew --no-daemon --rerun-tasks"

alias jlist="/usr/libexec/java_home -V"
alias j17="export JAVA_HOME=`/usr/libexec/java_home -v 17`"
alias j21="export JAVA_HOME=`/usr/libexec/java_home -v 21`"

j17

############
# postgres
###########

export PATH=/usr/local/bin:$PATH

export PGHOST=localhost


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

export EDITOR=$HOME/dev/erj/osx-dev-env/bin/tt

############
# vim
###########

# enable colors in vim at the terminal
export TERM=xterm-color vim

############
# homebrew
############

eval "$(/opt/homebrew/bin/brew shellenv)"

############
# shell
############

# run a script to make sure no extra configuration has crept into our dotfiles
g check.dotfiles

###########
# Github
###########
for file in $(ls ~/.ssh/id_* | grep -v "\.pub")
do
  ssh-add "$file"
done

############
# end
###########
echo "[loaded osx-dev-env profile.sh]"

