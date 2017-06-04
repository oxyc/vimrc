" Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Path to where the resolved vimrc is located, so that it can be symlinked
" from $HOME.
let $VIM_DIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" Where to store vim caches.
let $VIM_CACHE = expand('~/.cache/vim')
" Where to store vim plugins.
let $VIM_BUNDLE = expand('~/.cache/dein')

if &compatible
  set nocompatible
endif

function! s:source_rc(path)
  execute 'source' fnameescape(expand('$VIM_DIR/rc/' . a:path))
endfunction

if has('vim_starting')
  call s:source_rc('init.rc.vim')
end

call s:source_rc('dein.rc.vim')

" Local config
if filereadable('$HOME/.vimrc.local')
  source $HOME . '/.vimrc.local'
endif

call dein#call_hook('source')
call dein#call_hook('post_source')

" Enable syntax color
syntax enable
" Needs to run after dein#end()
filetype plugin indent on

" -----------------------------------------------------------------------------------------------
call s:source_rc('ui.rc.vim')
call s:source_rc('edit.rc.vim')
call s:source_rc('filetype.rc.vim')
call s:source_rc('mappings.rc.vim')

if has("gui_running")
  call s:source_rc('gui.rc.vim')
endif

" -----------------------------------------------------------------------------------------------
