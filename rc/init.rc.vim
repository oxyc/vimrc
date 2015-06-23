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

let s:neobundle_dir = expand('$VIM_DIR/bundle/neobundle.vim')

if has('vim_starting')
  " Load neobundle.
  if finddir('neobundle.vim', '.;') != ''
    execute 'set runtimepath^=' .
          \ fnamemodify(finddir('neobundle.vim', '.;'), ':p')
  " First time launch, clone neobundle
  elseif &runtimepath !~ '/neobundle.vim'
    if !isdirectory(s:neobundle_dir)
      execute printf('!git clone %s://github.com/Shougo/neobundle.vim.git',
            \ (exists('$http_proxy') ? 'https' : 'git'))
            \ s:neobundle_dir
    endif

    execute 'set runtimepath^=' . s:neobundle_dir
  endif
endif


" Disable default plugins
" ---------------------------------------------------------------------------

" While scrolling matchparen causes one of the slowest functions.
let g:loaded_matchparen = 1
" let g:loaded_Signature = 1
" let g:loaded_signify = 1
