" Basics {{{

set nocompatible                                  " get out of vi-compatible mode
syntax on
scriptencoding utf-8

" Enable pathogen
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype plugin indent on

" }}}
" Local files and directories {{{

" Create directories if they dont exist
" These are commented out as we assume they're created
"if !isdirectory($HOME . '/.vim/swap') | :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1 | endif
"if !isdirectory($HOME . '/.vim/undo') | :silent !mkdir -p ~/.vim/undo >/dev/null 2>&1 | endif
"if !isdirectory($HOME . '/.vim/backup') | :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1 | endif

if exists("+undofile")
  set undodir=~/.vim/undo//                       " undo directory
endif
set backupdir=~/.vim/backup//                     " backup directory
set directory=~/.vim/swap//                       " swap directory
set tags=./tags;/                                 " recursively look for tag-file in parent directories

if filereadable($HOME . '/.vim/dictionaries/dictionary')
  set dictionary+=~/.vim/dictionaries/dictionary  " custom auto-complete dictionary
endif

" }}}
" Tabs {{{

set autoindent
set expandtab                                     " no real tabs
set shiftwidth=2                                  " auto-indent amount when using cindent, etc
set smartindent
set softtabstop=2                                 " how many spaces is a tab
set tabstop=2                                     " real tabs should be 4

" }}}
" General {{{

set autochdir                                     " switch to current file directory automatically
set backspace=indent,eol,start                    " make backspace more flexible
set backup                                        " make backup files
set complete+=k                                   " use the dictionary for autocompletion
set completeopt=longest,menuone,preview           " Better completion
set fileformats=unix,dos,mac                      " support all three, in this order
set gdefault                                      " Add the g flag to search/replace by default
set hidden                                        " change buffers without saving
set history=1000                                  " Keep a longer history
set ignorecase                                    " case insensitive by default
set pastetoggle=<F2>                              " toggle paste mode
set smartcase                                     " if there are caps, go case-sensitive
set wildignore=*.jpg,*.png,.git                   " ignore these file extensions
set wildmenu                                      " turn on cli completion wild style
set wildmode=list:longest                         " turn on wild mode huge list

if exists("+undofile")
  set undofile                                    " store all undos
  set undolevels=1000                             " remember 1000 undos
  set undoreload=10000                            " save up to 10000 lines for undo on a buffer reload
endif

if exists("+relativenumber")
  set relativenumber                              " use relative instead of absolute line numbers.
else
  set number
endif

" }}}
" Vim UI {{{

set cursorline                                    " highlight the current line
set hlsearch                                      " highlight search
set incsearch                                     " highlight as you type your search
set laststatus=2                                  " always show the status line
set lazyredraw                                    " don't redraw while executing macros etc.
set linespace=0                                   " don't insert any extra lineheight
set list
set listchars=tab:▸\ ,trail:·                     " distinguish tabs and trailing whitespace
set matchtime=5                                   " how many ms to blinkmatching bracket
set mouse=a                                       " enable mouse in all modes
set nostartofline                                 " don't reset cursor to start of line when moving around
set report=0                                      " tell us when anything is changed via exec
set ruler                                         " always show current position
set scrolloff=10                                  " keep 10 lines for scope
set shortmess+=filmnrxoOtT                        " abbrevation of messages (avoids hit enter)
set showbreak=↪                                   " distinguish wrapped lines
set showcmd                                       " show the command being typed
set showmatch                                     " show matching brackets
set showmode                                      " show the which mode
set sidescrolloff=10                              " keep 10 lines at the size?
set splitbelow                                    " open splits at bottom
set splitright                                    " open vsplits on rightside
set synmaxcol=200                                 " limit syntax highlighting of long lines.
set title                                         " set window title to filename
set ttyfast                                       " faster redrawing

" }}}
" Text formatting/layout {{{

set formatoptions+=rq                             " automatically insert comment leader on return and let gq format comments
set nowrap                                        " do not wrap line
set shiftround                                    " Round indent to multiple of shiftwidth
set virtualedit=block                             " Allow moving to unexisting lines/spaces in VB mode
set whichwrap+=h,l,<,>,[,]                        " http://vim.wikia.com/wiki/Automatically_wrap_left_and_right

" }}}
" Configurations {{{

let mapleader = ","
let maplocalleader = ",,"

" Syntastic settings

