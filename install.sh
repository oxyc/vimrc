#!/bin/bash
# Install script
# curl https://raw.github.com/oxyc/vimrc/master/install.sh -o - | sh
#
# From: https://github.com/krisleech/vimfiles/blob/master/bootstrap.sh

function install {
  git clone git://github.com/oxyc/vimrc.git ~/.vim && cd ~/.vim && git submodule init && git submodule update && ln -s ~/.vim/vimrc ~/.vimrc
}

function clean {
  cp -r ~/.vim ~/.vim.old 2>/dev/null
  rm -rf ~/.vim 2>/dev/null
  rm -f ~/.vimrc 2>/dev/null
}

clean && install;
echo 'Done!'
