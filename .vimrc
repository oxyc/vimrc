
" Basics {{{

set nocompatible                "get out of vi-compatible mode
syntax on
scriptencoding utf-8
filetype plugin indent on

" }}}
" General {{{

set autochdir                   "switch to current file directory automatically
set backspace=indent,eol,start  "make backspace more flexible
set backup                      "make backup files
set backupdir=~/.vim/backup     "backup directory
set directory=~/.vim/tmp        "swap directory
set fileformats=unix,dos,mac    "support all three, in this order
set hidden                      "you can change buffers without saving
set wildmenu                    "turn on cli completion wild style
set wildmode=list:longest       "turn on wild mode huge list
set wildignore=*.jpg,*.png      "ignore these file extensions
set dictionary+=~/.vim/dict.txt "custom auto-complete dictionary
set complete+=k                 "use the dictionary for autocompletion
set ofu=syntaxcomplete#Complete "Enable omnicomplete
set completeopt=longest,menuone,preview "Better completion
set history=1000                "Keep a longer history
set gdefault                    "Add the g flag to search/replace by default

" }}}
" Vim UI {{{

set cursorline                  "highlight the current line
set incsearch                   "highlight as you type your search
set hlsearch                    "highlight search
set ignorecase                  "case insensitive by default
set smartcase                   "if there are caps, go case-sensitive
set laststatus=2                "always show the status line
set linespace=0                 "don't insert any extra lineheight
set matchtime=5                 "how many ms to blinkmatching bracket
set number                      "turn on line numbers
set report=0                    "tell us when anything is changed via exec
set ruler                       "always show current position
set scrolloff=10                "keep 10 lines for scope
set showcmd                     "show the command being typed
set showmatch                   "show matching brackets
set sidescrolloff=10            "keep 5 lines at the size?
set splitright                  "open vsplits on rightside
set splitbelow                  "open splits at bottom
"set listchars=eol:¬,tab:▸\ ,trail:·,extends:❯,precedes:❮   "used with set list
set listchars=tab:▸\ ,trail:·   "used with set list
set list
set shortmess+=filmnrxoOtT      "abbrev of messages (avoids hit enter)

" }}}
" Text formatting/layout {{{

set expandtab                   "no real tabs
set formatoptions+=rq           "automaticcaly insert comment leader on return and let gq format comments
set nowrap                      "do not wrap line
set whichwrap+=h,l,<,>,[,]      "http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set shiftwidth=2                "auto-indent amount when using cindent, etc
set softtabstop=2               "how many spaces is a tab
set tabstop=4                   "real tabs should be 4
set smartindent
set autoindent
set virtualedit=block           "Allow moving to unexisting lines/spaces in VB mode

" }}}
" Folding {{{

set nofoldenable                "dont fold by default
set foldmarker={,}              "fold C style code
set foldmethod=marker           "fold based on indent
set foldlevel=1                 "don't autofold
set foldnestmax=10              "deepest fold is 10
set foldopen=block,hor,mark,percent,quickfix,tag  "what movements open folds

nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
nnoremap <leader>z zMzvz        "Use ,z to focus the current fold.

" }}}
" GUI / Looks {{{

set guioptions-=T
colorscheme jellybeans
set t_Co=256                    "support 256 colors

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" }}}
" Custom key mappings {{{

let mapleader = ","
map nt :NERDTreeToggle<cr>
map å :b<space>
map <silent> ö ^
map <silent> ä $
map <silent> Å <C-]>
inoremap {<cr> {<cr>}<esc>O
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
map <C-l> :bnext<cr>
map <C-h> :bprev<cr>


" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" }}}
" Abbrevations {{{

"Load the current buffer in Chrome
abbrev cc :! google-chrome %:p<cr>

" }}}
" DX {{{

"Automatically change current dir to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source $MYVIMRC

au BufWinLeave * silent! mkview     "make vim save view state,folds,cursor,etc
au BufWinEnter * silent! loadview   "make vim load view state,folds,cursor,etc
"au FileType xhtml,xml so ~/.vim/after/ftplugin/html_autoclosetag.vim

" }}}
" Syntastic plugin to find syntax errors {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

" }}}
" NERDTree {{{

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" }}}
" Git {{{

set statusline+=%{GitBranch()}

" }}}
" Ack {{{

map <leader>a :Ack!

" Ack for the last search.
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" }}}
" FileType based tab settings {{{

autocmd FileType stylus setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2

" }}}
" Drupal specific {{{

" Drupal *.module and *.install files."
augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
augroup END

" }}}
" CSS {{{

"Stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
"au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>

" }}}
" HTML & PHP {{{

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
au FileType html,php nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

" }}}

" Strip trailing whitespace (,ss)
" https://github.com/mathiasbynens/dotfiles/blob/master/.vimrc
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>
