master=git://github.com/oxyc/vimrc.git
DEST:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: update

~/.vimrc:
	@ln -s $(DEST)/vimrc ~/.vimrc

~/.config/nvim/init.vim:
	@mkdir -p ~/.config/nvim
	@ln -s $(DEST)/vimrc ~/.config/nvim/init.vim

install: ~/.vimrc ~/.config/nvim/init.vim
	@vim --not-a-term "+silent call dein#install()" +qall

update:
	@pushd $(DEST)
	@git pull
	@git submodule foreach git pull origin master
	@vim --not-a-term "+silent dein#update()" +qall
	@popd

.PHONY: all install update
