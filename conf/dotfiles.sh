# copy the standard dotfiles here to ~
# (this only needs to be done once, when the machine is first configured)
# they in turn reference back to the shared profile in this folder, where any subsequent changes can be made

set -ex

cp .bashrc ~
cp .bash_profile ~
cp .zshrc ~
cp .profile ~


