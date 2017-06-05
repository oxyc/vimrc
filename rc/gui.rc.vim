function! s:is_mac() abort
  return has('mac') || has('macunix') || has('gui_macvim')
    \ || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

" Inconsolata
if s:is_mac()
  set guifont=Inconsolata-dz\ for\ Powerline:h9
endif

" Hide some widgets
set guioptions=aAce
