
" Basics
set nocompatible		"get out of v-compatible mode
syntax on			"syntax highlighting on
set t_Co=256

" Genertal
filetype plugin indent on	"load filetype plugins/indent settings
scriptencoding utf-8            
set autochdir			"switch to current file directory
set backspace=indent,eol,start	"make backspace more flexible
set backup			"make backup files
set backupdir=~/.vim/backup	"backup directory
set clipboard+=unnamed		"share windows clipboard
set directory=~/.vim/tmp	"swap directory
set fileformats=unix,dos,mac	"support all three, in this order
set hidden			"you can change buffers without saving
"set whichwrap=b,s,h,l,<,>,~,[,]
set wildmenu			"turn on cli completion wild style
set wildignore=*.jpg,*.png	"ignore these file extensions
set wildmode=list:longest	"turn on wild mode huge list
set dictionary+=~/.vim/dict.txt "custom auto-complete dictionary
set complete+=k                 "use the dictionary for autocompletion

" Vim UI
set cursorline			"highlight the current line
set incsearch			"highlight as you type your search
set hlsearch                    "highlight search
set laststatus=2		"always show the status line
set linespace=0			"don't insert any extra lineheight
set matchtime=5			"how many ms to blink matching bracket
set number			"turn on line numbers
set report=0			"tell us when anything is changed via exec
set ruler			"always show current position
set scrolloff=10		"keep 10 lines for scope
set showcmd			"show the command being typed
set showmatch			"show matching brackets
set sidescrolloff=10		"keep 5 lines at the size?
set splitright                  "open vsplits on rightside
set splitbelow                  "open splits at bottom
set listchars=eol:¶,tab:>-,trail:~,extends:>,precedes:<

" Text formatting/layout
set expandtab			"no real tabs
set formatoptions=rq		"automaticcaly insert comment leader on return,
				" and let gq format comments
set ignorecase			"case insensitive by default
set nowrap			"do not wrap line
set smartcase			"if there are caps, go case-sensitive
set shiftwidth=2	"auto-indent amount when using cindent, etc
set softtabstop=2		"how many spaces is a tab
set tabstop=2			"real tabs should be 8
set smartindent                 "asad
set autoindent                  "asd

" Folding
set foldenable			"turn on folding
set foldmarker={,}		"fold C style code
set foldmethod=marker		"fold on the marker
set foldlevel=100		"don't autofold
set foldopen=block,hor,mark,percent,quickfix,tag	"what movements open
							"folds
"GUI / Looks
set guioptions-=T
colorscheme jellybeans
scriptencoding utf-8

" Plugin settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
"Load the current buffer in Chrome
abbrev cc :! google-chrome %:p<cr>

"<3
map <space> :
nmap nt :NERDTreeToggle<cr>
nmap å :b<space>
nmap ö ^
nmap ä $


"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>


"Automatically change current dir to that of the file in the buffer
autocmd BufEnter * cd %:p:h
"Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

set ofu=syntaxcomplete#Complete

"Drupal
if has("autocmd")
    " Drupal *.module and *.install files.
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
    augroup END
endif
autocmd FileType stylus setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2

"set autoindent
"set autowrite
"set shortmess+=filmnrxoOtT 			"abbrev of messages (avoids hit enter)
"set virtualedit=onemore				"allow for cursor beyond last
"set history=1000
"set backup
"set smartindent
"set tabstop=4
"set shiftwidth=4
"set showmatch
"set guioptions-=T
"set vb t_vb=
"set ruler
"set incsearch
"set virtualedit=all
"set cursorline
"set backspace=indent,eol,start
"set linespace=0
"set nu
"set smartcase
"set wildmenu
"set wildmode=list:longest,full		"command <tab> completion,list matches, then longest common part, then all
"set whichwrap=b,s,h,l,<,>,[,]		"backspace and cursor keys wrap to
"set scrolljump=5
"set scrolloff=3
"set nowrap
"
"cmap cwd lcd %:p:h
"let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"
"let g:snips_author = 'Oskar Schöldström <public@oxy.fi>'
"
"colorscheme slate
"imap <F3> <esc>:read !date<CR>kJ$a
"imap <F4> <esc>:read !ls -1<CR>o
"inoremap ( 		()<Left>
"inoremap [ 		[]<Left>
"inoremap ' 		''<Left>
"inoremap " 		""<Left>
"inoremap { 		{}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"nnoremap g :NERDTreeToggle<CR>
"nnoremap <F2> :set nonumber!<CR>
"
"au BufWinLeave * silent! mkview 	"make vim save view state,folds,cursor,etc
"au BufWinEnter * silent! loadview 	"make vim load view state,folds,cursor,etc
"au FileType xhtml,xml so ~/.vim/after/ftplugin/html_autoclosetag.vim
