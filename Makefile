master=git://github.com/oxyc/vimrc.git
DEST:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: update

~/.vimrc:
	@ln -s $(DEST)/vimrc ~/.vimrc

install: ~/.vimrc
	@vim --not-a-term +NeoBundleInstall +q

update:
	@pushd $(DEST)
	@git pull
	@git submodule foreach git pull origin master
	@vim --not-a-term +NeoBundleUpdate +q
	@popd

.PHONY: all install update
