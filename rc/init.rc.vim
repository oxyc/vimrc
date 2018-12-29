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

" Markdown http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
    \  'css',
    \  'erb=eruby',
    \  'javascript',
    \  'js=javascript',
    \  'json=javascript',
    \  'ruby',
    \  'sass',
    \  'xml',
    \  'vim',
    \]

" Turn off as much PHP syntax highlighting as possible as it causes severe
" slowdowns.
let php_sql_query = 0
let php_sql_heredoc = 0
let php_html_in_strings = 0
let php_html_in_heredoc = 0
let php_html_load = 0
let php_ignore_phpdoc = 1
let php_folding = 0
" Indent switch case and default
let g:PHP_vintage_case_default_indent = 1

" Javascript
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1
