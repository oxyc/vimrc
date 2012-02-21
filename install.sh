#!/bin/bash
# Install script

# curl https://raw.github.com/oxyc/vimrc/master/install.sh -o - | sh

function install {
  git clone --recursive git://github.com/oxyc/vimrc.git ~/.vim \
    && cd ~/.vim \
    && ln -s ~/.vim/vimrc ~/.vimrc
}

function clean {
  cp -r ~/.vim ~/.vim.old 2>/dev/null
  rm -rf ~/.vim 2>/dev/null
  cp ~/.vimrc ~/.vimrc.old 2>/dev/null
  rm -f ~/.vimrc 2>/dev/null
}

case "$1" in
  --update|-u)
    cd ~/.vim \
      && git pull \
      && git submodule foreach git pull \
      || echo "Something went wrong"
    ;;
  *)
    clean && install \
      || echo "Something went wrong"
    ;;
esac
unset install clean
