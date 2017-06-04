" Initialization
" ---------------------------------------------------------------------------

" Set augroup.
augroup MyAutoCmd
  " Clear earlier commands.
  autocmd!
augroup END

" Setting of the encoding to use for a save and reading.
" Make it normal in UTF-8 in Unix.
set encoding=utf-8
" Default fileformat.
set fileformat=unix
" Support all three, in this order.
set fileformats=unix,dos,mac
" Switch to current file directory automatically.
" set autochdir
" Automatically change current dir to that of the file in the buffer
" @see https://github.com/tpope/vim-fugitive/issues/3
" autocmd MyAutoCmd BufEnter * if expand('%:p') !~ '://' | cd %:p:h | endif

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Release keymappings for plug-in.
nnoremap ;  <Nop>
xnoremap ;  <Nop>
nnoremap m  <Nop>
xnoremap m  <Nop>
nnoremap ,  <Nop>
xnoremap ,  <Nop>

if !isdirectory($VIM_BUNDLE)
  call mkdir($VIM_BUNDLE, 'p')
endif

" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
  if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
    let s:dein_dir = expand('$VIM_BUNDLE')
          \. '/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute 'silent !git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif


" Disable default plugins
" ---------------------------------------------------------------------------

" While scrolling matchparen causes one of the slowest functions.
let g:loaded_matchparen = 1
" let g:loaded_Signature = 1
" let g:loaded_signify = 1
