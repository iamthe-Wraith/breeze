" Breeze Theme: {{{
"
" https://github.com/iamthe-Wraith/breeze
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Trevor Heins <@heinst>
" @author Éverton Ribeiro <nuxlli@gmail.com>
" @author Derek Sifford <dereksifford@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'breeze'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:breeze#palette.fg

let s:bglighter = g:breeze#palette.bglighter
let s:bglight   = g:breeze#palette.bglight
let s:bg        = g:breeze#palette.bg
let s:bgdark    = g:breeze#palette.bgdark
let s:bgdarker  = g:breeze#palette.bgdarker

let s:comment   = g:breeze#palette.comment
let s:selection = g:breeze#palette.selection
let s:subtle    = g:breeze#palette.subtle

let s:blue1     = g:breeze#palette.blue1
let s:blue2     = g:breeze#palette.blue2
let s:blue3     = g:breeze#palette.blue3

let s:green     = g:breeze#palette.green
let s:orange    = g:breeze#palette.orange
let s:pink      = g:breeze#palette.pink
let s:purple    = g:breeze#palette.purple
let s:red       = g:breeze#palette.red
let s:yellow    = g:breeze#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:breeze#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:breeze#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:breeze_bold')
  let g:breeze_bold = 1
endif

if !exists('g:breeze_italic')
  let g:breeze_italic = 1
endif

if !exists('g:breeze_underline')
  let g:breeze_underline = 1
endif

if !exists('g:breeze_undercurl') && g:breeze_underline != 0
  let g:breeze_undercurl = 1
endif

if !exists('g:breeze_inverse')
  let g:breeze_inverse = 1
endif

if !exists('g:breeze_colorterm')
  let g:breeze_colorterm = 1
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:breeze_bold == 1 ? 'bold' : 0,
      \ 'italic': g:breeze_italic == 1 ? 'italic' : 0,
      \ 'underline': g:breeze_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:breeze_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:breeze_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " Falls back to coloring foreground group on terminals because
  " nearly all do not support undercurl
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !has('gui_running')
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" Breeze Highlight Groups: {{{2

call s:h('BreezeBgLight', s:none, s:bglight)
call s:h('BreezeBgLighter', s:none, s:bglighter)
call s:h('BreezeBgDark', s:none, s:bgdark)
call s:h('BreezeBgDarker', s:none, s:bgdarker)