let g:syntastic_enable_signs=1          " Use :sign interace to mark syntax errors
let g:syntastic_check_on_open=1         " Check for errors on buffer load
let g:syntastic_auto_loc_list=1         " Open Error window automatically
let g:syntastic_auto_jump=1             " Automatically jump to first detected error
let g:syntastic_loc_list_height=3
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

" Gist settings
let g:gist_open_browser_after_post=1
let g:gist_detect_filetype=1

" PHP settings
let g:php_sql_query=1                   " Highlight SQL queries expressed in strings
let g:php_folding=1
let g:PHP_vintage_case_default_indent=1 " Indent switch case and default

" Fix matchpairs for PHP (for matchit.vim plugin)
" http://zmievski.org/files/talks/vancouver-2007/vim-for-php-programmers.pdf
let b:match_skip = 's:comment\|string'
let b:match_words = '<?\(php\)\?:?>,\<switch\>:\<endswitch\>,' .
  \ '\<if\>:\<elseif\>:\<else\>:\<endif\>,' .
  \ '\<while\>:\<endwhile\>,\<do\>:\<while\>,' .
  \ '\<for\>:\<endfor\>,\<foreach\>:\<endforeach\>' .
  \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
  \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
  \ '<\@<=\([^/?][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
  \ '<:>'

" EasyMotion
let g:EasyMotion_leader_key = '<Leader><Leader>'

" Airline
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" }}}
" Folding {{{

set foldlevelstart=99                      " Open all folds by default
set foldopen=hor,mark,percent,quickfix,tag " what movements open folds

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 2
  return line . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction " }}}
set foldtext=MyFoldText()

" Space to toggle folds
nnoremap <space> zA
vnoremap <space> zA

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to focus the current fold
nnoremap <leader>z zMzAzz

" }}}
" GUI / Looks {{{

" set guioptions-=T
set t_Co=256                                      " support 256 colors
set background=dark
colorscheme base16-default
hi Matchmaker term=underline ctermbg=11
hi MatchParen cterm=bold ctermbg=03

" Use terminal background
" highlight Normal ctermfg=none ctermbg=none

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" }}}
" Custom key mappings {{{

" Move by file line not screen line
nnoremap j gj
nnoremap k gk

"noremap å *<C-o> Not required
nnoremap <CR> <nop>
map <silent> ö ^
map <silent> ä $
"map <silent> Å <C-]>
noremap <C-e> 5<C-e>
noremap <C-y> 5<C-y>
"nmap <C-N> <C-T>

" Window movement
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Tab movement
noremap <S-Tab> :tabn<CR>
noremap <leader>tn :tabnew<CR>

" Make backspace delete in visual mode
vnoremap <bs> x

nnoremap <leader>ma :marks<CR>

noremap qq :bd<CR>

" Save as root
cnoremap w!! :w !sudo tee % > /dev/null<CR>

" System clipboard interaction
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
"noremap <leader>y "*y
"noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
"noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Reselect text that was just pasted
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>v V`]

" Clean trailing whitespace
" https://github.com/sjl/dotfiles/blob/master/vim/vimrc
nnoremap <leader>ss mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Toggle invisible characters
nnoremap <leader>ii :set list!<CR>

" Visual shifting without exiting visual mode
vnoremap < <gv
vnoremap > >gv

" Perl style regular expressions by default
nnoremap / /\v
vnoremap / /\v

" Clear search
nnoremap <leader><space> :noh<cr>

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Spell check with aspell
noremap <leader>as :w!<CR>:!aspell -l en check %<CR>:e! %<CR>
noremap <leader>ass :w!<CR>:!aspell -l sv check %<CR>:e! %<CR>
noremap <leader>asf :w!<CR>:!aspell -l fi check %<CR>:e! %<CR>

" Spell check with vim
noremap <leader>sc :setlocal spell spelllang=en_us<CR>
noremap <leader>scs :setlocal spell spelllang=sv_se<CR>

" Easy filetype switching
nnoremap _md :set ft=markdown<CR>
nnoremap _js :set ft=javascript<CR>
nnoremap _css :set ft=css<CR>
nnoremap _php :set ft=php<CR>
nnoremap _d :set ft=diff<CR>

noremap <leader>gs :Gstatus<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gg :Gbrowse<CR>

nmap <silent> <leader>tg :GundoToggle<CR>
nmap <silent> <leader>ts :SyntasticToggle<CR>
nmap <silent> <leader>tl :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>tq :call ToggleList("Quickfix List", 'c')<CR>
nmap <silent> <leader>tc :call ToggleCopyMode ()<cr>

" ` is difficult to press on a swedish keyboard
noremap '. `.
noremap '< `<
noremap '> '>
noremap '[ `[
noremap '] ']

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

