" Basics {

set nocompatible                                  " get out of vi-compatible mode
syntax on
scriptencoding utf-8
filetype plugin indent on

" Enable pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" }
" Tabs {

set shiftwidth=2                                  " auto-indent amount when using cindent, etc
set softtabstop=2                                 " how many spaces is a tab
set tabstop=4                                     " real tabs should be 4
set expandtab                                     " no real tabs
set autoindent
set smartindent

" }
" General {

set backup                                        " make backup files
set autochdir                                     " switch to current file directory automatically
set backspace=indent,eol,start                    " make backspace more flexible
set fileformats=unix,dos,mac                      " support all three, in this order
set hidden                                        " change buffers without saving
set wildmenu                                      " turn on cli completion wild style
set wildmode=list:longest                         " turn on wild mode huge list
set wildignore=*.jpg,*.png,.git                   " ignore these file extensions
set complete+=k                                   " use the dictionary for autocompletion
set ofu=syntaxcomplete#Complete                   " Enable omnicomplete
set completeopt=longest,menuone,preview           " Better completion
set history=1000                                  " Keep a longer history
set gdefault                                      " Add the g flag to search/replace by default

" }
" Local files and directories {

set backupdir=~/.vim/backup                       " backup directory
set directory=~/.vim/swap                         " swap directory
set dictionary+=~/.vim/dict.txt                   " custom auto-complete dictionary

" }
" Vim UI {

set cursorline                                    " highlight the current line
set incsearch                                     " highlight as you type your search
set hlsearch                                      " highlight search
set ignorecase                                    " case insensitive by default
set smartcase                                     " if there are caps, go case-sensitive
set laststatus=2                                  " always show the status line
set linespace=0                                   " don't insert any extra lineheight
set matchtime=5                                   " how many ms to blinkmatching bracket
set number                                        " turn on line numbers
set report=0                                      " tell us when anything is changed via exec
set ruler                                         " always show current position
set scrolloff=10                                  " keep 10 lines for scope
set showcmd                                       " show the command being typed
set showmatch                                     " show matching brackets
set sidescrolloff=10                              " keep 5 lines at the size?
set splitright                                    " open vsplits on rightside
set splitbelow                                    " open splits at bottom
set listchars=tab:▸\ ,trail:·                     " distinguish tabs and trailing whitespace
set list
set shortmess+=filmnrxoOtT                        " abbrev of messages (avoids hit enter)
set mouse=a                                       " enable mouse in all modes
set nostartofline                                 " don't reset cursor to start of line when moving around

" }
" Text formatting/layout {

set formatoptions+=rq                             " automatically insert comment leader on return and let gq format comments
set nowrap                                        " do not wrap line
set whichwrap+=h,l,<,>,[,]                        " http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set virtualedit=block                             " Allow moving to unexisting lines/spaces in VB mode

" }
" Folding {

set foldlevelstart=0
set foldmarker={,}                                " fold C style code
set foldmethod=marker                             " fold based on indent
set foldlevel=1                                   " don't autofold
set foldnestmax=10                                " deepest fold is 10
set foldopen=block,hor,mark,percent,quickfix,tag  " what movements open folds

" Space to toggle folds
nnoremap <space> zA
vnoremap <space> zA

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to focus the current fold
nnoremap <leader>z zMzvzz

" }
" GUI / Looks {

set guioptions-=T
set t_Co=256                                 " support 256 colors
colorscheme jellyx

set statusline=%f                            " Path.
set statusline+=%m                           " Modified flag.
set statusline+=%r                           " Readonly flag.
set statusline+=%w                           " Preview window flag.

set statusline+=\                            " Space.

set statusline+=%#redbar#                    " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=                           " Right align.

set statusline+=[buf\ #%n]                   " Show buffer number

set statusline+=\ [line\ %l\/%L:%c]          " Line and column position and counts.

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" }
" Custom key mappings {

let mapleader = ","
map nt :NERDTreeToggle<cr>
map å *<C-o>
map <silent> ö ^
map <silent> ä $
map <silent> Å <C-]>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
map <C-l> :bnext<cr>
map <C-h> :bprev<cr>
nnoremap <leader>p :set invpaste paste?<cr>


" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" }
" Auto commands {

au BufEnter * cd %:p:h            " Automatically change current dir to that of the file in the buffer

au BufWinLeave * silent! mkview   " make vim save view state,folds,cursor,etc
au BufWinEnter * silent! loadview " make vim load view state,folds,cursor,etc

au FileType stylus setlocal shiftwidth=2 softtabstop=2 tabstop=2
au FileType php setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Make sure Vim returns to the same line when you reopen a file.
" By Amit
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END

" Drupal files
augroup module
    au BufRead,BufNewFile *.module set filetype=php
    au BufRead,BufNewFile *.install set filetype=php
    au BufRead,BufNewFile *.test set filetype=php
augroup END

augroup css
  "Sort CSS attributes alphabetically
  "Stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
  au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

  " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
  " positioned inside of them AND the following code doesn't get unfolded.
  "au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr>{}<left><cr><space><space><cr><esc>kA
augroup END

au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsm setf javascript
au BufNewFile,BufRead Jakefile setf javascript
au BufNewFile,BufRead *.json set ft=json syntax=javascript

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
au FileType html,php nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

" }
" Plugins {

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

" Ack
map <leader>a :Ack!

" Ack for the last search.
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" }
" Gist {

let g:gist_open_browser_after_post = 1

" }
" Custom functions {

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

function! TrackTime (...)
  let command = (a:0 > 0) ? a:1 : ''
  exec ':! track ' . command
endfunction

function! TrackShow (limit)
  exec ':! track --show ' . a:limit
endfunction

function! TrackFind (...)
  let regex = (a:0 > 0) ? a:1 : ''
  exec ':! track --find ' . regex
endfunction

noremap <leader>tt :call TrackTime (input("Message: "))<CR>
noremap <leader>ts :call TrackShow (input("Count: "))<CR>
noremap <leader>tf :call TrackShow (input("Regex: "))<CR>

" }