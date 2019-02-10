
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

############
# golang
############

export GOPATH=~/dev/go
export PATH=~/dev/go/bin:$PATH

############
# java / core
###########

export ANT_OPTS="-Xmx1024m -Xms512m"

############
# postgres 
###########

export PATH=/usr/local/bin:$PATH

export PGHOST=localhost

############
# git
###########

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

alias gs='echo "status >>>"; git status --short -uall; git --no-pager stash list'
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


############
# sdkman 
############


[[ -s "/Users/$(whoami)/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$(whoami)/.sdkman/bin/sdkman-init.sh"

sdk use java 1.8.0_181
alias j8='sdk use java 1.8.0_181'
alias j11='sdk use java jdk-11+28'

# NOTE: to use a custom version install manually and then say:
# sdk install java 1.8.0_181 /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/


##########
# java
##########

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

############
# shell 
############

PS1='\n\n-----------------------------------\n$(__git_ps1) \w$ '


############
# end
###########
echo "[loaded osx-dev-env bashrc.bash]"

