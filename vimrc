" Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Path to where the resolved vimrc is located, so that it can be symlinked
" from $HOME.
let $VIM_DIR = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" Where to store vim caches.
let $VIM_CACHE = $HOME.'/.cache/vim'

if has('vim_starting')
  if &compatible
    set nocompatibleqq
  endif
endif

function! s:source_rc(path)
  execute 'source' fnameescape(expand('$VIM_DIR/rc/' . a:path))
endfunction

function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

call s:source_rc('init.rc.vim')

call neobundle#begin(expand('$VIM_DIR/bundle'))

if neobundle#load_cache()
  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

  if s:meet_neocomplete_requirements()
    " https://github.com/Shougo/neocomplete.vim
    NeoBundle 'Shougo/neocomplete',
  else
    " https://github.com/Shougo/neocomplcache.vim
    NeoBundle 'Shougo/neocomplcache'
  endif

  NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    }
    \ }

  call neobundle#load_toml('$VIM_DIR/neobundle.toml')
  " @todo
  " call neobundle#load_toml("$DIR/neobundle.toml", {'lazy' : 1})

  NeoBundleSaveCache
endif

" Local config
if filereadable('$HOME/.vimrc.local')
  source $HOME . '/.vimrc.local'
endif

call s:source_rc('plugins.rc.vim')

call neobundle#end()

" Needs to run after neobundle#end
filetype plugin indent on

" Enable syntax color
syntax enable

if !has('vim_starting')
  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
endif

" -----------------------------------------------------------------------------------------------
call s:source_rc('ui.rc.vim')
call s:source_rc('edit.rc.vim')
call s:source_rc('filetype.rc.vim')
call s:source_rc('mappings.rc.vim')

if has("gui_running")
  call s:source_rc('gui.rc.vim')
endif

" -----------------------------------------------------------------------------------------------
