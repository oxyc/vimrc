" Plugins
" ---------------------------------------------------------------------------

" https://github.com/jiangmiao/auto-pairs {{{
if neobundle#tap('auto-pairs')
  let g:AutoPairsFlyMode = 0
  let g:AutoPairsMultilineClose = 0

  call neobundle#untap()
endif " }}}

" https://github.com/rhysd/clever-f.vim {{{
if neobundle#tap('clever-f.vim')
  let g:clever_f_smart_case = 1
  let g:clever_f_chars_match_any_signs = ';'

  call neobundle#untap()
endif " }}}

" https://github.com/rhysd/committia.vim {{{
if neobundle#tap('committia.vim')
  " Only use from git cli, not to conflict with other git plugins (vim-gita).
  let g:committia_open_only_vim_starting = 1
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    setlocal spell
    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
      startinsert
    end
  endfunction

  call neobundle#untap()
endif " }}}

" https://github.com/Shougo/echodoc.vim {{{
if neobundle#tap('echodoc.vim')
  let g:echodoc_enable_at_startup = 1
  call neobundle#untap()
endif " }}}

" https://github.com/mattn/emmet-vim {{{
if neobundle#tap('emmet-vim')
  " Only enable insert mode functions
  let g:user_emmet_mode='i'
  " Enable only for HTML and CSS
  let g:user_emmet_install_global = 0

  call neobundle#untap()
endif " }}}

" https://github.com/othree/html5.vim {{{
" if neobundle#tap('html5.vim')
"
"   call neobundle#untap()
" endif " }}}

" https://github.com/tmhedberg/matchit {{{
if neobundle#tap('matchit')
  " Fix matchpairs for PHP
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

  " Fix lazy loading issue
  " https://github.com/Shougo/neobundle.vim/issues/153
  function! neobundle#hooks.on_post_source(bundle)
    silent! execute 'doautocmd Filetype' &filetype
  endfunction

  call neobundle#untap()
endif " }}}

" https://github.com/Shougo/neomru.vim {{{
if neobundle#tap('neomru.vim')
  let g:neomru#directory_mru_path = $VIM_CACHE.'/vim-neomru'
  let g:neomru#file_mru_path = $VIM_CACHE.'/vim-neomru/file'

  call neobundle#untap()
endif " }}}

" https://github.com/Shougo/neocomplete.vim {{{
if neobundle#tap('neocomplete')
  " @todo
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_fuzzy_completion = 1
  let g:neocomplete#enable_auto_select = 1
  " Minimum length of keyword becoming the target
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Begin autocompleting at 1 character
  let g:neocomplete#auto_completion_start_length = 1
  let g:neocomplete#enable_auto_delimiter = 1

  " Maximum targets
  let g:neocomplete#max_list = 10
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplete#data_directory = $VIM_CACHE.'/vim-neocomplete'
  let g:neocomplete#sources#buffer#cache_limit_size = 500000
  " Faster to specify it.
  let g:neocomplete#use_vimproc = 1

  "let g:neocomplete#enable_cursor_hold_i = 1
  "let g:neocomplete#cursor_hold_i_time = 300
  let g:neocomplete#enable_insert_char_pre = 1

  " Define keywords
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  call neobundle#untap()
  endif " }}}

" https://github.com/Shougo/neosnippet.vim {{{
if neobundle#tap('neosnippet.vim')
  "let g:neosnippet#snippets_directory = $VIM_CACHE.'/vim-neosnippet'
  let g:neosnippet#data_directory = $VIM_CACHE.'/vim-neosnippet'
  let g:neosnippet#enable_preview = 1

  call neobundle#untap()
endif " }}}

" https://github.com/tyru/open-browser.vim {{{
" if neobundle#tap('open-browser.vim')
"   call neobundle#untap()
" endif " }}}

" https://github.com/shawncplus/phpcomplete.vim {{{
" if neobundle#tap('phpcomplete.vim')
"   call neobundle#untap()
" endif " }}}

" https://github.com/junegunn/rainbow_parentheses.vim {{{
" if neobundle#tap('rainbow_parentheses.vim')
"   call neobundle#untap()
" endif " }}}

