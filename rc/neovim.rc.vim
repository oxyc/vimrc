if has('vim_starting') && empty(argv())
  syntax off
endif

" Shows the effects of a command incrementally, as you type.
if exists('&inccommand')
  set inccommand=nosplit
endif
" Share the histories
autocmd MyAutoCmd CursorHold * if exists(':rshada') | rshada | wshada | endif
"
" Modifiable terminal
autocmd MyAutoCmd TermOpen * setlocal modifiable

let g:terminal_scrollback_buffer_size = 3000
