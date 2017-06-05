Primarily tested on macOS but should work on Linux as well. I'm currently in the process of switching over to [neovim](https://neovim.io/) so some features will eventually be dropped as I don't want to maintain multiple scenarios. The aim is that it simply falls back to less features when using with older vim versions but this is very rarely tested so don't count on it working.

# Installation

    git clone https://github.com/oxyc/vimrc.git && cd vimrc && make install

To install neovim plugins and `init.vim`

    make install-nvim

*See also*:

- [`oxyc/mac-playbook`](https://github.com/oxyc/mac-playbook) (the playbook used to provision my Macbook)
- [`oxyc/dotfiles`](https://github.com/oxyc/dotfiles) (my dotfiles)

### Screenshot

![Screenshot](http://i.imgur.com/MFYk8fT.jpg)

### Inspired/Stolen by

- [Shougo](https://github.com/Shougo/shougo-s-github)
- [Junegunn Choi](https://github.com/junegunn/dotfiles)
- [Gianni Chiappetta](https://github.com/gf3/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Steve Losh](https://github.com/sjl/dotfiles)
- [Derek Wyatt](https://github.com/derekwyatt/vim-config)

and probably many others.
