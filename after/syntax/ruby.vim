if breeze#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          BreezeOrangeItalic
hi! link rubyBlockParameter         BreezeOrangeItalic
hi! link rubyCurlyBlock             BreezeBlue1
hi! link rubyGlobalVariable         BreezeBlue2
hi! link rubyInstanceVariable       BreezeBlue2Italic
hi! link rubyInterpolationDelimiter BreezeBlue1
hi! link rubyRegexpDelimiter        BreezeOrange
hi! link rubyStringDelimiter        BreezeOrange