call s:h('BreezeFg', s:fg)
call s:h('BreezeFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('BreezeFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('BreezeComment', s:comment)
call s:h('BreezeCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('BreezeSelection', s:none, s:selection)

call s:h('BreezeSubtle', s:subtle)

call s:h('BreezeBlue1', s:blue1)
call s:h('BreezeBlue1Italic', s:blue1, s:none, [s:attrs.italic])

call s:h('BreezeBlue2', s:blue2)
call s:h('BreezeBlue2Italic', s:blue2, s:none, [s:attrs.italic])

call s:h('BreezeBlue3', s:blue3)
call s:h('BreezeBlue3Italic', s:blue3, s:none, [s:attrs.italic])

call s:h('BreezeGreen', s:green)
call s:h('BreezeGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('BreezeGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('BreezeGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('BreezeOrange', s:orange)
call s:h('BreezeOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('BreezeOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('BreezeOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('BreezeOrangeInverse', s:bg, s:orange)

call s:h('BreezePink', s:pink)
call s:h('BreezePinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('BreezePurple', s:purple)
call s:h('BreezePurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('BreezePurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('BreezeRed', s:red)
call s:h('BreezeRedInverse', s:fg, s:red)

call s:h('BreezeYellow', s:yellow)
call s:h('BreezeYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('BreezeError', s:red, s:none, [], s:red)

call s:h('BreezeErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('BreezeWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('BreezeInfoLine', s:none, s:none, [s:attrs.undercurl], s:blue1)

call s:h('BreezeTodo', s:blue1, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('BreezeSearch', s:green, s:none, [s:attrs.inverse])
call s:h('BreezeBoundary', s:comment, s:bgdark)
call s:h('BreezeLink', s:blue1, s:none, [s:attrs.underline])

call s:h('BreezeDiffChange', s:orange, s:none)
call s:h('BreezeDiffText', s:bg, s:orange)
call s:h('BreezeDiffDelete', s:orange, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:breeze_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  BreezeBgDark
hi! link CursorColumn BreezeLine
hi! link CursorLineNr BreezeBlue3
hi! link DiffAdd      BreezeBlue1
hi! link DiffAdded    DiffAdd
hi! link DiffChange   BreezeDiffChange
hi! link DiffDelete   BreezeDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     BreezeDiffText
hi! link Directory    BreezeBlue3
hi! link ErrorMsg     BreezeRedInverse
hi! link FoldColumn   BreezeSubtle
hi! link Folded       BreezeBoundary
hi! link IncSearch    BreezeOrangeInverse
hi! link LineNr       BreezeComment
hi! link MoreMsg      BreezeFgBold
hi! link NonText      BreezeSubtle
hi! link Pmenu        BreezeBgDark
hi! link PmenuSbar    BreezeBgDark
hi! link PmenuSel     BreezeSelection
hi! link PmenuThumb   BreezeSelection
hi! link Question     BreezeFgBold
hi! link Search       BreezeSearch
hi! link SignColumn   BreezeComment
hi! link TabLine      BreezeBoundary
hi! link TabLineFill  BreezeBgDarker
hi! link TabLineSel   Normal
hi! link Title        BreezeGreenBold
hi! link VertSplit    BreezeBoundary
hi! link Visual       BreezeSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   BreezeOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:blue1, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey BreezeRed
  hi! link LspDiagnosticsUnderline BreezeFgUnderline
  hi! link LspDiagnosticsInformation BreezeOrange
  hi! link LspDiagnosticsHint BreezeOrange
  hi! link LspDiagnosticsError BreezeError
  hi! link LspDiagnosticsWarning BreezeOrange
  hi! link LspDiagnosticsUnderlineError BreezeErrorLine
  hi! link LspDiagnosticsUnderlineHint BreezeInfoLine
  hi! link LspDiagnosticsUnderlineInformation BreezeInfoLine
  hi! link LspDiagnosticsUnderlineWarning BreezeWarnLine
else
  hi! link SpecialKey BreezeSubtle
endif

hi! link Comment BreezeComment
hi! link Underlined BreezeFgUnderline
hi! link Todo BreezeTodo

hi! link Error BreezeError
hi! link SpellBad BreezeErrorLine
hi! link SpellLocal BreezeWarnLine
hi! link SpellCap BreezeInfoLine
hi! link SpellRare BreezeInfoLine

" javascript:
"   null,
"   numbers
hi! link Constant BreezeBlue3
hi! link String BreezeBlue3
hi! link Character BreezeBlue1
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier BreezeFg
hi! link Function BreezeOrange

hi! link Statement BreezeBlue1
hi! link Conditional BreezeBlue1
hi! link Repeat BreezeBlue1
hi! link Label BreezeBlue1
hi! link Operator BreezeBlue1
hi! link Keyword BreezeOrange
hi! link Exception BreezeBlue1

hi! link PreProc BreezeBlue1
hi! link Include BreezeBlue1
hi! link Define BreezeBlue1
hi! link Macro BreezeBlue1
hi! link PreCondit BreezeBlue1
hi! link StorageClass BreezeBlue1
hi! link Structure BreezeBlue1
hi! link Typedef BreezeBlue1

hi! link Type BreezeOrangeItalic

hi! link Delimiter BreezeFg

hi! link Special BreezeBlue1
hi! link SpecialComment BreezeOrangeItalic
hi! link Tag BreezeOrange
hi! link helpHyperTextJump BreezeLink
hi! link helpCommand BreezeBlue3
hi! link helpExample BreezeGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et:
