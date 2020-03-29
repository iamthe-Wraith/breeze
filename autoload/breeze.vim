" Palette: {{{

let g:breeze#palette           = {}
let g:breeze#palette.fg        = ['#F8F8F2', 253]

let g:breeze#palette.bglighter = ['#424450', 238]
let g:breeze#palette.bglight   = ['#343746', 237]
let g:breeze#palette.bg        = ['#282A36', 236]
let g:breeze#palette.bgdark    = ['#21222C', 235]
let g:breeze#palette.bgdarker  = ['#191A21', 234]

" let g:breeze#palette.comment   = ['#6272A4',  61]
let g:breeze#palette.comment   = ['#767676', 243]
let g:breeze#palette.selection = ['#44475A', 239]
let g:breeze#palette.subtle    = ['#424450', 238]

" let g:breeze#palette.cyan      = ['#8BE9FD', 117]
let g:breeze#palette.blue1     = ['#005fd7',  26] 
let g:breeze#palette.blue2     = ['#0087d7',  33] 
let g:breeze#palette.blue3     = ['#87d7ff', 117] 

let g:breeze#palette.green     = ['#50FA7B',  84]
let g:breeze#palette.orange    = ['#ff8700', 208]
let g:breeze#palette.pink      = ['#FF79C6', 212]
let g:breeze#palette.purple    = ['#BD93F9', 141]
let g:breeze#palette.red       = ['#FF5555', 203]
let g:breeze#palette.yellow    = ['#F1FA8C', 228]

"
" ANSI
"
let g:breeze#palette.color_0  = '#21222C'
let g:breeze#palette.color_1  = '#FF5555'
let g:breeze#palette.color_2  = '#50FA7B'
let g:breeze#palette.color_3  = '#F1FA8C'
let g:breeze#palette.color_4  = '#BD93F9'
let g:breeze#palette.color_5  = '#FF79C6'
let g:breeze#palette.color_6  = '#8BE9FD'
let g:breeze#palette.color_7  = '#F8F8F2'
let g:breeze#palette.color_8  = '#6272A4'
let g:breeze#palette.color_9  = '#FF6E6E'
let g:breeze#palette.color_10 = '#69FF94'
let g:breeze#palette.color_11 = '#FFFFA5'
let g:breeze#palette.color_12 = '#D6ACFF'
let g:breeze#palette.color_13 = '#FF92DF'
let g:breeze#palette.color_14 = '#A4FFFF'
let g:breeze#palette.color_15 = '#FFFFFF'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! breeze#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'breeze'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
