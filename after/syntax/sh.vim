if breeze#should_abort('bash', 'ksh', 'posix', 'sh')
    finish
endif

hi! link shCommandSub NONE
hi! link shEscape     BreezeOrange
hi! link shParen      NONE
hi! link shParenError NONE
