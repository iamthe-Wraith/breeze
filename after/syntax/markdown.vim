if breeze#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown {{{1
  hi! link htmlBold       BreezeOrangeBold
  hi! link htmlBoldItalic BreezeOrangeBoldItalic
  hi! link htmlH1         BreezeBlue3
  hi! link htmlItalic     BreezeOrangeItalic
  hi! link mkdBlockquote  BreezeOrangeItalic
  hi! link mkdBold        BreezeOrangeBold
  hi! link mkdBoldItalic  BreezeOrangeBoldItalic
  hi! link mkdCode        BreezeBlue2
  hi! link mkdCodeEnd     BreezeBlue2
  hi! link mkdCodeStart   BreezeBlue2
  hi! link mkdHeading     BreezeBlue3Bold
  hi! link mkdInlineUrl   BreezeLink
  hi! link mkdItalic      BreezeOrangeItalic
  hi! link mkdLink        BreezeOrange
  hi! link mkdListItem    BreezeBlue1
  hi! link mkdRule        BreezeComment
  hi! link mkdUrl         BreezeLink
"}}}1
elseif b:current_syntax ==# 'markdown'
" Builtin: {{{1
  hi! link markdownBlockquote        BreezeBlue1
  hi! link markdownBold              BreezeOrangeBold
  hi! link markdownBoldItalic        BreezeOrangeBoldItalic
  hi! link markdownCodeBlock         BreezeBlue2
  hi! link markdownCode              BreezeBlue2
  hi! link markdownCodeDelimiter     BreezeBlue2
  hi! link markdownH1                BreezeBlue3Bold
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            BreezeOrangeItalic
  hi! link markdownLinkText          BreezeOrange
  hi! link markdownListMarker        BreezeBlue1
  hi! link markdownOrderedListMarker BreezeBlue1
  hi! link markdownRule              BreezeComment
  hi! link markdownUrl               BreezeLink
"}}}
endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
