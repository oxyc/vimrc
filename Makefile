# wget https://raw.github.com/oxyc/vimrc/master/Makefile -O - | make -- install

master=git://github.com/oxyc/vimrc.git
dest=~/.vim

all: update

install: clean
	@git clone --recursive $(master) $(dest)
	@cd $(dest)
	@ln -s $(dest)/vimrc ~/.vimrc
	@cd -

update:
	@cd $(dest)
	@git pull
	@git submodule foreach git pull origin master

clean:
	@cp -r $(dest){,.old}
	@rm -rf $(dest)
	@cp ~/.vimrc{,.old}
	@rm -f ~/.vimrc
