
" Basics
set nocompatible                "get out of vi-compatible mode
syntax on
scriptencoding utf-8
filetype plugin indent on       "load filetype specific plugins


" Genertal
set autochdir                   "switch to current file directory automatically
set backspace=indent,eol,start  "make backspace more flexible
set backup                      "make backup files
set backupdir=~/.vim/backup     "backup directory
set clipboard+=unnamed          "share windows clipboard
set directory=~/.vim/tmp        "swap directory
set fileformats=unix,dos,mac    "support all three, in this order
set hidden                      "you can change buffers without saving
set wildmenu                    "turn on cli completion wild style
set wildmode=list:longest       "turn on wild mode huge list
set wildignore=*.jpg,*.png      "ignore these file extensions
set dictionary+=~/.vim/dict.txt "custom auto-complete dictionary
set complete+=k                 "use the dictionary for autocompletion
set ofu=syntaxcomplete#Complete "Enable omnicomplete
set history=1000                "Keep a longer history
runtime macros/matchit.vim      "Extended % matching

" Vim UI
set cursorline                  "highlight the current line
set incsearch                   "highlight as you type your search
set hlsearch                    "highlight search
set ignorecase                  "case insensitive by default
set smartcase                   "if there are caps, go case-sensitive
set laststatus=2                "always show the status line
set linespace=0                 "don't insert any extra lineheight
set matchtime=5                 "how many ms to blink matching bracket
set number                      "turn on line numbers
set report=0                    "tell us when anything is changed via exec
set ruler                       "always show current position
set scrolloff=10                "keep 10 lines for scope
set showcmd                     "show the command being typed
set showmatch                   "show matching brackets
set sidescrolloff=5             "keep 5 lines at the size?
set splitright                  "open vsplits on rightside
set splitbelow                  "open splits at bottom
set listchars=eol:¶,tab:>-,trail:~,extends:>,precedes:<   "used with set list
set shortmess+=filmnrxoOtT      "abbrev of messages (avoids hit enter)

" Text formatting/layout
set expandtab                   "no real tabs
set formatoptions+=rq           "automaticcaly insert comment leader on return and let gq format comments
set nowrap                      "do not wrap line
set whichwrap+=h,l,<,>,[,]      "http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set shiftwidth=2                "auto-indent amount when using cindent, etc
set softtabstop=2               "how many spaces is a tab
set tabstop=2                   "real tabs should be 8
set smartindent
set autoindent
set virtualedit=block           "Allow moving to unexisting lines/spaces in VB mode

" Folding
set nofoldenable                "dont fold by default
set foldmarker={,}              "fold C style code
set foldmethod=marker           "fold based on indent
set foldlevel=1                 "don't autofold
set foldnestmax=10              "deepest fold is 10
set foldopen=block,hor,mark,percent,quickfix,tag  "what movements open folds

"GUI / Looks
set guioptions-=T
colorscheme jellybeans
set t_Co=256                    "support 256 colors

" Plugin settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

"Load the current buffer in Chrome
abbrev cc :! google-chrome %:p<cr>

"Custom mapping
map <space> :
map nt :NERDTreeToggle<cr>
map å :b<space>
map <silent> ö ^
map <silent> ä $
map <silent> Å <C-]>
inoremap {<cr> {<cr>}<esc>O
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
map <C-l> :bnext<cr>
map <C-h> :bprev<cr>


"Drupal specific
if has("autocmd")"{
    " Drupal *.module and *.install files."}
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
    augroup END
endif

"Syntastic plugin to find syntax errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1

autocmd FileType stylus setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2

"Automatically change current dir to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source $MYVIMRC

au BufWinLeave * silent! mkview     "make vim save view state,folds,cursor,etc
au BufWinEnter * silent! loadview   "make vim load view state,folds,cursor,etc
"au FileType xhtml,xml so ~/.vim/after/ftplugin/html_autoclosetag.vim

