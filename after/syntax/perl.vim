if breeze#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       BreezeOrange

" Builtin functions
hi! link perlOperator            BreezeBlue3
hi! link perlStatementFiledesc   BreezeBlue3
hi! link perlStatementFiles      BreezeBlue3
hi! link perlStatementFlow       BreezeBlue3
hi! link perlStatementHash       BreezeBlue3
hi! link perlStatementIOfunc     BreezeBlue3
hi! link perlStatementIPC        BreezeBlue3
hi! link perlStatementList       BreezeBlue3
hi! link perlStatementMisc       BreezeBlue3
hi! link perlStatementNetwork    BreezeBlue3
hi! link perlStatementNumeric    BreezeBlue3
hi! link perlStatementProc       BreezeBlue3
hi! link perlStatementPword      BreezeBlue3
hi! link perlStatementRegexp     BreezeBlue3
hi! link perlStatementScalar     BreezeBlue3
hi! link perlStatementSocket     BreezeBlue3
hi! link perlStatementTime       BreezeBlue3
hi! link perlStatementVector     BreezeBlue3

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd BreezeOrange
endif

" Signatures
hi! link perlSignature           BreezeOrangeItalic
hi! link perlSubPrototype        BreezeOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName BreezeBlue1
