Ack
---
```
,a   :Ack!
,?   Ack for last search
```

*Quickfix window*
```
o    to open (same as enter)
go   to preview file (open but maintain focus on ack.vim results)
t    to open in new tab
T    to open in new tab silently
h    to open in horizontal split
H    to open in horizontal split silently
v    to open in vertical split
gv   to open in vertical split silently
q    to close the quickfix window
```

Clam.vim
--------
```
!    Run command
,,r  Refresh
,,p  Pipe
```

Gist-vim
--------
```
:Gist     Post buffer
:Gist -p  Private
:Gist -a  Anonymous
:Gist -m  All open buffers
:Gist -e  Edit gist
:Gist -l  List public gists
:Gist -d  Delete gist
```

Gundo.vim
---------
```
,gu       Toggle Gundo
```

neocomplete.vim
---------------
```
<CR>, <Tab>, <Space>  Expand, jump, etc.
C-h, <BS>  Smart close popup
C-y        Close popup
C-e        Cancel popup
C-g        Undo completion
C-l        Complete common string
```

Syntastic
---------
```
,s          Toggle syntastic
```

Tabularize
----------
```
:Tab/:      Tabularize on :
:Tab/:\zs   Tabularize but align :
```

Tcomment vim
------------
```
C-_C-_  Toggle comment
C-_b      Block comment
```

Tern for vim
------------
@TODO

Unite
-------------
```
,f          Files
,m          Most recently used
,b          Buffers
,y          Yankring
,g          Grep
,o          Outline
,l          Lines
,c          Custom
```

*Unite buffer*
```
C-j         Next line
C-k         Previous line
C-x         Split
C-v         Vsplit
C-t         New tab
<esc>       exit
jj          insert leave
<tab>       next line
C-p         Toggle preview
```

vim-diff-toggle
---------------
```
<space>     Toggle add/del in diff
```

vim-easymotion
--------------
```
,,f{char}   Find {char} to the right. See |f|.
,,F{char}   Find {char} to the left. See |F|.
,,t{char}   Till before the {char} to the right. See |t|.
,,T{char}   Till after the {char} to the left. See |T|.
,,w         Beginning of word forward. See |w|.
,,W         Beginning of WORD forward. See |W|.
,,b         Beginning of word backward. See |b|.
,,B         Beginning of WORD backward. See |B|.
,,e         End of word forward. See |e|.
,,E         End of WORD forward. See |E|.
,,ge        End of word backward. See |ge|.
,,gE        End of WORD backward. See |gE|.
,,j         Line downward. See |j|.
,,k         Line upward. See |k|.
,,n         Jump to latest "/" or "?" forward. See |n|.
,,N         Jump to latest "/" or "?" backward. See |N|.
```

vim-fugitive
------------
```
,gs         Git status
,gd         Git diff
,gb         Git blame
,gg         Git browse
```

*While in Gstatus*
```
C-n         Next file
C-p         Previous file
<CR>        Edit revision
-           Git add/reset
ca          Commit amend
cc          Commit
D           Vsplit diff
ds          split diff
dv          Vsplit fiff
o           split open
p           git add patch (?)
p           git reset patch (?)
q           close
R           reload
S           vsplit open
```

vim-matchit
-----------
```
%           cycle through matching group
g%          cycle backward through matching group
a%          in visual mode select matching group
[%          go to previous unmatched group
]%          go to next unmatched group
```

vim-surround
------------
```
cs{target}{replace}   Change surrounding
cst{tag}              Change surrounding tag
csw{replace}          Change surround for word
csW{replace}          Change surround for word + skip punctuation
css{replace}          Change surround for sentence
csp{replace}          Change surround for paragraph
cspt{replace}         Change surround for paragraph with tag
ds{target}            Delete surrounding
dst                   Delete surround tag
ysiw{replace}         Add surround for inner word
yss{replace}          Add surround for whole line
ySS{replace}          Add surround for whole line and indent
```

Keybidings
----------
```
C-A         Increase under cursor
C-X         Decrease under cursor
å           ---
Å           ???
C-e         Move window up
C-y         Move window down
C-n         ???
C-hjkl      Window movement
,tn         New tab
S-Tab       Next tab
,ma         Show marks (Plugin, learn marks)
qq          Buffer delete
,W          Save as root
,v          Reselect pasted text
,ss         Clean trailing whitespace
,ii         Toggle invisble characters
,y          ???
,p          ???
,P          ???
,<space>    Clear search
,Al         Align left
,Ac         Align center
,Ar         Align right
,/          Quickfix last search
,as         Aspell
,ass        Aspell swedish
,asf        Aspell finnish
,sc         Spell check
,scs        Spell check swedish
_md         Set markdown etc.
,cc         Toggle copymode
,di         Insert Drupal Doxygen hook
,dc         Insert Drupal Doxygen comment
```

TODO
-----
- Vim unimpaired
- Learn quickfix/tags/etc/etc!

No configuration
-----------------
- html5.vim
- taghighlight
- vim-airline
- vim-css3-syntax
- vim-gitgutter
- vim-haml
- vim-jade
- vim-javascript
- vim-less
- vim-markdown
- vim-matchmaker
- vim-pathogen
- vimproc.vim
- vim-stylus
- webapi-vim
- vim-repeat