" https://github.com/scrooloose/syntastic {{{
if neobundle#tap('syntastic')
  " Use :sign interace to mark syntax errors
  let g:syntastic_enable_signs = 1
  " Always populate the location list
  let g:syntastic_always_populate_loc_list = 1
  " Open Error window automatically
  " @todo Unite location_list
  let g:syntastic_auto_loc_list = 1
  " Automatically jump to first detected error
  let g:syntastic_auto_jump = 1
  " Window height
  let g:syntastic_loc_list_height = 3
  " Only run on save
  let g:syntastic_check_on_open = 0
  " Run all checkers that apply
  let g:syntastic_aggregate_errors = 1

  " Prettier icons
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
  let g:syntastic_style_error_symbol = "S✗"
  let g:syntastic_style_warning_symbol = "S⚠"

  let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'

  call neobundle#untap()
endif " }}}

" https://github.com/mbbill/undotree {{{
if neobundle#tap('undotree')
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_SplitWidth = 35
  let g:undotree_DiffpanelHeight = 20

  call neobundle#untap()
endif " }}}

" https://github.com/Shougo/unite.vim {{{
if neobundle#tap('unite.vim')

  let g:unite_enable_start_insert = 1
  let g:unite_enable_short_source_names = 1
  let g:unite_enable_smart_case = 1
  let g:unite_data_directory = $VIM_CACHE.'/vim-unite'
  " Always cache no matter how many files.
  let g:unite_source_rec_max_cache_files = -1
  let g:unite_source_rec_find_arg = ['\(',
     \ '-name', '.git',         '-o', '-name', '.cache',
     \ '-name', 'node_modules', '-o', '-name', 'bower_components',
     \ '-name', '.cpan',        '-o', '-name', '.Trash',
     \ '-name', 'Caches',
     \ '\)', '-prune', '-print']

  function! neobundle#hooks.on_source(bundle)
    if executable('ag')
      let g:unite_source_grep_command = 'ag'
      let g:unite_source_grep_default_opts = '-i --line-numbers --nogroup --nocolor'
      let g:unite_source_grep_recursive_opt = ''
    elseif executable('ack')
      let g:unite_source_grep_command = 'ack'
      let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
      let g:unite_source_grep_recursive_opt = ''
    endif

    let g:unite_source_menu_menus = {}
    let g:unite_source_menu_menus.unite = {
      \   'description' : 'Start unite sources',
      \ }
    let g:unite_source_menu_menus.unite.command_candidates = {
      \   'history'    : 'Unite history/command',
      \   'quickfix'   : 'Unite qflist -no-quit',
      \   'resume'     : 'Unite -buffer-name=resume resume',
      \   'directory'  : 'Unite -buffer-name=files '.
      \         '-default-action=lcd directory_mru',
      \   'mapping'    : 'Unite mapping',
      \   'message'    : 'Unite output:message',
      \   'scriptnames': 'Unite output:scriptnames',
      \ }

    " Enable yank history, even if not performant.
    let g:unite_source_history_yank_enable = 1

    " Start insert mode in unite-action buffer.
    call unite#custom#profile('action', 'context', { 'start_insert' : 1 })
    " Custom filters @todo
    " call unite#custom#source(
    "   \ 'buffer,file_rec,file_rec/async,file_rec/git', 'matchers',
    "   \ ['converter_relative_word', 'matcher_fuzzy',
    "   \  'matcher_project_ignore_files'])
    call unite#custom#source(
      \ 'file_mru', 'matchers',
      \ ['matcher_project_files', 'matcher_fuzzy',
      \  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
    " call unite#custom#source(
    "   \ 'file_rec,file_rec/async,file_rec/git,file_mru', 'converters',
    "   \ ['converter_file_directory'])

    call unite#filters#sorter_default#use(['sorter_length'])
    call unite#filters#matcher_default#use(['matcher_fuzzy'])

    " Optimize file_rec search
    call unite#custom#source('file_rec/async', 'converters', [])
    "call unite#custom#source('file_rec/async', 'sorters', [])
    call unite#custom#source('file_rec/async', 'max_candidates', 10)

    autocmd MyAutoCmd FileType unite call s:unite_settings()

    function! s:unite_settings()
      call unite#custom#alias('file', 'h', 'left')
      call unite#custom#default_action('directory', 'narrow')

      imap <buffer> <C-j>   <Plug>(unite_select_next_line)
      imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
      imap <silent><buffer><expr> <C-x> unite#do_action('split')
      imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
      imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

      nmap <buffer> <Esc>   <Plug>(unite_exit)
      imap <buffer> <BS>    <Plug>(unite_delete_backward_path)
      imap <buffer> jj      <Plug>(unite_insert_leave)
      imap <buffer> <Tab>   <Plug>(unite_complete)
      imap <buffer> <C-p>   <Plug>(unite_toggle_auto_preview)
      nmap <buffer> <C-p>   <Plug>(unite_toggle_auto_preview)
    endfunction
  endfunction

  function! neobundle#hooks.on_post_source(bundle)
    if v:version > 703 || v:version == 703 && has('patch867')
      " Clear CursorMoved event as it's triggered too often to be performant.
      autocmd! plugin-unite-history-yank CursorMoved
  endif
endfunction

call neobundle#untap()
endif " }}}

" https://github.com/osyo-manga/unite-quickfix {{{
" if neobundle#tap('unite-quickfix')
"   call neobundle#untap()
" endif " }}}}

