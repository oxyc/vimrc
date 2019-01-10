SHELL:=/bin/bash
master=git://github.com/oxyc/vimrc.git
DEST:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: update

~/.vimrc:
	@ln -s $(DEST)/vimrc ~/.vimrc

~/.config/nvim/init.vim:
	@mkdir -p ~/.config/nvim
	@ln -s $(DEST)/vimrc ~/.config/nvim/init.vim

install: install-vim

install-vim: ~/.vimrc
	@vim --not-a-term "+silent call dein#install()" +qall

install-nvim: ~/.config/nvim/init.vim
	@nvim "+silent call dein#install()" +UpdateRemotePlugins +qall

update:
	@pushd $(DEST)
	@git pull
	@git submodule foreach git pull origin master
	@vim --not-a-term "+silent dein#update()" +qall
	@popd

.PHONY: all install update
