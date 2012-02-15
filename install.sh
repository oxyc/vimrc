#!/bin/bash
# Install script
# curl https://raw.github.com/oxyc/vimrc/master/install.sh -o - | sh
# https://github.com/krisleech/vimfiles/blob/master/bootstrap.sh

read -p "Deleting old vim files. Are you sure? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cp -r ~/.vim ~/.vim.old 2>/dev/null
  rm -rf ~/.vim 2>/dev/null
  rm -f ~/.vimrc 2>/dev/null
fi

echo 'Cloning git://github.com/oxyc/vimrc.git';
git clone git://github.com/oxyc/vimrc.git ~/.vim && ln -s ~/.vim/vimrc ~/.vimrc

echo 'Done!';
