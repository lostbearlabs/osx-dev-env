
# OSX DEV ENVIRONMENT

This repo describes my baseline dev environment, so it's easy for me to set up a new machine and to keep multiple machines in sync.


## General

Clone this repo under `~/dev`.
(This path is assumed in the bash config.)




## Config Files

Modify `~/.bashrc`, `~/bash_profile`, and `~/profile` scripts to all specify:

    source ~/dev/osx-dev-env/conf/bashrc.bash
    
Modify `~/.vimrc` to specify:

    source ~/dev/osx-dev-env/vim/vimrc



## Installing Tools

Run the scripts under `./setup`.  Some are fully automatic, some prompt for manual actions.


## Staying Up to Date

Periodically run:

```
   brew update
   brew doctor
   
   sdk update
   
   rvm get stable
```

Allow AppStore to update applications.

Allow applications to update themselves.


## Credits

Setup and git helpers inspired by:  https://gitlab.jasonstahl.net/jfs/dev