" Local config
if filereadable("vimrc.local")
  source vimrc.local
endif

" }}}
" Auto commands {{{

" Automatically change current dir to that of the file in the buffer
" @see https://github.com/tpope/vim-fugitive/issues/3
"au BufEnter * cd %:p:h            " Automatically change current dir to that of the file in the buffer
au BufEnter * if expand('%:p') !~ '://' | cd %:p:h | endif

au BufWinLeave * silent! mkview   " make vim save view state,folds,cursor,etc
au BufWinEnter * silent! loadview " make vim load view state,folds,cursor,etc
au FocusLost * :wa                " Save on losing focus

" Make sure Vim returns to the same line when you reopen a file.
" By Amit
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute 'normal! g`"zvzz' |
    \ endif
augroup END

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
au FileType html,php nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

" }}}
" Plugins {{{

" textmanip
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-l> <Plug>(textmanip-move-right)

" Emmet
let g:user_emmet_leader_key = '<c-y>'

" Ack
nnoremap <leader>a :Ack!

" Ack for the last search.
" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Clam
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>

" Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_right = 1
let g:gundo_preview_bottom = 1

" Matchmaker
let g:matchmaker_enable_startup = 1

" Vim-javascript
let g:javascript_conceal = 1
let b:javascript_fold = 1
let javascript_enable_domhtmlcss = 1

" }}}
" Autocompletion {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_auto_select = 1 " ?
let g:neocomplete#sources#syntax#min_keyword_length = 0
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#data_directory = '~/.vim/neocomplete'
let g:neocomplete#sources#buffer#cache_limit_size = 0

" Define keywords
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" 1. If expandable -> Expand
" 2. If selected -> Insert
" 3. Close popup and insert <space>
imap <expr><Space> neosnippet#expandable() ?
  \ "\<Plug>(neosnippet_expand)"
  \: pumvisible() ? "\<C-y><Space>" : neocomplete#cancel_popup()."<Space>"

" 1. If jumpable -> Jump
" 2. If selected -> Insert
" 3. Insert <tab>
imap <expr><Tab> neosnippet#jumpable() ?
  \ "\<Plug>(neosnippet_jump)"
  \: pumvisible() ? "\<C-n>" : "\<Tab>"

smap <expr><Tab> neosnippet#jumpable() ?
  \ "\<Plug>(neosnippet_jump)"
  \: "\<Tab>"

" 1. If expandable or jumpable -> Expand/Jump
" 2. If selected -> Insert
" 3. Insert <CR>
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-y>" : "<CR>"

" <C-h>, <BS>: close popup and delete backword char.
" Sort of useless...
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" }}}
" Snippets {{{

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#enable_preview = 1

" }}}
" Unite {{{

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1
let g:unite_enable_smart_case = 1

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/', 'bower_components/', 'node_modules/'
  \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC>   <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <TAB>   <Plug>(unite_select_next_line)
  imap <buffer> <C-p>   <Plug>(unite_toggle_auto_preview)
  nmap <buffer> <C-p>   <Plug>(unite_toggle_auto_preview)
endfunction

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.custom = { 'description': 'Custom commands', }
let g:unite_source_menu_menus.custom.candidates = {
  \'git status           (fugitive)        ⌘ ,gs': 'Gstatus',
  \'git diff             (fugitive)        ⌘ ,gd': 'Gdiff',
  \'gundo toggle         (gundo)           ⌘ ,gu': 'GundoToggle',
\}
function g:unite_source_menu_menus.custom.map(key, value)
  return { 'word' : a:key, 'kind' : 'command', 'action__command' : a:value, }
endfunction

" @TODO figure out where resume is non intuitive
noremap <leader>f :<C-u>Unite -resume -buffer-name=files   file_rec/async:!<CR>
noremap <leader>m :<C-u>Unite -resume -buffer-name=files   file_mru<CR>
noremap <leader>b :<C-u>Unite -resume -buffer-name=buffers -quick-match buffer<CR>
noremap <leader>y :<C-u>Unite -resume -buffer-name=history history/yank<CR>
noremap <leader>g :<C-u>Unite -resume -buffer-name=grep    grep:.<CR>
noremap <leader>o :<C-u>Unite -resume -buffer-name=outline outline<CR>
noremap <leader>l :<C-u>Unite -resume -buffer-name=line    line<CR>
noremap <leader>c :<C-u>Unite -resume -buffer-name=custom  menu:custom<Cr>

