#!/bin/bash
# Install script
# curl https://raw.github.com/oxyc/vimrc/master/install.sh -o - | sh
#
# From: https://github.com/krisleech/vimfiles/blob/master/bootstrap.sh

function install {
  git clone git://github.com/oxyc/vimrc.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc && active_submodules
}

function activate_submodules {
  for dir in $(find '~/.vim/bundle' -type d); do
    cd ~/.vim/bundle/${dir} && git submodule init
  done
  cd
}

function clean {
  cp -r ~/.vim ~/.vim.old 2>/dev/null
  rm -rf ~/.vim 2>/dev/null
  rm -f ~/.vimrc 2>/dev/null
}

read -p "Deleting old vim files. Are you sure? (y/n) "
echo
if [[ $REPLY = [Yy] ]]; then
  clean && install;
else
  install;
fi

echo 'Done!'
