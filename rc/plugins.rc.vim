" Plugins
" ---------------------------------------------------------------------------

" https://github.com/jiangmiao/auto-pairs {{{
if dein#tap('auto-pairs')
  let g:AutoPairsFlyMode = 0
  let g:AutoPairsMultilineClose = 0
endif " }}}

" https://github.com/rhysd/clever-f.vim {{{
if dein#tap('clever-f.vim')
  let g:clever_f_smart_case = 1
  let g:clever_f_chars_match_any_signs = ';'
endif " }}}

" https://github.com/rhysd/committia.vim {{{
if dein#tap('committia.vim')
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
endif " }}}

" https://github.com/Shougo/echodoc.vim {{{
if dein#tap('echodoc.vim')
  let g:echodoc_enable_at_startup = 1
endif " }}}

" https://github.com/othree/html5.vim {{{
" if dein#tap('html5.vim')
"
" endif " }}}

" https://github.com/tmhedberg/matchit {{{
if dein#tap('matchit')
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
endif " }}}

" https://github.com/Shougo/neomru.vim {{{
if dein#tap('neomru.vim')
  let neomru_dir = $VIM_CACHE.'/vim-neomru'
  if !isdirectory(neomru_dir)
    call mkdir(neomru_dir, 'p')
  endif

  let g:neomru#directory_mru_path = neomru_dir.'/dir'
  let g:neomru#file_mru_path = neomru_dir.'/file'
endif " }}}

" https://github.com/Shougo/neocomplete.vim {{{
if dein#tap('neocomplete.vim')
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
endif " }}}

" https://github.com/Shougo/neocomplete.vim {{{
if dein#tap('deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  " Begin autocompleting at 1 character
  let g:deoplete#auto_complete_start_leng = 1
  " auto_select id done with completeopt+=noinsert

  " Maximum targets
  let g:deoplete#max_list = 10
endif " }}}

" https://github.com/Shougo/neosnippet.vim {{{
if dein#tap('neosnippet.vim')
  "let g:neosnippet#snippets_directory = $VIM_CACHE.'/vim-neosnippet'
  let g:neosnippet#data_directory = $VIM_CACHE.'/vim-neosnippet'
  let g:neosnippet#enable_preview = 1
endif " }}}

" https://github.com/tyru/open-browser.vim {{{
" if dein#tap('open-browser.vim')
" endif " }}}

" https://github.com/shawncplus/phpcomplete.vim {{{
" if dein#tap('phpcomplete.vim')
" endif " }}}

" https://github.com/junegunn/rainbow_parentheses.vim {{{
" if dein#tap('rainbow_parentheses.vim')
" endif " }}}

" https://github.com/scrooloose/syntastic {{{
if dein#tap('syntastic')
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
endif " }}}

" https://github.com/mbbill/undotree {{{
if dein#tap('undotree')
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_SplitWidth = 35
  let g:undotree_DiffpanelHeight = 20
endif " }}}

" https://github.com/Shougo/unite.vim {{{
if dein#tap('unite.vim')

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

  if exists('unite#custom#profile')
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
  endif

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
endif " }}}

" https://github.com/osyo-manga/unite-quickfix {{{
" if dein#tap('unite-quickfix')
" endif " }}}}

" https://github.com/bling/vim-airline {{{
if dein#tap('vim-airline')
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
endif " }}}

" https://github.com/tpope/vim-commentary {{{
" if dein#tap('vim-commentary')
" endif " }}}

" https://github.com/skammer/vim-css-color {{{
" if dein#tap('vim-css-color')
" endif " }}}

" https://github.com/hail2u/vim-css3-syntax {{{
" if dein#tap('vim-css3-syntax')
" endif " }}}

" https://github.com/qbbr/vim-twig {{{
" if dein#tap('vim-twig')
" endif " }}}

" https://github.com/twe4ked/vim-diff-toggle {{{
if dein#tap('vim-diff-toggle')
endif " }}}

" https://github.com/junegunn/vim-easy-align {{{
" if dein#tap('vim-easy-align')
" endif " }}}

" https://github.com/Lokaltog/vim-easymotion {{{
if dein#tap('vim-easymotion')
  let g:EasyMotion_smartcase = 1
  " keep cursor colum when JK motion"
  let g:EasyMotion_startofline = 0
  " remove ; as a target, as it's difficult to press on swedish keyboard.
  let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
endif " }}}

" https://github.com/tpope/vim-endwise {{{
" if dein#tap('vim-endwise')
" endif " }}}

" https://github.com/lambdalisue/vim-gista {{{
if dein#tap('vim-gista')
  let g:gista#github_user = 'oxyc'
  let g:gista#default_yank_method = 'url'
  " Yank the URL autmatically on save
  let g:gista#auto_yank_after_post = 1
  let g:gista#auto_yank_after_save = 1
endif " }}}

" https://github.com/lambdalisue/vim-gita {{{
" if dein#tap('vim-gita')
" endif " }}}

" https://github.com/pangloss/vim-javascript {{{
if dein#tap('vim-javascript')
  " Highlight HTML and CSS within JavaScript
  let javascript_enable_domhtmlcss = 1
  let b:javascript_fold = 1
endif " }}}

" https://github.com/elzr/vim-json {{{
if dein#tap('vim-json')
  let g:vim_json_syntax_conceal = 0
endif " }}}

" https://github.com/jtratner/vim-flavored-markdown {{{
" if dein#tap('vim-flavored-markdown')
" endif " }}}

" https://github.com/qstrahl/vim-matchmaker {{{
if dein#tap('vim-matchmaker')
  let g:matchmaker_enable_startup = 1
  " Avoid conflicts with EasyMotion
  let g:matchmaker_matchpriority = 0
endif " }}}

" https://github.com/superbrothers/vim-quickrun-markdown-gfm {{{
if dein#tap('vim-quickrun-markdown-gfm')
  if !exists('g:quickrun_config')
    let g:quickrun_config = {}
  endif

  let g:quickrun_config['markdown'] = {
    \   'type': 'markdown/gfm',
    \   'outputter': 'browser'
    \ }
endif " }}}

" https://github.com/thinca/vim-quickrun {{{
if dein#tap('vim-quickrun')
  let g:quickrun_no_default_key_mappings = 1
endif " }}}
"
" https://github.com/tpope/vim-repeat {{{
" if dein#tap('vim-repeat')
" endif " }}}

" https://github.com/kshenoy/vim-signature {{{
" if dein#tap('vim-signature')
" endif " }}}

" https://github.com/mhinz/vim-signify {{{
if dein#tap('vim-signify')
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
endif " }}}

" https://github.com/tpope/vim-speeddating {{{
" if dein#tap('vim-speeddating')
" endif " }}}

" https://github.com/tpope/vim-surround {{{
" if dein#tap('vim-surround')
" endif " }}}

" https://github.com/cespare/vim-toml {{{
" if dein#tap('vim-toml')
" endif " }}}

" https://github.com/tpope/vim-unimpaired {{{
" if dein#tap('vim-unimpaired')
"   " @todo
" endif " }}}

" https://github.com/Shougo/vimfiler.vim {{{
if dein#tap('vimfiler.vim')
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
endif " }}}

" https://github.com/Shougo/vimproc.vim {{{
" if dein#tap('vimproc.vim')
" endif " }}}

" https://github.com/mattn/webapi-vim {{{
" if dein#tap('webapi-vim')
" endif " }}}
