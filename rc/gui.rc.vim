" Inconsolata
if has('mac')
  set guifont=Inconsolata-dz\ for\ Powerline:h9
endif

" Don't focus the window when the mouse pointer is moved.
set nomousefocus
" Hide mouse pointer on insert mode.
set mousehide

" Hide toolbar and menus.
set guioptions-=Tt
set guioptions-=m
" Scrollbar is always off.
set guioptions-=rL
" Not guitablabel.
set guioptions-=e
" Confirm without window.
set guioptions+=c

" Don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0
