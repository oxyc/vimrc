#!/bin/bash
# Install script
# curl https://raw.github.com/oxyc/vimrc/master/install.sh -o - | bash
#
# Inspired by: https://github.com/krisleech/vimfiles/blob/master/bootstrap.sh

install () {
  git clone --recursive git://github.com/oxyc/vimrc.git ~/.vim \
    && ln -s ~/.vim/vimrc ~/.vimrc
}

clean () {
  cp -r ~/.vim ~/.vim.old 2>/dev/null
  rm -rf ~/.vim 2>/dev/null
  cp ~/.vimrc ~/.vimrc.old 2>/dev/null
  rm -f ~/.vimrc 2>/dev/null
}

clean && install
unset install
unset clean
