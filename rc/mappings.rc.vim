" Mappings {{{
" ---------------------------------------------------------------------------

" Disable enter as it's too easily pressed by accident.
nnoremap <CR> <nop>

" toggle paste mode
set pastetoggle=<F2>
" }}}

" Remappings {{{
" ---------------------------------------------------------------------------

" Perl style regular expressions by default
nnoremap / /\v
vnoremap / /\v

" Make backspace delete in visual mode
vnoremap <backspace> x

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Close buffer
nnoremap qq :bd<CR>

" avoid auto-indenting pound signs
inoremap # x<C-H>#

" }}}

" User Interface {{{
" ---------------------------------------------------------------------------

" Window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap <C-h> <C-w>h
vnoremap <C-j> <C-w>j
vnoremap <C-k> <C-w>k
vnoremap <C-l> <C-w>l

" Tab movement
noremap <s-tab> :tabn<CR>
noremap <leader>tn :tabnew<CR>
" }}}

" Functionality {{{
" ---------------------------------------------------------------------------
"
" Change current dir to that of the file in the buffer
nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <leader>lcd :lcd %:p:h<CR>

" Toggle invisible characters.
nnoremap <leader>ti :set list!<CR>

" Display marks.
nnoremap <leader>ma :marks<CR>

" Clear search
nnoremap <leader><space> :noh<cr>

" Find merge conflict markers
nnoremap <leader>mc /\v^[<\|=>]{7}( .*\|$)<CR>

" Save as root
cnoremap w!! :w !sudo tee % > /dev/null<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :<C-u>set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :<C-u>set paste<CR>"*P<CR>:set nopaste<CR>

" Reselect text that was just pasted
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>v V`]

" Search and replace
xnoremap s :s//g<Left><Left>
nnoremap %s :%s//g<Left><Left>
" }}}

" Movement {{{
" ---------------------------------------------------------------------------

" Move by file line not screen line (wrapped lines)
nnoremap j gj
nnoremap k gk

" Visual shifting without exiting visual mode
vnoremap < <gv
vnoremap > >gv

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Location
nnoremap ln :lnext<CR>
nnoremap lp :lprev<CR>

" }}}

" Folding {{{
" ---------------------------------------------------------------------------
" zM      - close all folds
" zR      - open all folds
" <s><s>  - toggle fold
" zO      - open top level fold we're in
" ,z      - focus fold
" zc      - close fold

" Space to toggle folds
nnoremap <space><space> zA
vnoremap <space><space> zA

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" Use ,z to focus the current fold
nnoremap <leader>z zMzAzz
" }}}

" Motion for numbers {{{
" ---------------------------------------------------------------------------
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

" Delete current buffers view {{{
" ---------------------------------------------------------------------------
" https://stackoverflow.com/a/28460676/319855

function! MyDeleteView()
  let path = fnamemodify(bufname('%'),':p')
  " vim's odd =~ escaping for /
  let path = substitute(path, '=', '==', 'g')
  if empty($HOME)
  else
      let path = substitute(path, '^'.$HOME, '\~', '')
  endif
  let path = substitute(path, '/', '=+', 'g') . '='
  " view directory
  let path = &viewdir.'/'.path
  if filereadable(path)
    call delete(path)
    echo "Deleted: ".path
  else
    echo "No view exists."
  endif
endfunction

" Command Delview (and it's abbreviation 'delview')
command! Delview call MyDeleteView()
" }}}