" }}}
" Custom functions {{{

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" When you're working remotely and need to copy something to your clipboard {{{

function! ToggleCopyMode ()
  if &mouse == 'a' | set mouse= | else | set mouse=a | endif
  set relativenumber!
  set list!
endfunction " }}}

" Generate a doxygen comment for implement hooks {{{
noremap <leader>di :call DrupalImplementsComment ()<CR>

function! DrupalImplementsComment ()
  let module = matchstr(bufname("%"), '[a-z0-9]*')
  let current_line = getline(".")
  let hook_idx = matchend(current_line, "function " . module . "_")
  if !empty(module) && hook_idx != -1
    let hook_length = match(current_line, "(") - hook_idx
    let hook_name = strpart(current_line, hook_idx, hook_length)
    call DoxygenComment ("Implements hook_" . hook_name . "().")
  else
    call DoxygenComment ()
  endif
endfunction " }}}

" Doxygen comment {{{
" if a message is passed the cursor will remain
" put, if not, vim will be in insert mode ready for comment message.
noremap <leader>dc :call DoxygenComment ()<CR>

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
endfunction " }}}

" Motion for numbers {{{
" https://github.com/sjl/dotfiles/blob/master/vim/vimrc

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
  normal! v

  while getline('.')[col('.')] =~# '\v[0-9]'
    normal! l
  endwhile

  if a:whole
    normal! o

    while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
      normal! h
    endwhile
  endif
endfunction " }}}

" }}}
" Filetype-specific {{{

" C {{{

augroup ft_c
  au!
  au FileType c setlocal foldmethod=syntax
augroup END

" }}}
" CSS {{{

augroup ft_css
  au!

  au FileType less,css,sass,scss setlocal foldmethod=marker
  "au FileType less,css,sass setlocal foldmarker={,}
  au Filetype less,css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  au Filetype less,css,sass,scss setlocal iskeyword+=-

  "Sort CSS attributes alphabetically
  "Stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
  au BufNewFile,BufRead *.less,*.css,*.sass,*.scss nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

  " Autocopmlete {<cr> properly
  au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><esc>O
augroup END

" }}}
" HTML {{{

augroup ft_html
  au!
  au FileType html setlocal foldmethod=manual
  au Filetype html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

" }}}
" JavaScript {{{

augroup ft_javascript
  au!

  au FileType javascript setlocal foldmethod=marker
  au FileType javascript setlocal foldmarker={,}

  " Autocopmlete {<cr> properly
  au BufNewFile,BufRead *.js inoremap <buffer> {<cr> {}<left><cr><esc>O
augroup END

" }}}
" PHP {{{

" Set Wordpres specific settings according to code conventions
function! SetWPConfig ()
  " @TODO, highglight tabs and trailing whitespace
  "match UsingWS /\v^\ +/
  "match TrailingWS /\s+$)/
  setlocal shiftwidth=2 softtabstop=2 tabstop=2
  setlocal noexpandtab
  setlocal nolist
endfunction

" Set Drupal specific settings according to code conventions
function! SetDrupalConfig ()
  if &filetype == 'php'
    setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    setlocal listchars=tab:▸\ ,trail:·
    setlocal tags=~/.vim/tags/drupal7
  endif
endfunction

augroup ft_php
  au!

  au FileType php setlocal foldmethod=marker
  au FileType php setlocal foldmarker={,}

  au BufRead,BufNewFile *.module,*.install,*.test,*.inc setlocal filetype=php

  " Wordpress and Drupal files
  au BufRead,BufNewFile */wp-content/* call SetWPConfig()
  au BufRead,BufNewFile */sites/all/* call SetDrupalConfig()
augroup END

" }}}
" Java {{{

augroup ft_java
  au!

  au FileType java setlocal foldmethod=marker
  au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
  au!

  au BufNewFile,BufRead *.m*down setlocal filetype=markdown
  au Filetype markdown setlocal omnifunc=htmlcomplete#CompleteTags

  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
  au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Vim {{{

augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" Mail {{{

augroup ft_mail
  au!

  au Filetype mail setlocal spell
augroup END

" }}}
" QuickFix {{{

augroup ft_quickfix
  au!

  au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END

" }}}

" }}}
