" Edit experience
" ---------------------------------------------------------------------------

" Enable smart indent (automatically add indent levels).
set autoindent smartindent
" Exchange tabs for spaces.
set expandtab
" Auto-indent width.
set shiftwidth=2
" Amount of spaces instead of a <tab>
set softtabstop=2
" Amount of blanks in a <tab>
set tabstop=2
" Use multiple of shiftwidth when indenting with '<' or '>'.
set shiftround
" Use shiftwidth for <tab> in front of line, and tabstop or softtabstop
" elsewhere
set smarttab

" Enable modeline.
"   vim: tw=77
"   /* vim: set ai tw=75: */
set modeline

" Use clipboard register, to allow yanking between vim and os.
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
  if has('unnamedplus')
     set clipboard& clipboard+=unnamedplus
  else
     set clipboard& clipboard+=unnamed
  endif
endif

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Highlight matching bracket.
set showmatch
" Show until a character is typed.
set cpoptions-=m
" How many ms to blink matching bracket.
set matchtime=1
" Highlight '<', and '>'.
set matchpairs+=<:>

" Switch buffers without saving.
set hidden

" Ignore case on insert completion.
set infercase

" Allow moving to unexisting lines/spaces in VB mode
set virtualedit=block
" Automatically insert comment leader on return and let gq format comments @todo
set formatoptions+=rq

" Timeout on mapping after half a second, time out on key codes after a tenth of a second.
set timeout timeoutlen=500 ttimeoutlen=100

" @todo
" " Disable paste.
" autocmd MyAutoCmd InsertLeave *
"     \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
"     \ if &l:diff | diffupdate | endif
"
" " Update diff.
" autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" Auto delete trailing whitespace on lines when opening or saving a file
autocmd MyAutoCmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Setup folding
" ---------------------------------------------------------------------

" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=0
set commentstring=%s

" Open all folds by default
set foldlevelstart=99
" what movements open folds
set foldopen=hor,mark,percent,quickfix,tag
" what movements open folds
" @todo document how it works.
" Use FoldCCtext().
if exists('*FoldCCtext') | set foldtext=FoldCCtext() | endif

" Setup swap. backup, dictionary and tag files.
" ---------------------------------------------------------------------

function! s:mkdir(path)
  if !isdirectory(a:path)
    call mkdir(a:path, "p")
  endif
endfunction

if has('nvim')
  set shada=!,'300,<50,s10,h
else
  set viminfo& viminfo+=!
  " Tell VIM where to store the viminfo file.
  set viminfo+=n$VIM_CACHE/viminfo.txt
endif

" Remove CWD and $HOME/tmp from swaps directory list.
set directory=$VIM_CACHE
if exists("+undofile")
  set undofile
  " remember 1000 undos
  set undolevels=1000
  " save up to 10000 lines for undo on a buffer reload
  set undoreload=10000
  set undodir=$VIM_CACHE/vim-undo
endif

" Enable backups when writing to an existing file.
set backup
set backupdir=$VIM_CACHE/vim-backup

" Where to store file views.
set viewdir=$VIM_CACHE/vim-views

" Recursively look for tag-file in parent directories
set tags=./tags;/

call s:mkdir($VIM_CACHE)
call s:mkdir(&directory)
call s:mkdir(&undodir)
call s:mkdir(&backupdir)
call s:mkdir(&viewdir)

" custom auto-complete dictionary
if filereadable($DIR.'/dictionaries/dictionary')
  set dictionary+="$DIR/dictionaries/dictionary"
endif

" Make Directory automatically
" ---------------------------------------------------------------------
autocmd MyAutoCmd BufWritePre *
    \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)

function! s:mkdir_as_necessary(dir, force)
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" ---------------------------------------------------------------------
