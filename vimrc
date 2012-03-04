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
set tabstop=2                                     " real tabs should be 4
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
set dictionary+=~/.vim/dictionaries/dictionary    " custom auto-complete dictionary
"set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags

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
set foldlevel=0                                   " don't autofold
set foldnestmax=10                                " deepest fold is 10
set foldopen=block,hor,mark,percent,quickfix,tag  " what movements open folds

" Space to toggle folds
nnoremap <space> zA
vnoremap <space> zA

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to focus the current fold
nnoremap <leader>z zMzv

" }
" Configurations {

let g:php_sql_query=1 " Highlight SQL queries expressed in strings
let g:php_htmlInStrings=1 "Highlight HTML expressed in strings
let g:php_folding=1
let g:PHP_vintage_case_default_indent=1 "Indent switch case and default

let g:syntastic_enable_signs=1 " Use :sign interace to mark syntax errors
let g:syntastic_check_on_open=1 "Check for errors on buffer load
let g:syntastic_auto_loc_list=1 "Open Error window automatically
let g:syntastic_auto_jump=1 " Automatically jump to first detected error
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

let g:gist_open_browser_after_post=1

" Fix matchpairs for PHP (for matchit.vim plugin)
" http://zmievski.org/files/talks/vancouver-2007/vim-for-php-programmers.pdf
if exists("loaded_matchit")
  let b:match_skip = 's:comment\|string'
  let b:match_words = '<?\(php\)\?:?>,\<switch\>:\<endswitch\>,' .
    \ '\<if\>:\<elseif\>:\<else\>:\<endif\>,' .
    \ '\<while\>:\<endwhile\>,\<do\>:\<while\>,' .
    \ '\<for\>:\<endfor\>,\<foreach\>:\<endforeach\>' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/?][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
    \ '<:>'
endif

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
map å *<C-o>
map <silent> ö ^
map <silent> ä $
map <silent> Å <C-]>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
map <C-l> :bnext<cr>
map <C-h> :bprev<cr>
nnoremap <leader>p :set invpaste paste?<cr>
noremap <leader>W :w !sudo tee % > /dev/null<CR>
map <C-G> <C-]>

" Visual shifting without exiting visual mode
vnoremap < <gv
vnoremap > >gv

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


" @TODO
"match UsingWS /\v^\ +/
"match TrailingWS /\s+$)/

" Make sure Vim returns to the same line when you reopen a file.
" By Amit
augroup line_return
  au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END

function! SetWPConfig ()
  if &filetype == 'php'
    setlocal shiftwidth=4 softtabstop=4 tabstop=4
    setlocal noexpandtab
    setlocal nolist
  endif
endfunction

function! SetDrupalConfig ()
  if &filetype == 'php'
    setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    setlocal listchars=tab:▸\ ,trail:·
    setlocal tags=~/.vim/tags/drupal7
  endif
endfunction

" Wordpress files
au BufRead,BufNewFile */wp-content/* call SetWPConfig()

" Drupal files
augroup module
    au BufRead,BufNewFile *.module set filetype=php
    au BufRead,BufNewFile *.install set filetype=php
    au BufRead,BufNewFile *.test set filetype=php
    au BufRead,BufNewFile */sites/all/* call SetDrupalConfig()
augroup END

augroup css
  "Sort CSS attributes alphabetically
  "Stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
  au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
augroup END

au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsm setf javascript
au BufNewFile,BufRead Jakefile setf javascript
au BufNewFile,BufRead *.json set ft=json syntax=javascript

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
au FileType html,php nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

" }
" Plugins {

" Ack
map <leader>a :Ack!

" Ack for the last search.
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

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

" When you're working remotely and need to copy something to your clipboard
function! ToggleCopyMode ()
  if &mouse == 'a' |set mouse=|else |set mouse=a|endif
  set number!
  set list!
endfunction
nnoremap <leader>c :call ToggleCopyMode ()<cr>

function! TrackTime (...)
  let command = (a:0 > 0) ? a:1 : ''
  exec ':! track ' . command
endfunction

function! TrackShow (...)
  exec ':! track --show ' . a:1
endfunction

function! TrackFind (...)
  let regex = (a:0 > 0) ? a:1 : ''
  exec ':! track --find ' . regex
endfunction

noremap <leader>tt :call TrackTime (input("Message: "))<CR>
noremap <leader>ts :call TrackShow (input("Count: "))<CR>
noremap <leader>tf :call TrackShow (input("Regex: "))<CR>

function! DrupalImplementsComment ()
  let filename = bufname("%")
  let dot = stridx(filename, ".")
  let module = strpart(filename, 0, dot)
  let current_line = getline(".")
  let hook_idx = matchend(current_line, "function " . module . "_")
  if !empty(module) && hook_idx != -1
    let hook_length = match(current_line, "(") - hook_idx
    let hook_name = strpart(current_line, hook_idx, hook_length)
    call DoxygenComment ("Implements hook_" . hook_name . "().")
  else
    call DoxygenComment ()
  endif
endfunction

function! DoxygenComment (...)
  set paste
  let message = (a:0 > 0) ? a:1 : ''
  exe "normal! O/**\<CR>"
    \ . " * " . message . "\<CR>"
    \ . " */\<Esc>"
  if empty(message)
    -1 | startinsert!
  else
    +1
  endif
  set nopaste
endfunction
noremap <leader>dc :call DoxygenComment ()<CR>
noremap <leader>di :call DrupalImplementsComment ()<CR>

" Insert <Tab> or complete identifier if the cursor is after a keyword character
function MyTabOrComplete()
  let col = col('.')-1
  if !col || getline('.')[col-1] !~ '\k'
    return "\<tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

" }
