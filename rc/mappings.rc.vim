" Mappings {{{
" ---------------------------------------------------------------------------

" Disable enter as it's too easily pressed by accident.
nnoremap <CR> <nop>

" toggle paste mode
set pastetoggle=<F2>
" }}}

" Remappings {{{
" ---------------------------------------------------------------------------

" US layout mappings
noremap <silent>§ ~
noremap <silent>° `
noremap <silent>" @
noremap <silent>€ $
noremap <silent>& ^
" noremap <silent> / *
" noremap <silent> = -
" noremap <silent> + -
" noremap <silent> ? _
" noremap <silent> ´ =
" noremap <silent> ` +
noremap <silent>å [
noremap <silent>¨ ]
noremap <silent>Å {
noremap <silent>^ }
" Switch these as typing a letter after <shift>ö would easily result in
"accidentally uppercasing the command
noremap <silent>ö :
noremap <silent>öö ;
noremap <silent>Ö ;
noremap <silent>ä '
noremap <silent>Ä "
" noremap <silent> ' \
" noremap <silent> * |
noremap <silent>; <
noremap <silent>: >
" noremap <silent> - ?
" noremap <silent> _ /
" usefuel leftover: < >

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
"
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :<C-u>set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :<C-u>set paste<CR>"*P<CR>:set nopaste<CR>

