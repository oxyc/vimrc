master=git://github.com/oxyc/vimrc.git
DEST:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: update

install:
	@ln -s $(DEST)/vimrc ~/.vimrc
	@vim +NeoBundleInstall +q

update:
	@pushd $(DEST)
	@git pull
	@git submodule foreach git pull origin master
	@vim +NeoBundleUpdate +q
	@popd

.PHONY: all install update
