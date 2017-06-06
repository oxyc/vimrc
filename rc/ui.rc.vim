" User Interface
" ---------------------------------------------------------------------------
" Enable syntax color
syntax enable
" Needs to run after dein#end()
filetype plugin indent on
" Use relative line numbers if available.
if exists("+relativenumber") | set relativenumber | else | set number | endif
" Show <Tab> and trailing whitespace
set list
set listchars=tab:▸\ ,trail:·
" Always show the status line.
set laststatus=2
" Show the command being typed.
set showcmd
" Don't show the mode (eg. --VISUAL--).as we have airline and echodoc uses it.
set noshowmode
" Set window title to the filename.
set title

" Do not wrap line.
set nowrap
" http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
set whichwrap+=h,l,<,>,[,]
" Distinguish wrapped lines.
set showbreak=↪

" Disable bell.
set t_vb=
set novisualbell

" Turn on cli completion wild style.
set wildmenu
" Turn on wild mode huge list.
set wildmode=list:longest
" ignore these file extensions
set wildignore=*.jpg,*.png,.git
" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag

" Keep a longer history
set history=1000

" Enable spell check.
set spelllang=en_us

" use the dictionary for autocompletion
set complete+=k
" Better completion @todo
set completeopt=longest,menuone,noinsert
" Set popup menu max height.
set pumheight=20

" Report all changes from exec.
set report=0

" Don't reset cursor to start of line when moving around.
set nostartofline

" @todo
set sidescrolloff=10
" Keep 10 lines for scope.
set scrolloff=10

" Open splits below the current one.
set splitbelow
" Open vsplits on the right of the current one.
set splitright
" Set minimal width for current window.
set winwidth=30
" Set minimal height for current window.
set winheight=1
" Adjust window size of preview and help.
set previewheight=8
set helpheight=12
" Resize splits when the window is resized
autocmd MyAutoCmd VimResized * exe "normal! \<c-w>="

" Abbrevation of messages (avoids hit enter).
set shortmess+=filmnrxoOtT

" Don't redraw while macro executing.
set lazyredraw
" Faster redrawing
set ttyfast
" Enable mouse in all modes.
set mouse=a

" When a line is long, do not omit it in @. @todo
set display=lastline

" Highlight the current line.
set cursorline
" Don't insert any extra lineheight.
set linespace=0
" Always show current position.
set ruler

" limit syntax highlighting of long lines.
set synmaxcol=400

if v:version >= 703
  set colorcolumn=79
endif

" Preserve state
" ---------------------------------------------------------------------------
augroup MyAutoCmd
  " Save view state when leaving a buffer.
  autocmd BufWinLeave * silent! mkview
  " Load earlier view state when entering a buffer.
  autocmd BufWinEnter * silent! loadview
  " Make sure Vim returns to the same line when you reopen a file.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   execute 'normal! g`"zvzz' |
    \ endif
augroup END

" Search
" ---------------------------------------------------------------------------

" Highlight search.
set hlsearch
" Highlight as you type your search.
set incsearch
" Case insensitive by default
set ignorecase
" If there are caps, go case-sensitive
set smartcase
" Add the g flag to search/replace by default
set gdefault

" Theme
" ---------------------------------------------------------------------------
" Theme: base16-default.dark.256
" Use the 256 variation to get additional shades of gray.

" Set the number of colors to 256
set t_Co=256

" Setup base16 colorscheme assuming
" - A terminal capable of modifying colors in the 256 color space (not Terminal.app https://goo.gl/SQTrDd)
" - A terminal which uses the base16-default.dark.256 theme (https://goo.gl/Dk9cYv)
" - A shell with base16-based ANSI colors (https://github.com/chriskempson/base16-shell)
if dein#tap('base16-vim')
  " Specify that vim should use the dark variation
  set background=dark
  " Use colors from the 256 coolor space.
  let base16colorspace=256
  " Set colorscheme.
  colorscheme base16-default-dark
else
  colorscheme delek
end
