" File types
" ---------------------------------------------------------------------------

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

  " Filetype should be vue while syntax are all options.
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

  " Fix syntax highlighting errors with long multiline strins.
  autocmd FileType toml syntax sync minlines=500

  " Fold vimscript based on indentation.
  autocmd FileType vim setlocal foldmethod=indent foldnestmax=1
  autocmd FileType gitcommit,qfreplace setlocal nofoldenable

  " @todo
  autocmd FileType help setlocal textwidth=78
  autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

  " Wrap markdown
  autocmd FileType markdown setlocal wrap

  " Enable spell checker in emails
  autocmd FileType mail setlocal spell

  " Disable backups when editin crontab
  autocmd FileType crontab setlocal nobackup nowritebackup

  " Simplify quickfix window
  autocmd FileType qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0

  " Allow dashed attributed to be keywords in css
  autocmd FileType less,css,sass,scss setlocal iskeyword+=-

  " Enable omni completion
  autocmd Filetype less,css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType python
      \ if has('python') | setlocal omnifunc=pythoncomplete#Complete | endif |
      \ if has('python3') | setlocal omnifunc=python3complete#Complete | endif

  if !dein#tap('phpcomplete-extended')
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  endif

  " Improve PHP performance.
  autocmd FileType php setlocal foldmethod=manual
  autocmd FileType php syntax sync minlines=200

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
