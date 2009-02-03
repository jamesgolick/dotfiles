#!/bin/bash
# 
# "borrowed" from Jonathan Palardy (http://github.com/jpalardy/etc_config/tree/master)
 
function relink() {
  rm -i $1
  ln -sn $2 $1
}
 
cd ..
 
relink .bash_profile etc/bash_profile
relink .bash	     etc/bash
 
relink .vim          etc/vim
relink .vimrc        etc/vimrc
 
relink .gitconfig    etc/gitconfig
relink .gitignore    etc/gitignore
relink .screenrc     etc/screenrc

