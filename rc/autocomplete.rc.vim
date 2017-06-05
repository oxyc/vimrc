let s:has_neosnippet = dein#tap('neosnippet.vim')
let s:has_neocomplete = dein#tap('neocomplete.vim')
let s:has_deoplete = dein#tap('deoplete.nvim')

function! s:can_snip()
  return s:has_neosnippet && neosnippet#expandable_or_jumpable() && &filetype != "snippet"
endfunction

function! s:close_popup()
  if s:has_neocomplete | return neocomplete#smart_close_popup() | endif
  if s:has_deoplete | return deoplete#smart_close_popup() | endif
endfunction

function! s:manual_complete()
  if s:has_neocomplete | return neocomplete#start_manual_complete() | endif
  if s:has_deoplete | return deoplete#manual_complete() | endif
endfunction

function! s:undo_completion()
  if s:has_neocomplete | return neocomplete#undo_completion() | endif
  if s:has_deoplete | return deoplete#undo_completion() | endif
endfunction

function! s:complete_common_string()
  if s:has_neocomplete | return neocomplete#complete_common_string() | endif
  if s:has_deoplete | return deoplete#refresh() | endif
endfunction

function! s:cancel_popup()
  if s:has_neocomplete | return neocomplete#cancel_popup() | endif
  if s:has_deoplete | return deoplete#cancel_popup() | endif
endfunction

let s:pair_closes = ["]", "}", ")", "'", '"', ">", "|" , ","]
let s:pair_opens = ["[", "{", "("]
let s:char_skip = ['"', "'"]

function! s:imap_tab()
  " @todo neocomplete#complete_common_string()
  if s:has_neosnippet && neosnippet#expandable()
    call s:close_popup()
    return "\<Plug>(neosnippet_expand)"
  elseif s:has_neosnippet && neosnippet#jumpable()
    call s:close_popup()
    return "\<Plug>(neosnippet_jump)"
  elseif pumvisible()
    call s:close_popup()
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

  " Insert a tab as last resort.
  return "\<Tab>"
endfunction

" Magic tab-completion in insert mode
imap <expr><Tab> <SID>imap_tab()
if dein#tap('neocomplete.vim') || dein#tap('deoplete.nvim')
  " Close popup and delete backword char.
  inoremap <expr> <C-h> <SID>close_popup()."\<C-h>"
  inoremap <expr> <BS> <SID>close_popup()."\<C-h>"

  " Select the next entry in the popup
  inoremap <expr> <S-tab> pumvisible() ? "\<C-n>" : <SID>manual_complete()
  " Select the previous entry in the popup
  inoremap <expr> <C-tab> pumvisible() ? "\<C-p>" : <SID>manual_complete()

  inoremap <expr><C-g> <SID>undo_completion()
  inoremap <expr><C-l> <SID>complete_common_string()

  " Let <cr> cancel any completion and just input a new line
  imap <silent> <cr> <C-r>=<SID>imap_cr()<CR>
  function! s:imap_cr()
    return <SID>cancel_popup() . "\<cr>"
  endfunction
endif

" Expand neosnippets in select mode
smap <expr><Tab> <SID>can_snip() ? "\<Plug>(neosnippet_jump_or_expand)" : "\<Tab>"
