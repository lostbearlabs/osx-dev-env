############
# This is my master zshrc file.
# It is sourced from the (otherwise-empty) file:
# ~/.zshrc
###########k


############
# shell
############

PROMPT="

-----------------------------------
%~$ "

# from: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git


echo "[loaded osx-dev-env zshrc.zsh]"

