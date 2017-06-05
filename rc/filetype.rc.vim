" File types
" ---------------------------------------------------------------------------

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

" Javascript
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

augroup MyAutoCmd
  " Update filetype on save.
  autocmd BufWritePost *
      \ if &l:filetype ==# '' || exists('b:ftdetect')
      \ |   unlet! b:ftdetect
      \ |   filetype detect
      \ | endif

  autocmd BufRead,BufNewFile vimrc setlocal filetype=vim
  " Associate Drupal files as php.
  autocmd BufRead,BufNewFile *.module,*.install,*.test,*.inc setlocal filetype=php

  " Filetype should be twig while syntax is both html and twig.
  autocmd BufRead,BufNewFile *.twig set filetype=twig
  autocmd BufRead,BufNewFile *.twig set syntax=html.twig

  " Fold vimscript based on indentation.
  autocmd FileType vim setlocal foldmethod=indent foldnestmax=1
  autocmd FileType gitcommit,qfreplace setlocal nofoldenable

  " @todo
  autocmd FileType help setlocal textwidth=78
  autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

  " Enable spell checker in emails
  autocmd FileType mail setlocal spell

  " Simplify quickfix window
  autocmd FileType qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0

  " Allow dashed attributed to be keywords in css
  autocmd FileType less,css,sass,scss setlocal iskeyword+=-

  " Enable omni completion
  autocmd Filetype less,css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType python
      \ if has('python') | setlocal omnifunc=pythoncomplete#Complete | endif |
      \ if has('python3') | setlocal omnifunc=python3complete#Complete | endif

  "Sort CSS attributes alphabetically
  "Stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc
  autocmd FileType less,css,sass,scss nnoremap <buffer> <localleader>s ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

  " Use <localleader>1/2/3 to add headings.
  autocmd Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
  autocmd Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
  autocmd Filetype markdown nnoremap <buffer> <localleader>3 I### <esc>

  " Improved path patterns
  autocmd FileType php setlocal path+=/usr/local/share/pear
augroup END