" Reselect text that was just pasted
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap <leader>v V`]
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

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to focus the current fold
nnoremap <leader>z zMzAzz
" }}}

" https://github.com/rhysd/clever-f.vim {{{
" ---------------------------------------------------------------------------
" f       - find next character
" F       - find previous character
" t       - find next character (preceding cursor)
" T       - find previous character (preceding cursor)
"  }}}
"
" https://github.com/mattn/emmet-vim {{{
" ---------------------------------------------------------------------------
" <tab>  - expand abbreviation
" }}}

" https://github.com/tmhedberg/matchit {{{
" ---------------------------------------------------------------------------
" %     - cycle forward
" a%    - select mathing group in visual mode
" }}}

" https://github.com/Shougo/neocomplete.vim {{{
" ---------------------------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
endif " }}}

" https://github.com/Shougo/neosnippet.vim {{{
" ---------------------------------------------------------------------------
if neobundle#is_installed('neosnippet.vim')
 function! s:can_snip()
    return neosnippet#expandable_or_jumpable() && &filetype != "snippet"
  endfunction

  let s:pair_closes = ["]", "}", ")", "'", '"', ">", "|" , ","]
  let s:pair_opens = ["[", "{", "("]
  let s:char_skip = ['"', "'"]

  function! s:imap_tab()
    let has_emmet = neobundle#is_installed('emmet-vim')

    " @todo neocomplete#complete_common_string()
    if neosnippet#expandable()
      call neocomplete#smart_close_popup()
      return "\<Plug>(neosnippet_expand)"
    elseif neosnippet#jumpable()
      call neocomplete#smart_close_popup()
      return "\<Plug>(neosnippet_jump)"
    elseif pumvisible()
      call neocomplete#smart_close_popup()
      return "\<C-Y>"
    endif

    let line = getline(".")
    let pos = col(".") - 1
    let org_pos = pos

    let ch = matchstr(line, '\%' . pos . 'c.')

    " Tab-complete a closing bracket
    let pair_idx = index(s:pair_opens, ch)
    if pair_idx != -1
      return s:pair_closes[pair_idx]
    endif

    " Last character on line, insert a tab
    if strlen(substitute(line[0:pos], '^\s*', '', '')) <= 0
      return "\<Tab>"
    endif

    " Move to first character.
    while (matchstr(line, '\%' . pos . 'c.') == " ")
      let pos = pos + 1
    endwhile

    let ch = matchstr(line, '\%' . pos . 'c.')

    " Skip ahead of " and ' (argument)
    if index(s:char_skip, ch) != -1
      " If immediately followed by a closing pair, skip ahead of that too.
      if (index(s:pair_closes, line[pos + 1]) != -1)
        return "\<Right>\<Right>"
      endif
      return "\<Right>"
    endif

    " If it's a closing pair, skip ahead of it.
    if index(s:pair_closes, ch) != -1
      while (line[pos+1] == " ")
        let pos = pos+1
      endwhile
      return repeat("\<Right>", pos - org_pos + 1)
    endif

    " If it's an expandable emmet abbreviation, expand it.
    if has_emmet
      \ && len(matchstr(&filetype, 'x\?html\|s\?css\|php\|eruby')) > 0
      \ && emmet#isExpandable()
      " \ && len(matchstr(getline('.'), '^\(\w*\%'.col('.').'c\)')) > 0
      call neocomplete#smart_close_popup()
      return "\<Plug>(emmet-expand-abbr)"
    endif

    " Insert a tab as last resort.
    return "\<Tab>"
  endfunction

  " Magic tab-completion in insert mode
  if neobundle#is_installed('neocomplete')
    imap <expr><Tab> <SID>imap_tab()
    " Close popup and delete backword char.
    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"

    " Select the next entry in the popup
    inoremap <expr> <S-tab> pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
    " Select the previous entry in the popup
    inoremap <expr> <C-tab> pumvisible() ? "\<C-p>" : neocomplete#start_manual_complete()

    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()

    " Let <cr> cancel any completion and just input a new line
    imap <silent> <cr> <C-r>=<SID>imap_cr()<CR>
    function! s:imap_cr()
      return neocomplete#cancel_popup() . "\<cr>"
    endfunction
  endif


  "imap <expr><Space> <SID>imap_space()
  " Expand neosnippets in select mode
  smap <expr><Tab> <SID>can_snip() ? "\<Plug>(neosnippet_jump_or_expand)" : "\<Tab>"

endif " }}}

" https://github.com/scrooloose/syntastic {{{
" ---------------------------------------------------------------------------
" ,ts  - toggle syntastic
if neobundle#is_installed('syntastic')
  " @todok
  nnoremap <silent> <leader>ts :<C-u>SyntasticToggle<cr>
endif " }}}

" https://github.com/mbbill/undotree {{{
" ---------------------------------------------------------------------------
" ,tu  - toggle undo tree
if neobundle#is_installed('undotree')
  nnoremap <silent> <leader>tu :<C-u>UndotreeToggle<cr>
endif " }}}

" https://github.com/Shougo/unite.vim {{{
" ---------------------------------------------------------------q------------
if neobundle#is_installed('unite.vim')
  noremap <leader>f :<C-u>Unite -resume -buffer-name=files    file_rec/async<CR>
  noremap <leader>m :<C-u>Unite -resume -buffer-name=files    file_mru<CR>
  noremap <leader>b :<C-u>Unite -resume -buffer-name=buffers -quick-match buffer<CR>
  noremap <leader>y :<C-u>Unite -resume -buffer-name=history  history/yank<CR>
  noremap <leader>g :<C-u>Unite -resume -buffer-name=grep     grep:.<CR>
  noremap <leader>l :<C-u>Unite -resume -buffer-name=line     line<CR>
  noremap <leader>u :<C-u>Unite -resume -buffer-name=unite    menu:unite<Cr>
  noremap <leader>c :<C-u>Unite -resume -buffer-name=mappings mappings<Cr>
  noremap <leader>x <Plug>(unite_redraw)
endif " }}}

" https://github.com/osyo-manga/unite-quickfix {{{
" ---------------------------------------------------------------------------
if neobundle#is_installed('unite-quickfix')
  " @todo
endif " }}}}

" https://github.com/tpope/vim-commentary {{{
" ---------------------------------------------------------------------------
" gcc   - comment out line
" gc    - comment out motion
" }}}

" https://github.com/twe4ked/vim-diff-toggle {{{
" ---------------------------------------------------------------------------
" <space> - toggle diff add/edit/del
" }}}

" https://github.com/junegunn/vim-easy-align {{{
" ---------------------------------------------------------------------------
" ,a  - start interactive alignment
if neobundle#is_installed('vim-easy-align')
  " Start interactive EasyAlign in visual mode.
  vmap <Enter> <Plug>(LiveEasyAlign)

  " Start interactive EasyAlign for a motion/text object.
  nmap <leader>a <Plug>(LiveEasyAlign)
endif " }}}

" https://github.com/Lokaltog/vim-easymotion {{{
" ---------------------------------------------------------------------------
" s     - init jump
" t     - init backwards jump
" <s>h/l
" n     - repeat search forward
" N     - repeat search backwards
" ,,    - easy motion
if neobundle#is_installed('vim-easymotion')
  " Jump to anywhere you want with minimal keystrokes.
  nmap s <Plug>(easymotion-s2)
  nmap t <Plug>(easymotion-t2)
  " JK motions: Line motions
  map <space>h <Plug>(easymotion-linebackward)
  map <space>l <Plug>(easymotion-lineforward)

  call neobundle#untap()
endif " }}}

" https://github.com/lambdalisue/vim-gista {{{
" ---------------------------------------------------------------------------
" ,gl   - list gists
" ,gg   - create or update gist
" ,gp   - create a private gist
" ,gb   - open gist in browser
" ,gy   - yank the url of the gist
if neobundle#is_installed('vim-gista')
  nnoremap <silent> <leader>gl :<C-u>Unite gista<CR>
  nnoremap <silent> <leader>gg :<C-u>Gista<CR>
  nnoremap <silent> <leader>gp :<C-u>Gista --private<CR>
  nnoremap <silent> <leader>gb :<C-u>Gista --browse<CR>
  nnoremap <silent> <leader>gy :<C-u>Gista --yank<CR>
endif " }}}

" https://github.com/lambdalisue/vim-gita {{{
" ---------------------------------------------------------------------------
" <s>gs   - git status
" <s>gc   - git commit
" <s>gd   - git diff --cached
" <s>gD   - git diff
" <s>gb   - open in browser
" <s>gy   - yank the url of the file
" <s>gp   - git push
" <s>gl   - git log
" <s>gL   - git log for current file
if neobundle#is_installed('vim-gita')
  nnoremap <silent> <space>gs :<C-u>Gita status<CR>
  nnoremap <silent> <space>gc :<C-u>Gita commit<CR>
  nnoremap <silent> <space>gd :<C-u>Gita diff --cached<CR>
  nnoremap <silent> <space>gD :<C-u>Gita diff<CR>
  nnoremap <silent> <space>gb :<C-u>Gita browse<CR>
  nnoremap <silent> <space>gy :<C-u>Gita browse --yank<CR>
  nnoremap <silent> <space>gp :<C-u>Gita push<CR>
  nnoremap <space>gl  :<C-u>Gita log --pretty=oneline<CR>
  nnoremap <space>gL  :<C-u>Gita log --pretty=oneline --<CR>
endif " }}}

" https://github.com/superbrothers/vim-quickrun-markdown-gfm {{{
" ---------------------------------------------------------------------------
" ,qm   - render current markdown buffer in browser.
if neobundle#is_installed('vim-quickrun-markdown-gfm')
  nnoremap <silent> <leader>qm :<C-u>QuickRun markdown<CR>
endif " }}}
"
" https://github.com/thinca/vim-quickrun {{{
" ---------------------------------------------------------------------------
" ,qb   - execute current buffer.
if neobundle#is_installed('vim-quickrun')
  nnoremap <silent> <leader>qb <Plug>(quickrun)
endif " }}}

" https://github.com/kshenoy/vim-signature {{{
" ---------------------------------------------------------------------------
"  @todo
" if neobundle#is_installed('vim-signature')
" endif " }}}

" https://github.com/tpope/vim-speeddating {{{
" ---------------------------------------------------------------------------
" <C-a>   - Increase number under cursor
" <C-x>   - Decrease number under cursor
" }}}

" https://github.com/tpope/vim-surround {{{
" ---------------------------------------------------------------------------
" @todo
" }}}

" https://github.com/tpope/vim-unimpaired {{{
" ---------------------------------------------------------------------------
" @todo
" }}}

" https://github.com/Shougo/vimfiler.vim {{{
" ---------------------------------------------------------------------------
" ,fb     - open vimfiler in buffer
" ,fe     - open vimfiler explorer
"
"   t     - toggle tree
"   T     - toggle tree recursively
"   q     - close vimfiler
"   <tab> - switch to other window
if neobundle#is_installed('vimfiler.vim')
  nnoremap <silent> <leader>fb   :<C-u>VimFiler -invisible<CR>
  nnoremap <leader>fe   :<C-u>VimFilerExplorer<CR>
endif " }}}

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
