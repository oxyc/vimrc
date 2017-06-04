let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if !dein#load_state('$VIM_BUNDLE')
  finish
endif

call dein#begin('$VIM_BUNDLE')
" Install vimproc for parallel downloads.
call dein#add('Shougo/vimproc.vim', { 'build': 'make' })

" Install plugins.
call dein#load_toml('$VIM_DIR/dein.toml')

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  call dein#install()
endif