" https://github.com/bling/vim-airline {{{
if neobundle#tap('vim-airline')
  let g:airline_powerline_fonts = 1
  " Disable autoloading extension in runtimepath
  let g:airline#extensions#disable_rtp_load = 1
  " Manually enable extensions
  let g:airline_extensions = ['syntastic', 'quickfix']
  " Disable airline in the preview window
  let g:airline_exclude_preview = 1
  " Performance optimization by not re-evaluating the colors of the theme.
  let g:airline#themes#base16#constant = 1
  " Don't display crypt.
  let g:airline_detect_crypt = 0

  call neobundle#untap()
endif " }}}

" https://github.com/tpope/vim-commentary {{{
" if neobundle#tap('vim-commentary')
"   call neobundle#untap()
" endif " }}}

" https://github.com/skammer/vim-css-color {{{
" if neobundle#tap('vim-css-color')
"   call neobundle#untap()
" endif " }}}

" https://github.com/hail2u/vim-css3-syntax {{{
" if neobundle#tap('vim-css3-syntax')
"   call neobundle#untap()
" endif " }}}

" https://github.com/qbbr/vim-twig {{{
" if neobundle#tap('vim-twig')
"   call neobundle#untap()
" endif " }}}

" https://github.com/twe4ked/vim-diff-toggle {{{
if neobundle#tap('vim-diff-toggle')
  call neobundle#untap()
endif " }}}

" https://github.com/junegunn/vim-easy-align {{{
" if neobundle#tap('vim-easy-align')
"   call neobundle#untap()
" endif " }}}

" https://github.com/Lokaltog/vim-easymotion {{{
if neobundle#tap('vim-easymotion')
  let g:EasyMotion_smartcase = 1
  " keep cursor colum when JK motion"
  let g:EasyMotion_startofline = 0
  " remove ; as a target, as it's difficult to press on swedish keyboard.
  let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'

  call neobundle#untap()
endif " }}}

" https://github.com/tpope/vim-endwise {{{
" if neobundle#tap('vim-endwise')
"
"   call neobundle#untap()
" endif " }}}

" https://github.com/lambdalisue/vim-gista {{{
if neobundle#tap('vim-gista')
  let g:gista#github_user = 'oxyc'
  let g:gista#default_yank_method = 'url'
  " Yank the URL autmatically on save
  let g:gista#auto_yank_after_post = 1
  let g:gista#auto_yank_after_save = 1

  call neobundle#untap()
endif " }}}

" https://github.com/lambdalisue/vim-gita {{{
" if neobundle#tap('vim-gita')
"
"   call neobundle#untap()
" endif " }}}

