## Installation

```bash
wget https://raw.github.com/oxyc/vimrc/master/install.sh -O - | bash
```

You need a terminal with support for 256 colors for the JellyX theme to work.

## Tips

#### Generate Drupal dictionary-list

```bash
grep --exclude-dir="tests" --exclude="*.install" "^function" modules/ includes/ -hR | awk '!/^function\ _/ { sub(/\(.+/, "(", $2); print $2 }' | sort -u > ~/.vim/dictionaries/drupal7
```

#### Generate Drupal core tag-list.

```bash
ctags --langmap=php:.inc.module.theme.php --languages=php --php-kinds=f --exclude=.git --exclude=*/tests/* --exclude=*.test --exclude=*.install --recurse -f - modules/ includes/ | awk '!/^_/' > ~/.vim/tags/drupal7
```

#### Use Inconsolata as your font

```bash
mkdir -p ~/.fonts && cd ~/.fonts && wget http://levien.com/type/myfonts/Inconsolata.otf && sudo fc-cache -f -v
```

## Plugins

- [ack.vim](http://www.vim.org/scripts/script.php?script_id=2572) — Vim plugin for the Perl module / CLI script 'ack'
- [buftabs](http://www.vim.org/scripts/script.php?script_id=1664) — Minimalistic buffer tabs saving screen space
- [clam.vim](https://github.com/sjl/clam.vim) — A lightweight Vim plugin for working with shell commands
- [Gist.vim](http://www.vim.org/scripts/script.php?script_id=2423) — vimscript for gist
- [html5.vim](http://www.vim.org/scripts/script.php?script_id=3236) — HTML5 omnicomplete and syntax
- [JellyX](http://www.vim.org/scripts/script.php?script_id=3408) — JellyX: A delicious collision of Jellybeans and Xoria256
- [rainbow_parentheses](http://www.vim.org/scripts/script.php?script_id=3772) — Better Rainbow Parentheses
- [syntastic](http://www.vim.org/scripts/script.php?script_id=2736) — Syntax checking hacks for vim
- [tcomment](http://www.vim.org/scripts/script.php?script_id=1173) — An extensible & universal comment vim-plugin that also handles embedded filetypes
- [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax) — Add CSS3 syntax support to vim's built-in syntax/css.vim
- [vim-diff-toggle](https://github.com/twe4ked/vim-diff-toggle.git) — Vim plugin to speed up editing diff files
- [vim-haml](http://www.vim.org/scripts/script.php?script_id=1433) — Vim runtime files for Haml, Sass, and SCSS
- [vim-jade](https://github.com/digitaltoad/vim-jade) — Vim Jade template engine syntax highlighting and indention
- [vim-javascript](http://www.vim.org/scripts/script.php?script_id=2765) — Vastly improved vim's javascript indentation.
- [vim-less](https://github.com/groenewege/vim-less) — vim syntax for LESS (dynamic CSS)
- [vim-markdown](https://github.com/tpope/vim-markdown) — Vim Markdown runtime files
- [matchit](http://www.vim.org/scripts/script.php?script_id=39) — Extended % matching for HTML, LaTeX, and many other languages 
- [pathogen.vim](http://www.vim.org/scripts/script.php?script_id=2332) — pathogen.vim: manage your runtimepath
- [stylus](http://www.vim.org/scripts/script.php?script_id=3513) — Syntax Highlighting for Stylus
- [surround](http://www.vim.org/scripts/script.php?script_id=1697) — quoting/parenthesizing made simple
- [tabular](http://www.vim.org/scripts/script.php?script_id=3464) — Vim script for text filtering and alignment 
- [webapi-vim](https://github.com/mattn/webapi-vim) — vim interface to Web API

## Inspired/Stolen by

- [Gianni Chiappetta](https://github.com/gf3/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Steve Losh](https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc)
- [Derek Wyatt](https://github.com/derekwyatt/vim-config)

and probably many others.
