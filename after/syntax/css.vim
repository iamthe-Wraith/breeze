if breeze#should_abort('css')
    finish
endif

hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        BreezePink
hi! link cssAttributeSelector BreezeBlue1
hi! link cssBraces            Delimiter
hi! link cssFunctionComma     Delimiter
hi! link cssNoise             BreezeBlue3
hi! link cssProp              BreezeFG
hi! link cssPseudoClass       BreezeBlue3
hi! link cssPseudoClassId     BreezeBlue3Italic
hi! link cssUnitDecorators    BreezeBlue3
hi! link cssVendor            BreezeBlue3Italic
