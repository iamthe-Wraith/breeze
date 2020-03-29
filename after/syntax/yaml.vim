if breeze#should_abort('yaml')
    finish
endif

hi! link yamlAlias           BreezeGreenItalicUnderline
hi! link yamlAnchor          BreezeBlue1Italic
hi! link yamlBlockMappingKey BreezeBlue1
hi! link yamlFlowCollection  BreezeBlue1
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         BreezeBlue1
hi! link yamlPlainScalar     BreezeBlue3

