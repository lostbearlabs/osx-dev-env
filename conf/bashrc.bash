#@IgnoreInspection BashAddShebang

############
# This is my master bashrc file.
# It is sourced from the (otherwise-empty) files:
# ~/.bashrc
# ~/.bash_profile
###########k


############
# shell 
############

PS1='\n\n-----------------------------------\n$(__git_ps1) \w$ '

# run a script to make sure no extra configuration has crept into our dotfiles
check-dotfiles


############
# end
###########
echo "[loaded osx-dev-env bashrc.bash]"

