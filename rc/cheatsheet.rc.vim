let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.cheatsheet = {
  \   'description' : 'Command cheatsheet'
  \ }
let g:unite_source_menu_menus.cheatsheet.command_candidates = [
  \   [',cd                 change current dir',                   'cd %:p:h'],
  \   [',lcd                change current local dir',             'lcd %:p:h'],
  \   [',ti                 toggle inivisble characters',          'set list!'],
  \   [',ma                 dispaly marks',                        'marks'],
  \   [',mc                 find merge conflicts',                 ''],
  \
  \   ['cs"<p>              surround: change surrounding " to <p>', ''],
  \   ['cst"                surround: change surrounding tag to "', ''],
  \   ['ds"                 surround: delete surrounding "',        ''],
  \   ['ds"                 surround: delete surrounding "',        ''],
  \   ['ysiw]               surround: surround inner word with []', ''],
  \   ['yss)                surround: surround line with ()',       ''],
  \   ['S<p> (visual)       surround: surround block with <p>',     ''],
  \
  \   ['<s><s>              folding: toggle',                      'zA'],
  \   ['zM                  folding: close all',                   'zM'],
  \   ['zR                  folding: open all',                    'zR'],
  \   ['zc                  folding: close',                       'zc'],
  \   ['zO                  folding: recursively open top',        'zCzO'],
  \   [',z                  folding: focus',                       'zMzAzz'],
  \
  \   ['f                   clever-f: find next char',             'f'],
  \   ['F                   clever-f: find previous char',         'F'],
  \   ['t                   clever-f: find next (precending)',     't'],
  \   ['T                   clever-f: find previous (precending)', 'T'],
  \
  \   ['%                   matchit: cycle forward',               '%'],
  \   ['a%                  matchit: select matching group',       'a%'],
  \
  \   [',ts                 syntastic: toggle',                    'SyntasticToggle'],
  \   [',tu                 undotree: toggle',                     'UndotreeToggle'],
  \
  \   [',f                  unite: find files',                    'Unite -resume -buffer-name=files    file_rec/async'],
  \   [',m                  unite: find mru files',                'Unite -resume -buffer-name=files    file_mru'],
  \   [',b                  unite: find buffers',                  'Unite -resume -buffer-name=buffers -quick-match buffer'],
  \   [',b                  unite: find yank history',             'Unite -resume -buffer-name=history  history/yank'],
  \   [',b                  unite: grep through files',            'Unite -resume -buffer-name=grep     grep:.'],
  \   [',b                  unite: find line',                     'Unite -resume -buffer-name=line     line'],
  \   [',c                  unite: cheatsheet (this)',             'Unite -silent -winheight=29 -start-insert menu:cheatsheet'],
  \   [',x                  unite: redraw',                        '<Plug>(unite_redraw)'],
  \
  \   ['gcc                 commentary: line',                     '<Plug>CommentaryLine'],
  \   ['gc                  commentary: motion',                   '<Plug>Commentary'],
  \
  \   ['<enter> (visual)    easyalign: interactive',               '<Plug>(LiveEasyAlign)'],
  \   [',a                  easyalign: interactive',               '<Plug>(LiveEasyAlign)'],
  \
  \   ['<s>h                easymotion: backward line',            '<Plug>(easymotion-linebackward)'],
  \   ['<s>l                easymotion: forward line',             '<Plug>(easymotion-forward)'],
  \   ['s                   easymotion: init jump',                '<Plug>(easymotion-s2)'],
  \   ['t                   easymotion: init backwards',           '<Plug>(easymotion-t2)'],
  \
  \   [',gl                 gista: browse',                        'Gista list'],
  \   [',gg                 gista: create or update',              'Gista post'],
  \   [',gp                 gista: create private',                'Gista post --private'],
  \   [',gb                 gista: open in browser',               'Gista browse'],
  \   [',gy                 gista: yank the url',                  'Gista browse --yank'],
  \
  \   ['<s>gs               gina: git status',                     'Gina status'],
  \   ['<s>gc               gina: git commit',                     'Gina commit'],
  \   ['<s>gd               gina: git diff --cached',              'Gina diff --cached'],
  \   ['<s>gD               gina: git diff',                       'Gina diff'],
  \   ['<s>gp               gina: git push',                       'Gina push'],
  \   ['<s>gl               gina: git log',                        'Gina log --pretty=oneline'],
  \   ['<s>gL               gina: git log for current file',       'Gina log --pretty=oneline --'],
  \   ['<s>gb               gina: open in browser',                'Gina browse'],
  \   ['<s>gy               gina: yank the url',                   'Gina browse --yank'],
  \
  \   [',qm                 quickrun: render markdown',            'QuickRun markdown'],
  \   [',qb                 quickrun: execute buffer',             '<Plug>(quickrun)'],
  \
  \   [',fb                 vimfiler: open in buffer',             'VimFiler -invisible'],
  \   [',fe                 vimfiler: open explorer',              'VimFilerExplorer']
  \ ]

nnoremap <silent>[menu]c :Unite -silent -winheight=29 -start-insert menu:cheatsheet<CR>
