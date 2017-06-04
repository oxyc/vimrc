" File types
" ---------------------------------------------------------------------------

augroup MyAutoCmd
  " Update filetype.
  autocmd BufWritePost *
      \ if &l:filetype ==# '' || exists('b:ftdetect')
      \ |   unlet! b:ftdetect
      \ |   filetype detect
      \ | endif

  autocmd BufRead,BufNewFile *.twig setlocal filetype=html.twig
  " Associate Drupal files as php
  autocmd BufRead,BufNewFile *.module,*.install,*.test,*.inc setlocal filetype=php
  " Associate all markdown extensions as ghmarkdown
  autocmd BufNewFile,BufRead *.m*down setlocal filetype=ghmarkdown

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
  autocmd FileType html,ghmarkdown,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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
  " Autocopmlete {<cr> properly @todo
  "autocmd FileType less,css inoremap <buffer> {<cr> {}<left><cr><esc>O
  "au BufNewFile,BufRead *.js inoremap <buffer> {<cr> {}<left><cr><esc>O

  " Use <localleader>1/2/3 to add headings.
  autocmd Filetype ghmarkdown,markdown nnoremap <buffer> <localleader>1 yypVr=
  autocmd Filetype ghmarkdown,markdown nnoremap <buffer> <localleader>2 yypVr-
  autocmd Filetype ghmarkdown,markdown nnoremap <buffer> <localleader>3 I### <esc>

  " Improved path patterns
  autocmd FileType php setlocal path+=/usr/local/share/pear
augroup END

" http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
    \  'coffee',
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

" Highlight SQL queries expressed in strings
let g:php_sql_query = 1
let g:php_folding = 1
" Indent switch case and default
let g:PHP_vintage_case_default_indent = 1
