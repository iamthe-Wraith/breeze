if breeze#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    BreezeBlue3
hi! link diffNewFile BreezeOrange

hi! link diffAdded   BreezeBlue1
hi! link diffLine    BreezeBlue3Italic
hi! link diffRemoved BreezeOrange