" https://github.com/pangloss/vim-javascript {{{
if neobundle#tap('vim-javascript')
  " Highlight HTML and CSS within JavaScript
  let javascript_enable_domhtmlcss = 1
  let b:javascript_fold = 1

  call neobundle#untap()
endif " }}}

" https://github.com/elzr/vim-json {{{
if neobundle#tap('vim-json')
  let g:vim_json_syntax_conceal = 0

  call neobundle#untap()
endif " }}}

" https://github.com/jtratner/vim-flavored-markdown {{{
" if neobundle#tap('vim-flavored-markdown')
"   call neobundle#untap()
" endif " }}}

" https://github.com/qstrahl/vim-matchmaker {{{
if neobundle#tap('vim-matchmaker')
  let g:matchmaker_enable_startup = 1
  " Avoid conflicts with EasyMotion
  let g:matchmaker_matchpriority = 0

  call neobundle#untap()
endif " }}}

" https://github.com/superbrothers/vim-quickrun-markdown-gfm {{{
if neobundle#tap('vim-quickrun-markdown-gfm')
  if !exists('g:quickrun_config')
    let g:quickrun_config = {}
  endif

  let g:quickrun_config['markdown'] = {
    \   'type': 'markdown/gfm',
    \   'outputter': 'browser'
    \ }

  call neobundle#untap()
endif " }}}

" https://github.com/thinca/vim-quickrun {{{
if neobundle#tap('vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
  call neobundle#untap()
endif " }}}
"
" https://github.com/tpope/vim-repeat {{{
" if neobundle#tap('vim-repeat')
"   call neobundle#untap()
" endif " }}}

" https://github.com/kshenoy/vim-signature {{{
" if neobundle#tap('vim-signature')
"   call neobundle#untap()
" endif " }}}

" https://github.com/mhinz/vim-signify {{{
if neobundle#tap('vim-signify')
  " Only support git
  let g:signify_vcs_list = ['git']
  " Update signs when entering a buffer that was modified.
  let g:signify_update_on_bufenter = 1
  " Update signs when vim gains focus
  " let g:signify_update_on_focusgained = 0

  let g:signify_sign_add               = '+'
  let g:signify_sign_delete            = '_'
  let g:signify_sign_delete_first_line = '‾'
  let g:signify_sign_change            = '~'
  let g:signify_sign_changedelete      = g:signify_sign_change

  call neobundle#untap()
endif " }}}

" https://github.com/tpope/vim-speeddating {{{
" if neobundle#tap('vim-speeddating')
"   call neobundle#untap()
" endif " }}}

" https://github.com/tpope/vim-surround {{{
" if neobundle#tap('vim-surround')
"   call neobundle#untap()
" endif " }}}

" https://github.com/cespare/vim-toml {{{
" if neobundle#tap('vim-toml')
"   call neobundle#untap()
" endif " }}}

" https://github.com/tpope/vim-unimpaired {{{
" if neobundle#tap('vim-unimpaired')
"   " @todo
"   call neobundle#untap()
" endif " }}}

" https://github.com/Shougo/vimfiler.vim {{{
if neobundle#tap('vimfiler.vim')
  let g:vimfiler_as_default_explorer = 1

  " Fancier icons
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = ' '
  let g:vimfiler_readonly_file_icon = '✗'
  let g:vimfiler_marked_file_icon = '✓'

  autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
  function! s:vimfiler_settings()
    nmap <buffer> <Tab> <Plug>(vimfiler_switch_to_other_window)
  endfunction

  " call vimfiler#custom#profile('default', 'context', {
  "   \ 'safe' : 0,
  "   \ 'auto_expand' : 1,
  "   \ 'parent' : 0,
  "   \ })

  call neobundle#untap()
endif " }}}

" https://github.com/Shougo/vimproc.vim {{{
" if neobundle#tap('vimproc.vim')
"   call neobundle#untap()
" endif " }}}

" https://github.com/mattn/webapi-vim {{{
" if neobundle#tap('webapi-vim')
"   call neobundle#untap()
" endif " }}}
